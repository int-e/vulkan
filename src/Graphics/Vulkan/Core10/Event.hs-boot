{-# language CPP #-}
module Graphics.Vulkan.Core10.Event  (EventCreateInfo) where

import Data.Kind (Type)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (ToCStruct)
data EventCreateInfo

instance ToCStruct EventCreateInfo
instance Show EventCreateInfo

instance FromCStruct EventCreateInfo

