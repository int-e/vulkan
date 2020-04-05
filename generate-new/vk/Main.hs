module Main
  where

import           Relude                  hiding ( uncons
                                                , Type
                                                , Handle
                                                )
import           Say
import           System.TimeIt
import           Polysemy
import           Polysemy.Fixpoint
import           Polysemy.Input
import           Data.Text.Extra                ( (<+>) )
import           Data.Version

import           Error
import           Marshal
import           Render.SpecInfo
import           Render.Names
import           Render.Element.Write
import           Render.Aggregate
import           Bespoke                        ( assignBespokeModules )
import           Render.Spec
import           Spec.Parse
import           AssignModules
import           Documentation.All
import           Bespoke.RenderParams
import           Bespoke.MarshalParams

main :: IO ()
main =
  (runFinal . embedToFinal @IO . fixpointToFinal @IO . runErr $ go) >>= \case
    Left es -> do
      traverse_ sayErr es
      sayErr (show (length es) <+> "errors")
    Right () -> pure ()
 where
  go :: Sem '[Err , Fixpoint , Embed IO , Final IO] ()
  go = do
    specText <- timeItNamed "Reading spec"
      $ readFileBS "./Vulkan-Docs/xml/vk.xml"

    (spec@Spec {..}, getSize) <- timeItNamed "Parsing spec" $ parseSpec specText

    let allExtensionNames =
          toList (exName <$> specExtensions)
            <> [ "VK_VERSION_" <> show major <> "_" <> show minor
               | Feature {..}      <- toList specFeatures
               , major : minor : _ <- pure $ versionBranch fVersion
               ]
        doLoadDocs = True
    getDocumentation <- if doLoadDocs
      then liftIO $ loadAllDocumentation allExtensionNames
                                         "./Vulkan-Docs"
                                         "./Vulkan-Docs/man"
      else pure (const Nothing)


    runInputConst (renderParams specHandles)
      . withRenderedNames spec
      . withSpecInfo spec getSize
      . withTypeInfo spec
      $ do

          mps <- marshalParams spec

          (ss, us, cs) <- runInputConst mps $ do
            ss <- timeItNamed "Marshaling structs"
              $ traverseV marshalStruct specStructs
            us <- timeItNamed "Marshaling unions"
              $ traverseV marshalStruct specUnions
            cs <- timeItNamed "Marshaling commands"
              $ traverseV marshalCommand specCommands
              -- TODO: Don't use all commands here, just those commands referenced by
              -- features and extensions. Similarly for specs
            pure (ss, us, cs)

          renderElements <-
            timeItNamed "Rendering"
            $   traverse evaluateWHNF
            =<< renderSpec spec getDocumentation ss us cs

          groups <-
            timeItNamed "Segmenting"
            $   assignModules spec
            =<< assignBespokeModules renderElements

          timeItNamed "writing"
            $ renderSegments getDocumentation "out" (mergeElements groups)

