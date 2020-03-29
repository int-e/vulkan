{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_NV_shader_sm_builtins  ( PhysicalDeviceShaderSMBuiltinsFeaturesNV
                                                            , PhysicalDeviceShaderSMBuiltinsPropertiesNV
                                                            ) where

import Data.Kind (Type)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (ToCStruct)
data PhysicalDeviceShaderSMBuiltinsFeaturesNV

instance ToCStruct PhysicalDeviceShaderSMBuiltinsFeaturesNV
instance Show PhysicalDeviceShaderSMBuiltinsFeaturesNV

instance FromCStruct PhysicalDeviceShaderSMBuiltinsFeaturesNV


data PhysicalDeviceShaderSMBuiltinsPropertiesNV

instance ToCStruct PhysicalDeviceShaderSMBuiltinsPropertiesNV
instance Show PhysicalDeviceShaderSMBuiltinsPropertiesNV

instance FromCStruct PhysicalDeviceShaderSMBuiltinsPropertiesNV

