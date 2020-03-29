{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_NV_cooperative_matrix  ( getPhysicalDeviceCooperativeMatrixPropertiesNV
                                                            , PhysicalDeviceCooperativeMatrixFeaturesNV(..)
                                                            , PhysicalDeviceCooperativeMatrixPropertiesNV(..)
                                                            , CooperativeMatrixPropertiesNV(..)
                                                            , ScopeNV( SCOPE_DEVICE_NV
                                                                     , SCOPE_WORKGROUP_NV
                                                                     , SCOPE_SUBGROUP_NV
                                                                     , SCOPE_QUEUE_FAMILY_NV
                                                                     , ..
                                                                     )
                                                            , ComponentTypeNV( COMPONENT_TYPE_FLOAT16_NV
                                                                             , COMPONENT_TYPE_FLOAT32_NV
                                                                             , COMPONENT_TYPE_FLOAT64_NV
                                                                             , COMPONENT_TYPE_SINT8_NV
                                                                             , COMPONENT_TYPE_SINT16_NV
                                                                             , COMPONENT_TYPE_SINT32_NV
                                                                             , COMPONENT_TYPE_SINT64_NV
                                                                             , COMPONENT_TYPE_UINT8_NV
                                                                             , COMPONENT_TYPE_UINT16_NV
                                                                             , COMPONENT_TYPE_UINT32_NV
                                                                             , COMPONENT_TYPE_UINT64_NV
                                                                             , ..
                                                                             )
                                                            , NV_COOPERATIVE_MATRIX_SPEC_VERSION
                                                            , pattern NV_COOPERATIVE_MATRIX_SPEC_VERSION
                                                            , NV_COOPERATIVE_MATRIX_EXTENSION_NAME
                                                            , pattern NV_COOPERATIVE_MATRIX_EXTENSION_NAME
                                                            ) where

import Control.Exception.Base (bracket)
import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Marshal.Alloc (callocBytes)
import Foreign.Marshal.Alloc (free)
import GHC.Base (when)
import GHC.IO (throwIO)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import GHC.Read (choose)
import GHC.Read (expectP)
import GHC.Read (parens)
import GHC.Show (showParen)
import GHC.Show (showString)
import GHC.Show (showsPrec)
import Text.ParserCombinators.ReadPrec ((+++))
import Text.ParserCombinators.ReadPrec (prec)
import Text.ParserCombinators.ReadPrec (step)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Data.Vector (generateM)
import Data.String (IsString)
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Data.Int (Int32)
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import GHC.Read (Read(readPrec))
import Data.Word (Word32)
import Text.Read.Lex (Lexeme(Ident))
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Data.Vector (Vector)
import Graphics.Vulkan.CStruct.Utils (advancePtrBytes)
import Graphics.Vulkan.Core10.BaseType (bool32ToBool)
import Graphics.Vulkan.Core10.BaseType (boolToBool32)
import Graphics.Vulkan.NamedType ((:::))
import Graphics.Vulkan.Core10.BaseType (Bool32)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetPhysicalDeviceCooperativeMatrixPropertiesNV))
import Graphics.Vulkan.Core10.Handles (PhysicalDevice)
import Graphics.Vulkan.Core10.Handles (PhysicalDevice(..))
import Graphics.Vulkan.Core10.Handles (PhysicalDevice_T)
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Core10.Enums.ShaderStageFlagBits (ShaderStageFlags)
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Exception (VulkanException(..))
import Graphics.Vulkan.Zero (Zero)
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV))
import Graphics.Vulkan.Core10.Enums.Result (Result(SUCCESS))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceCooperativeMatrixPropertiesNV
  :: FunPtr (Ptr PhysicalDevice_T -> Ptr Word32 -> Ptr CooperativeMatrixPropertiesNV -> IO Result) -> Ptr PhysicalDevice_T -> Ptr Word32 -> Ptr CooperativeMatrixPropertiesNV -> IO Result

-- | vkGetPhysicalDeviceCooperativeMatrixPropertiesNV - Returns properties
-- describing what cooperative matrix types are supported
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' is the physical
--     device.
--
-- -   @pPropertyCount@ is a pointer to an integer related to the number of
--     cooperative matrix properties available or queried.
--
-- -   @pProperties@ is either @NULL@ or a pointer to an array of
--     'CooperativeMatrixPropertiesNV' structures.
--
-- = Description
--
-- If @pProperties@ is @NULL@, then the number of cooperative matrix
-- properties available is returned in @pPropertyCount@. Otherwise,
-- @pPropertyCount@ /must/ point to a variable set by the user to the
-- number of elements in the @pProperties@ array, and on return the
-- variable is overwritten with the number of structures actually written
-- to @pProperties@. If @pPropertyCount@ is less than the number of
-- cooperative matrix properties available, at most @pPropertyCount@
-- structures will be written. If @pPropertyCount@ is smaller than the
-- number of cooperative matrix properties available,
-- 'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE' will be returned
-- instead of 'Graphics.Vulkan.Core10.Enums.Result.SUCCESS', to indicate
-- that not all the available cooperative matrix properties were returned.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.PhysicalDevice' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   @pPropertyCount@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If the value referenced by @pPropertyCount@ is not @0@, and
--     @pProperties@ is not @NULL@, @pProperties@ /must/ be a valid pointer
--     to an array of @pPropertyCount@ 'CooperativeMatrixPropertiesNV'
--     structures
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'CooperativeMatrixPropertiesNV',
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
getPhysicalDeviceCooperativeMatrixPropertiesNV :: PhysicalDevice -> IO (Result, ("properties" ::: Vector CooperativeMatrixPropertiesNV))
getPhysicalDeviceCooperativeMatrixPropertiesNV physicalDevice = evalContT $ do
  let vkGetPhysicalDeviceCooperativeMatrixPropertiesNV' = mkVkGetPhysicalDeviceCooperativeMatrixPropertiesNV (pVkGetPhysicalDeviceCooperativeMatrixPropertiesNV (instanceCmds (physicalDevice :: PhysicalDevice)))
  let physicalDevice' = physicalDeviceHandle (physicalDevice)
  pPPropertyCount <- ContT $ bracket (callocBytes @Word32 4) free
  r <- lift $ vkGetPhysicalDeviceCooperativeMatrixPropertiesNV' physicalDevice' (pPPropertyCount) (nullPtr)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pPropertyCount <- lift $ peek @Word32 pPPropertyCount
  pPProperties <- ContT $ bracket (callocBytes @CooperativeMatrixPropertiesNV ((fromIntegral (pPropertyCount)) * 48)) free
  _ <- traverse (\i -> ContT $ pokeZeroCStruct (pPProperties `advancePtrBytes` (i * 48) :: Ptr CooperativeMatrixPropertiesNV) . ($ ())) [0..(fromIntegral (pPropertyCount)) - 1]
  r' <- lift $ vkGetPhysicalDeviceCooperativeMatrixPropertiesNV' physicalDevice' (pPPropertyCount) ((pPProperties))
  lift $ when (r' < SUCCESS) (throwIO (VulkanException r'))
  pPropertyCount' <- lift $ peek @Word32 pPPropertyCount
  pProperties' <- lift $ generateM (fromIntegral (pPropertyCount')) (\i -> peekCStruct @CooperativeMatrixPropertiesNV (((pPProperties) `advancePtrBytes` (48 * (i)) :: Ptr CooperativeMatrixPropertiesNV)))
  pure $ ((r'), pProperties')


-- | VkPhysicalDeviceCooperativeMatrixFeaturesNV - Structure describing
-- cooperative matrix features that can be supported by an implementation
--
-- = Members
--
-- The members of the 'PhysicalDeviceCooperativeMatrixFeaturesNV' structure
-- describe the following features:
--
-- = Description
--
-- If the 'PhysicalDeviceCooperativeMatrixFeaturesNV' structure is included
-- in the @pNext@ chain of
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.PhysicalDeviceFeatures2',
-- it is filled with values indicating whether the feature is supported.
-- 'PhysicalDeviceCooperativeMatrixFeaturesNV' /can/ also be included in
-- the @pNext@ chain of 'Graphics.Vulkan.Core10.Device.DeviceCreateInfo' to
-- enable features.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.BaseType.Bool32',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data PhysicalDeviceCooperativeMatrixFeaturesNV = PhysicalDeviceCooperativeMatrixFeaturesNV
  { -- | @cooperativeMatrix@ indicates that the implementation supports the
    -- @CooperativeMatrixNV@ SPIR-V capability.
    cooperativeMatrix :: Bool
  , -- | @cooperativeMatrixRobustBufferAccess@ indicates that the implementation
    -- supports robust buffer access for SPIR-V @OpCooperativeMatrixLoadNV@ and
    -- @OpCooperativeMatrixStoreNV@ instructions.
    cooperativeMatrixRobustBufferAccess :: Bool
  }
  deriving (Typeable)
deriving instance Show PhysicalDeviceCooperativeMatrixFeaturesNV

instance ToCStruct PhysicalDeviceCooperativeMatrixFeaturesNV where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PhysicalDeviceCooperativeMatrixFeaturesNV{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Bool32)) (boolToBool32 (cooperativeMatrix))
    poke ((p `plusPtr` 20 :: Ptr Bool32)) (boolToBool32 (cooperativeMatrixRobustBufferAccess))
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Bool32)) (boolToBool32 (zero))
    poke ((p `plusPtr` 20 :: Ptr Bool32)) (boolToBool32 (zero))
    f

instance FromCStruct PhysicalDeviceCooperativeMatrixFeaturesNV where
  peekCStruct p = do
    cooperativeMatrix <- peek @Bool32 ((p `plusPtr` 16 :: Ptr Bool32))
    cooperativeMatrixRobustBufferAccess <- peek @Bool32 ((p `plusPtr` 20 :: Ptr Bool32))
    pure $ PhysicalDeviceCooperativeMatrixFeaturesNV
             (bool32ToBool cooperativeMatrix) (bool32ToBool cooperativeMatrixRobustBufferAccess)

instance Storable PhysicalDeviceCooperativeMatrixFeaturesNV where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero PhysicalDeviceCooperativeMatrixFeaturesNV where
  zero = PhysicalDeviceCooperativeMatrixFeaturesNV
           zero
           zero


-- | VkPhysicalDeviceCooperativeMatrixPropertiesNV - Structure describing
-- cooperative matrix properties supported by an implementation
--
-- = Members
--
-- The members of the 'PhysicalDeviceCooperativeMatrixPropertiesNV'
-- structure describe the following implementation-dependent limits:
--
-- = Description
--
-- If the 'PhysicalDeviceCooperativeMatrixPropertiesNV' structure is
-- included in the @pNext@ chain of
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.PhysicalDeviceProperties2',
-- it is filled with the implementation-dependent limits.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.ShaderStageFlagBits.ShaderStageFlags',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data PhysicalDeviceCooperativeMatrixPropertiesNV = PhysicalDeviceCooperativeMatrixPropertiesNV
  { -- | @cooperativeMatrixSupportedStages@ is a bitfield of
    -- 'Graphics.Vulkan.Core10.Enums.ShaderStageFlagBits.ShaderStageFlagBits'
    -- describing the shader stages that cooperative matrix instructions are
    -- supported in. @cooperativeMatrixSupportedStages@ will have the
    -- 'Graphics.Vulkan.Core10.Enums.ShaderStageFlagBits.SHADER_STAGE_COMPUTE_BIT'
    -- bit set if any of the physical device’s queues support
    -- 'Graphics.Vulkan.Core10.Enums.QueueFlagBits.QUEUE_COMPUTE_BIT'.
    cooperativeMatrixSupportedStages :: ShaderStageFlags }
  deriving (Typeable)
deriving instance Show PhysicalDeviceCooperativeMatrixPropertiesNV

instance ToCStruct PhysicalDeviceCooperativeMatrixPropertiesNV where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PhysicalDeviceCooperativeMatrixPropertiesNV{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr ShaderStageFlags)) (cooperativeMatrixSupportedStages)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr ShaderStageFlags)) (zero)
    f

instance FromCStruct PhysicalDeviceCooperativeMatrixPropertiesNV where
  peekCStruct p = do
    cooperativeMatrixSupportedStages <- peek @ShaderStageFlags ((p `plusPtr` 16 :: Ptr ShaderStageFlags))
    pure $ PhysicalDeviceCooperativeMatrixPropertiesNV
             cooperativeMatrixSupportedStages

instance Storable PhysicalDeviceCooperativeMatrixPropertiesNV where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero PhysicalDeviceCooperativeMatrixPropertiesNV where
  zero = PhysicalDeviceCooperativeMatrixPropertiesNV
           zero


-- | VkCooperativeMatrixPropertiesNV - Structure specifying cooperative
-- matrix properties
--
-- = Description
--
-- If some types are preferred over other types (e.g. for performance),
-- they /should/ appear earlier in the list enumerated by
-- 'getPhysicalDeviceCooperativeMatrixPropertiesNV'.
--
-- At least one entry in the list /must/ have power of two values for all
-- of @MSize@, @KSize@, and @NSize@.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'ComponentTypeNV', 'ScopeNV',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getPhysicalDeviceCooperativeMatrixPropertiesNV'
data CooperativeMatrixPropertiesNV = CooperativeMatrixPropertiesNV
  { -- | @MSize@ is the number of rows in matrices A, C, and D.
    mSize :: Word32
  , -- | @NSize@ is the number of columns in matrices B, C, D.
    nSize :: Word32
  , -- | @KSize@ is the number of columns in matrix A and rows in matrix B.
    kSize :: Word32
  , -- | @AType@ /must/ be a valid 'ComponentTypeNV' value
    aType :: ComponentTypeNV
  , -- | @BType@ /must/ be a valid 'ComponentTypeNV' value
    bType :: ComponentTypeNV
  , -- | @CType@ /must/ be a valid 'ComponentTypeNV' value
    cType :: ComponentTypeNV
  , -- | @DType@ /must/ be a valid 'ComponentTypeNV' value
    dType :: ComponentTypeNV
  , -- | @scope@ /must/ be a valid 'ScopeNV' value
    scope :: ScopeNV
  }
  deriving (Typeable)
deriving instance Show CooperativeMatrixPropertiesNV

instance ToCStruct CooperativeMatrixPropertiesNV where
  withCStruct x f = allocaBytesAligned 48 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p CooperativeMatrixPropertiesNV{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word32)) (mSize)
    poke ((p `plusPtr` 20 :: Ptr Word32)) (nSize)
    poke ((p `plusPtr` 24 :: Ptr Word32)) (kSize)
    poke ((p `plusPtr` 28 :: Ptr ComponentTypeNV)) (aType)
    poke ((p `plusPtr` 32 :: Ptr ComponentTypeNV)) (bType)
    poke ((p `plusPtr` 36 :: Ptr ComponentTypeNV)) (cType)
    poke ((p `plusPtr` 40 :: Ptr ComponentTypeNV)) (dType)
    poke ((p `plusPtr` 44 :: Ptr ScopeNV)) (scope)
    f
  cStructSize = 48
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word32)) (zero)
    poke ((p `plusPtr` 20 :: Ptr Word32)) (zero)
    poke ((p `plusPtr` 24 :: Ptr Word32)) (zero)
    poke ((p `plusPtr` 28 :: Ptr ComponentTypeNV)) (zero)
    poke ((p `plusPtr` 32 :: Ptr ComponentTypeNV)) (zero)
    poke ((p `plusPtr` 36 :: Ptr ComponentTypeNV)) (zero)
    poke ((p `plusPtr` 40 :: Ptr ComponentTypeNV)) (zero)
    poke ((p `plusPtr` 44 :: Ptr ScopeNV)) (zero)
    f

instance FromCStruct CooperativeMatrixPropertiesNV where
  peekCStruct p = do
    mSize <- peek @Word32 ((p `plusPtr` 16 :: Ptr Word32))
    nSize <- peek @Word32 ((p `plusPtr` 20 :: Ptr Word32))
    kSize <- peek @Word32 ((p `plusPtr` 24 :: Ptr Word32))
    aType <- peek @ComponentTypeNV ((p `plusPtr` 28 :: Ptr ComponentTypeNV))
    bType <- peek @ComponentTypeNV ((p `plusPtr` 32 :: Ptr ComponentTypeNV))
    cType <- peek @ComponentTypeNV ((p `plusPtr` 36 :: Ptr ComponentTypeNV))
    dType <- peek @ComponentTypeNV ((p `plusPtr` 40 :: Ptr ComponentTypeNV))
    scope <- peek @ScopeNV ((p `plusPtr` 44 :: Ptr ScopeNV))
    pure $ CooperativeMatrixPropertiesNV
             mSize nSize kSize aType bType cType dType scope

instance Storable CooperativeMatrixPropertiesNV where
  sizeOf ~_ = 48
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero CooperativeMatrixPropertiesNV where
  zero = CooperativeMatrixPropertiesNV
           zero
           zero
           zero
           zero
           zero
           zero
           zero
           zero


-- | VkScopeNV - Specify SPIR-V scope
--
-- = Description
--
-- All enum values match the corresponding SPIR-V value.
--
-- = See Also
--
-- 'CooperativeMatrixPropertiesNV'
newtype ScopeNV = ScopeNV Int32
  deriving newtype (Eq, Ord, Storable, Zero)
-- Note that the zero instance does not produce a valid value, passing 'zero' to Vulkan will result in an error

-- | 'SCOPE_DEVICE_NV' corresponds to SPIR-V
-- 'Graphics.Vulkan.Core10.Handles.Device' scope.
pattern SCOPE_DEVICE_NV = ScopeNV 1
-- | 'SCOPE_WORKGROUP_NV' corresponds to SPIR-V @Workgroup@ scope.
pattern SCOPE_WORKGROUP_NV = ScopeNV 2
-- | 'SCOPE_SUBGROUP_NV' corresponds to SPIR-V @Subgroup@ scope.
pattern SCOPE_SUBGROUP_NV = ScopeNV 3
-- | 'SCOPE_QUEUE_FAMILY_NV' corresponds to SPIR-V @QueueFamily@ scope.
pattern SCOPE_QUEUE_FAMILY_NV = ScopeNV 5
{-# complete SCOPE_DEVICE_NV,
             SCOPE_WORKGROUP_NV,
             SCOPE_SUBGROUP_NV,
             SCOPE_QUEUE_FAMILY_NV :: ScopeNV #-}

instance Show ScopeNV where
  showsPrec p = \case
    SCOPE_DEVICE_NV -> showString "SCOPE_DEVICE_NV"
    SCOPE_WORKGROUP_NV -> showString "SCOPE_WORKGROUP_NV"
    SCOPE_SUBGROUP_NV -> showString "SCOPE_SUBGROUP_NV"
    SCOPE_QUEUE_FAMILY_NV -> showString "SCOPE_QUEUE_FAMILY_NV"
    ScopeNV x -> showParen (p >= 11) (showString "ScopeNV " . showsPrec 11 x)

instance Read ScopeNV where
  readPrec = parens (choose [("SCOPE_DEVICE_NV", pure SCOPE_DEVICE_NV)
                            , ("SCOPE_WORKGROUP_NV", pure SCOPE_WORKGROUP_NV)
                            , ("SCOPE_SUBGROUP_NV", pure SCOPE_SUBGROUP_NV)
                            , ("SCOPE_QUEUE_FAMILY_NV", pure SCOPE_QUEUE_FAMILY_NV)]
                     +++
                     prec 10 (do
                       expectP (Ident "ScopeNV")
                       v <- step readPrec
                       pure (ScopeNV v)))


-- | VkComponentTypeNV - Specify SPIR-V cooperative matrix component type
--
-- = See Also
--
-- 'CooperativeMatrixPropertiesNV'
newtype ComponentTypeNV = ComponentTypeNV Int32
  deriving newtype (Eq, Ord, Storable, Zero)

-- | 'COMPONENT_TYPE_FLOAT16_NV' corresponds to SPIR-V @OpTypeFloat@ 16.
pattern COMPONENT_TYPE_FLOAT16_NV = ComponentTypeNV 0
-- | 'COMPONENT_TYPE_FLOAT32_NV' corresponds to SPIR-V @OpTypeFloat@ 32.
pattern COMPONENT_TYPE_FLOAT32_NV = ComponentTypeNV 1
-- | 'COMPONENT_TYPE_FLOAT64_NV' corresponds to SPIR-V @OpTypeFloat@ 64.
pattern COMPONENT_TYPE_FLOAT64_NV = ComponentTypeNV 2
-- | 'COMPONENT_TYPE_SINT8_NV' corresponds to SPIR-V @OpTypeInt@ 8 1.
pattern COMPONENT_TYPE_SINT8_NV = ComponentTypeNV 3
-- | 'COMPONENT_TYPE_SINT16_NV' corresponds to SPIR-V @OpTypeInt@ 16 1.
pattern COMPONENT_TYPE_SINT16_NV = ComponentTypeNV 4
-- | 'COMPONENT_TYPE_SINT32_NV' corresponds to SPIR-V @OpTypeInt@ 32 1.
pattern COMPONENT_TYPE_SINT32_NV = ComponentTypeNV 5
-- | 'COMPONENT_TYPE_SINT64_NV' corresponds to SPIR-V @OpTypeInt@ 64 1.
pattern COMPONENT_TYPE_SINT64_NV = ComponentTypeNV 6
-- | 'COMPONENT_TYPE_UINT8_NV' corresponds to SPIR-V @OpTypeInt@ 8 0.
pattern COMPONENT_TYPE_UINT8_NV = ComponentTypeNV 7
-- | 'COMPONENT_TYPE_UINT16_NV' corresponds to SPIR-V @OpTypeInt@ 16 0.
pattern COMPONENT_TYPE_UINT16_NV = ComponentTypeNV 8
-- | 'COMPONENT_TYPE_UINT32_NV' corresponds to SPIR-V @OpTypeInt@ 32 0.
pattern COMPONENT_TYPE_UINT32_NV = ComponentTypeNV 9
-- | 'COMPONENT_TYPE_UINT64_NV' corresponds to SPIR-V @OpTypeInt@ 64 0.
pattern COMPONENT_TYPE_UINT64_NV = ComponentTypeNV 10
{-# complete COMPONENT_TYPE_FLOAT16_NV,
             COMPONENT_TYPE_FLOAT32_NV,
             COMPONENT_TYPE_FLOAT64_NV,
             COMPONENT_TYPE_SINT8_NV,
             COMPONENT_TYPE_SINT16_NV,
             COMPONENT_TYPE_SINT32_NV,
             COMPONENT_TYPE_SINT64_NV,
             COMPONENT_TYPE_UINT8_NV,
             COMPONENT_TYPE_UINT16_NV,
             COMPONENT_TYPE_UINT32_NV,
             COMPONENT_TYPE_UINT64_NV :: ComponentTypeNV #-}

instance Show ComponentTypeNV where
  showsPrec p = \case
    COMPONENT_TYPE_FLOAT16_NV -> showString "COMPONENT_TYPE_FLOAT16_NV"
    COMPONENT_TYPE_FLOAT32_NV -> showString "COMPONENT_TYPE_FLOAT32_NV"
    COMPONENT_TYPE_FLOAT64_NV -> showString "COMPONENT_TYPE_FLOAT64_NV"
    COMPONENT_TYPE_SINT8_NV -> showString "COMPONENT_TYPE_SINT8_NV"
    COMPONENT_TYPE_SINT16_NV -> showString "COMPONENT_TYPE_SINT16_NV"
    COMPONENT_TYPE_SINT32_NV -> showString "COMPONENT_TYPE_SINT32_NV"
    COMPONENT_TYPE_SINT64_NV -> showString "COMPONENT_TYPE_SINT64_NV"
    COMPONENT_TYPE_UINT8_NV -> showString "COMPONENT_TYPE_UINT8_NV"
    COMPONENT_TYPE_UINT16_NV -> showString "COMPONENT_TYPE_UINT16_NV"
    COMPONENT_TYPE_UINT32_NV -> showString "COMPONENT_TYPE_UINT32_NV"
    COMPONENT_TYPE_UINT64_NV -> showString "COMPONENT_TYPE_UINT64_NV"
    ComponentTypeNV x -> showParen (p >= 11) (showString "ComponentTypeNV " . showsPrec 11 x)

instance Read ComponentTypeNV where
  readPrec = parens (choose [("COMPONENT_TYPE_FLOAT16_NV", pure COMPONENT_TYPE_FLOAT16_NV)
                            , ("COMPONENT_TYPE_FLOAT32_NV", pure COMPONENT_TYPE_FLOAT32_NV)
                            , ("COMPONENT_TYPE_FLOAT64_NV", pure COMPONENT_TYPE_FLOAT64_NV)
                            , ("COMPONENT_TYPE_SINT8_NV", pure COMPONENT_TYPE_SINT8_NV)
                            , ("COMPONENT_TYPE_SINT16_NV", pure COMPONENT_TYPE_SINT16_NV)
                            , ("COMPONENT_TYPE_SINT32_NV", pure COMPONENT_TYPE_SINT32_NV)
                            , ("COMPONENT_TYPE_SINT64_NV", pure COMPONENT_TYPE_SINT64_NV)
                            , ("COMPONENT_TYPE_UINT8_NV", pure COMPONENT_TYPE_UINT8_NV)
                            , ("COMPONENT_TYPE_UINT16_NV", pure COMPONENT_TYPE_UINT16_NV)
                            , ("COMPONENT_TYPE_UINT32_NV", pure COMPONENT_TYPE_UINT32_NV)
                            , ("COMPONENT_TYPE_UINT64_NV", pure COMPONENT_TYPE_UINT64_NV)]
                     +++
                     prec 10 (do
                       expectP (Ident "ComponentTypeNV")
                       v <- step readPrec
                       pure (ComponentTypeNV v)))


type NV_COOPERATIVE_MATRIX_SPEC_VERSION = 1

-- No documentation found for TopLevel "VK_NV_COOPERATIVE_MATRIX_SPEC_VERSION"
pattern NV_COOPERATIVE_MATRIX_SPEC_VERSION :: forall a . Integral a => a
pattern NV_COOPERATIVE_MATRIX_SPEC_VERSION = 1


type NV_COOPERATIVE_MATRIX_EXTENSION_NAME = "VK_NV_cooperative_matrix"

-- No documentation found for TopLevel "VK_NV_COOPERATIVE_MATRIX_EXTENSION_NAME"
pattern NV_COOPERATIVE_MATRIX_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern NV_COOPERATIVE_MATRIX_EXTENSION_NAME = "VK_NV_cooperative_matrix"

