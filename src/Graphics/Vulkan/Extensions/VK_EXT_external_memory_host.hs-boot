{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_EXT_external_memory_host  ( ImportMemoryHostPointerInfoEXT
                                                               , MemoryHostPointerPropertiesEXT
                                                               , PhysicalDeviceExternalMemoryHostPropertiesEXT
                                                               ) where

import Data.Kind (Type)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (ToCStruct)
data ImportMemoryHostPointerInfoEXT

instance ToCStruct ImportMemoryHostPointerInfoEXT
instance Show ImportMemoryHostPointerInfoEXT

instance FromCStruct ImportMemoryHostPointerInfoEXT


data MemoryHostPointerPropertiesEXT

instance ToCStruct MemoryHostPointerPropertiesEXT
instance Show MemoryHostPointerPropertiesEXT

instance FromCStruct MemoryHostPointerPropertiesEXT


data PhysicalDeviceExternalMemoryHostPropertiesEXT

instance ToCStruct PhysicalDeviceExternalMemoryHostPropertiesEXT
instance Show PhysicalDeviceExternalMemoryHostPropertiesEXT

instance FromCStruct PhysicalDeviceExternalMemoryHostPropertiesEXT

