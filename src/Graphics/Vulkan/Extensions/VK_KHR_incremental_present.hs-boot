{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_KHR_incremental_present  ( PresentRegionKHR
                                                              , PresentRegionsKHR
                                                              , RectLayerKHR
                                                              ) where

import Data.Kind (Type)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (ToCStruct)
data PresentRegionKHR

instance ToCStruct PresentRegionKHR
instance Show PresentRegionKHR

instance FromCStruct PresentRegionKHR


data PresentRegionsKHR

instance ToCStruct PresentRegionsKHR
instance Show PresentRegionsKHR

instance FromCStruct PresentRegionsKHR


data RectLayerKHR

instance ToCStruct RectLayerKHR
instance Show RectLayerKHR

instance FromCStruct RectLayerKHR

