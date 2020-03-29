{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_INTEL_shader_integer_functions2  ( PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL(..)
                                                                      , INTEL_SHADER_INTEGER_FUNCTIONS_2_SPEC_VERSION
                                                                      , pattern INTEL_SHADER_INTEGER_FUNCTIONS_2_SPEC_VERSION
                                                                      , INTEL_SHADER_INTEGER_FUNCTIONS_2_EXTENSION_NAME
                                                                      , pattern INTEL_SHADER_INTEGER_FUNCTIONS_2_EXTENSION_NAME
                                                                      ) where

import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import Data.String (IsString)
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Foreign.Ptr (Ptr)
import Data.Kind (Type)
import Graphics.Vulkan.Core10.BaseType (bool32ToBool)
import Graphics.Vulkan.Core10.BaseType (boolToBool32)
import Graphics.Vulkan.Core10.BaseType (Bool32)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_FUNCTIONS_2_FEATURES_INTEL))
-- | VkPhysicalDeviceShaderIntegerFunctions2FeaturesINTEL - Structure
-- describing shader integer functions that can be supported by an
-- implementation
--
-- = Members
--
-- The members of the 'PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL'
-- structure describe the following features:
--
-- = Description
--
-- If the 'PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL' structure is
-- included in the @pNext@ chain of
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.PhysicalDeviceFeatures2',
-- it is filled with values indicating whether the feature is supported.
-- 'PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL' /can/ also be
-- included in the @pNext@ chain of
-- 'Graphics.Vulkan.Core10.Device.DeviceCreateInfo' to enable features.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.BaseType.Bool32',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL = PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL
  { -- | @shaderIntegerFunctions2@ indicates that the implementation supports the
    -- @ShaderIntegerFunctions2INTEL@ SPIR-V capability.
    shaderIntegerFunctions2 :: Bool }
  deriving (Typeable)
deriving instance Show PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL

instance ToCStruct PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_FUNCTIONS_2_FEATURES_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Bool32)) (boolToBool32 (shaderIntegerFunctions2))
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_INTEGER_FUNCTIONS_2_FEATURES_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Bool32)) (boolToBool32 (zero))
    f

instance FromCStruct PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL where
  peekCStruct p = do
    shaderIntegerFunctions2 <- peek @Bool32 ((p `plusPtr` 16 :: Ptr Bool32))
    pure $ PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL
             (bool32ToBool shaderIntegerFunctions2)

instance Storable PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL where
  zero = PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL
           zero


type INTEL_SHADER_INTEGER_FUNCTIONS_2_SPEC_VERSION = 1

-- No documentation found for TopLevel "VK_INTEL_SHADER_INTEGER_FUNCTIONS_2_SPEC_VERSION"
pattern INTEL_SHADER_INTEGER_FUNCTIONS_2_SPEC_VERSION :: forall a . Integral a => a
pattern INTEL_SHADER_INTEGER_FUNCTIONS_2_SPEC_VERSION = 1


type INTEL_SHADER_INTEGER_FUNCTIONS_2_EXTENSION_NAME = "VK_INTEL_shader_integer_functions2"

-- No documentation found for TopLevel "VK_INTEL_SHADER_INTEGER_FUNCTIONS_2_EXTENSION_NAME"
pattern INTEL_SHADER_INTEGER_FUNCTIONS_2_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern INTEL_SHADER_INTEGER_FUNCTIONS_2_EXTENSION_NAME = "VK_INTEL_shader_integer_functions2"

