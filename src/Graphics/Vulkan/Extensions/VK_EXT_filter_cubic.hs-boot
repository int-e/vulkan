{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_EXT_filter_cubic  ( FilterCubicImageViewImageFormatPropertiesEXT
                                                       , PhysicalDeviceImageViewImageFormatInfoEXT
                                                       ) where

import Data.Kind (Type)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (ToCStruct)
data FilterCubicImageViewImageFormatPropertiesEXT

instance ToCStruct FilterCubicImageViewImageFormatPropertiesEXT
instance Show FilterCubicImageViewImageFormatPropertiesEXT

instance FromCStruct FilterCubicImageViewImageFormatPropertiesEXT


data PhysicalDeviceImageViewImageFormatInfoEXT

instance ToCStruct PhysicalDeviceImageViewImageFormatInfoEXT
instance Show PhysicalDeviceImageViewImageFormatInfoEXT

instance FromCStruct PhysicalDeviceImageViewImageFormatInfoEXT

