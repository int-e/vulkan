{-# LANGUAGE QuasiQuotes #-}

module VK.ExtensionDepElements
  ( renderExtensionDepElements
  ) where

import           VK.Utils
import           Data.Text.Prettyprint.Doc
import           Data.Vector                    ( Vector )
import qualified Data.Vector                   as V
import           Error
import           Haskell                        ( HName(..) )
import           Relude
import           Render.Element
import           Render.SpecInfo
import           Spec.Types
import           VkModulePrefix
import           Data.Traversable
import Polysemy.Input

renderExtensionDepElements
  :: (HasErr r, HasRenderParams r, HasSpecInfo r)
  => Vector Extension
  -> Sem r RenderElement
renderExtensionDepElements exts = genRe "Extension dependencies" $ do
  tellExplicitModule (vulkanModule ["Extensions", "Dependencies"])
  tellCanFormat
  renderDeps exts
  renderCoreRequirements exts

renderDeps
  :: (HasRenderElem r, HasRenderParams r, HasErr r, HasSpecInfo r)
  => Vector Extension
  -> Sem r ()
renderDeps exts = do
  SpecInfo {..} <- input
  let defaultCase = "_ -> []"
  cases <-
    for [ e | e@Extension {..} <- V.toList exts, not (V.null exDependencies) ]
      $ \Extension {..} -> do
          namePattern <- fst <$> extensionPatterns exName
          let deps = siExtensionDeps exName
          depPatterns <- traverse (fmap fst . extensionPatterns) deps
          traverse_ tellImport (namePattern : depPatterns)
          pure $ pretty namePattern <+> "->" <+> list (pretty <$> depPatterns)
  tellImport (TyConName ":::")
  tellImport ''ByteString
  tellDoc $ vsep
    [ "-- | The set of other extensions required to use this extension"
    , "extensionDependencies :: (\"extensionName\" ::: ByteString) -> [ByteString]"
    , "extensionDependencies = \\case" <> line <> indent
      2
      (vsep (cases <> [defaultCase]))
    ]

renderCoreRequirements
  :: (HasRenderElem r, HasRenderParams r, HasErr r, HasSpecInfo r)
  => Vector Extension
  -> Sem r ()
renderCoreRequirements exts = do
  tellImport (ConName "API_VERSION_1_0")
  let defaultCase = "_ -> API_VERSION_1_0"
  cases <-
    for
        [ (exName, v)
        | Extension {..} <- V.toList exts
        , Just v         <- pure exRequiresCore
        ]
      $ \(name, v) -> do
          namePattern <- fst <$> extensionPatterns name
          tellImport namePattern
          vPat <- versionDoc v
          pure $ pretty namePattern <+> "->" <+> vPat
  tellImport (TyConName ":::")
  tellImport ''Word32
  tellDoc $ vsep
    [ "-- | The minimum required API version to use this extension"
    , "extensionCoreRequirement :: (\"extensionName\" ::: ByteString) -> Word32"
    , "extensionCoreRequirement = \\case" <> line <> indent
      2
      (vsep (cases <> [defaultCase]))
    ]
