{-# LANGUAGE ApplicativeDo     #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}

module Spec.Savvy.Feature
  ( Features(..)
  , Feature(..)
  , Requirement(..)
  , ConstantExtension(..)
  , P.EnumValueType(..)
  , EnumAlias(..)
  , specFeatures
  , interfaceRequiredNames
  , extractEnumExtensions
  , extractEnumNames
  , extractCommandNames
  , extractEnumAliases
  , extractConstants
  ) where

import           Data.Either.Validation
import           Data.List
import           Data.Maybe
import           Data.Text                 (Text)
import           Data.Traversable
import qualified Spec.Feature              as P
import           Spec.Savvy.Enum.Extension
import           Spec.Savvy.Error
import qualified Spec.Spec                 as P
import           Write.Element

data Features = Features
  { vulkan10Feature :: Feature
  , vulkan11Feature :: Feature
  }
  deriving (Show)

data Feature = Feature
  { fName         :: Text
  , fRequirements :: [Requirement]
  }
  deriving (Show)

data Requirement = Requirement
  { rFeature        :: Maybe Text
  , rComment        :: Maybe Text
  , rRequiredNames  :: [HaskellName]
  , rEnumExtensions :: [(Text, EnumExtension)]
  , rConstants      :: [ConstantExtension]
  , rEnumAliases    :: [EnumAlias]
  , rEnumNames      :: [Text]
  , rCommandNames   :: [Text]
  }
  deriving (Show)

data ConstantExtension = ConstantExtension
  { ceValue   :: P.EnumValueType
  , ceName    :: Text
  , ceComment :: Maybe Text
  }
  deriving (Show)

data EnumAlias = EnumAlias
  { eaExtends :: Text
  , eaName    :: Text
  , eaAlias   :: Text
  , eaComment :: Maybe Text
  }
  deriving(Show)

specFeatures
  :: P.Spec -> Validation [SpecError] Features
specFeatures P.Spec {..} = do
  vulkan10Feature <- extractFeature "VK_VERSION_1_0" sFeatures
  vulkan11Feature <- extractFeature "VK_VERSION_1_1" sFeatures
  pure Features{..}

extractFeature :: Text -> [P.Feature] -> Validation [SpecError] Feature
extractFeature t fs =
  case find ((t ==) . P.fName) fs of
    Nothing -> Failure [UnknownFeature t]
    Just P.Feature{..} -> do
      fRequirements <- traverse extractRequirement [r | P.ARequirement r <- fElements]
      pure Feature{..}

extractRequirement :: P.FeatureRequirement -> Validation [SpecError] Requirement
extractRequirement P.FeatureRequirement {..} = do
  let rFeature       = Nothing
      rComment       = frComment
      rRequiredNames = concatMap interfaceRequiredNames frInterfaces
      rEnumNames     = extractEnumNames frInterfaces
      rCommandNames  = extractCommandNames frInterfaces
      rConstants     = extractConstants frInterfaces
      rEnumAliases   = extractEnumAliases frInterfaces
  rEnumExtensions <- extractEnumExtensions Nothing Nothing frInterfaces

  pure Requirement {..}

interfaceRequiredNames :: P.InterfaceElement -> [HaskellName]
interfaceRequiredNames = filter (`notElem` ignoredTypeNames) . \case
  -- P.AnEnumName              (P.EnumName    n)    -> [Type n, Term n]
  P.AnEnumName (P.EnumName n) -> [Pattern n]
  P.ATypeName (P.TypeName n) ->
    if n `elem` patternsNotTypes then [Pattern n] else [Type n]
  P.ACommandName            (P.CommandName n)            -> [Term n]
  P.AnEnumExtension         P.EnumExtension {..}         -> [Pattern eexName]
  P.ABitmaskExtension       P.BitmaskExtension {..}      -> [Pattern bmxName]
  P.AnEnumAlias P.EnumAlias {..} -> Pattern <$> [eaName, eaAlias]
  P.AnEnumExtensionAbsolute P.EnumExtensionAbsolute {..} -> [Pattern eexaName]
  P.AnEnumValue             P.EnumValue {..}             -> [Pattern evName]
  P.AComment                _                            -> []

-- Names which are not actually exported by the spec
ignoredTypeNames :: [HaskellName]
ignoredTypeNames = [Pattern "VK_API_VERSION"]

-- | Things which should be handled as a Pattern and not a type
patternsNotTypes :: [Text]
patternsNotTypes =
  [ "VK_API_VERSION"
  , "VK_API_VERSION_1_0"
  , "VK_VERSION_MAJOR"
  , "VK_VERSION_MINOR"
  , "VK_VERSION_PATCH"
  , "VK_HEADER_VERSION"
  , "VK_NULL_HANDLE"
  , "VK_API_VERSION_1_1"
  ]

extractEnumExtensions
  :: Maybe Int
  -- ^ The extension number
  -> Maybe Text
  -- ^ The feature attribute
  -> [P.InterfaceElement]
  -- ^ A the interfaces in the requirement
  -> Validation [SpecError] [(Text, EnumExtension)]
extractEnumExtensions extNumber feature interfaces =
  let filter = case feature of
        Just "VK_VERSION_1_1" -> duplicateFilter -- These are sometimes accompanied by a
                                         -- comment mentioning the duplication.
                                         -- TODO!!! return the reexports!
        _                     -> id
      exs = fmap catMaybes . for interfaces $ \case
        P.AnEnumExtension ex ->
          Just <$> extractEnumExtension (fromIntegral <$> extNumber) ex
        P.AnEnumExtensionAbsolute ex ->
          pure $ Just (extractEnumExtensionAbsolute ex)
        P.ABitmaskExtension ex -> pure $ Just (extractBitmaskExtension ex)
        _                      -> pure Nothing
  in  filter <$> exs

duplicateFilter :: [(Text, EnumExtension)] -> [(Text, EnumExtension)]
duplicateFilter =
  let isAllowedDuplicate = (`elem` allowedDuplicates)
  in filter (isAllowedDuplicate . exName . snd)

-- Some things marked as duplicates are actually not...
allowedDuplicates :: [Text]
allowedDuplicates =
  [ "VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT"
  , "VK_SWAPCHAIN_CREATE_PROTECTED_BIT_KHR"
  ]

extractEnumNames :: [P.InterfaceElement] -> [Text]
extractEnumNames interfaces = [ n | P.AnEnumName (P.EnumName n) <- interfaces ]

extractCommandNames :: [P.InterfaceElement] -> [Text]
extractCommandNames interfaces =
  [ n | P.ACommandName (P.CommandName n) <- interfaces ]

extractEnumAliases :: [P.InterfaceElement] -> [EnumAlias]
extractEnumAliases interfaces =
  [ EnumAlias {..} | P.AnEnumAlias P.EnumAlias {..} <- interfaces ]

extractConstants :: [P.InterfaceElement] -> [ConstantExtension]
extractConstants interfaces =
  [ ConstantExtension
      { ceValue   = evValue
      , ceName    = evName
      , ceComment = evComment
      }
  | P.AnEnumValue P.EnumValue {..} <- interfaces
  ]
