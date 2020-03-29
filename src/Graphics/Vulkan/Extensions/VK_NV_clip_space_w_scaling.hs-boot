{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_NV_clip_space_w_scaling  ( PipelineViewportWScalingStateCreateInfoNV
                                                              , ViewportWScalingNV
                                                              ) where

import Data.Kind (Type)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (ToCStruct)
data PipelineViewportWScalingStateCreateInfoNV

instance ToCStruct PipelineViewportWScalingStateCreateInfoNV
instance Show PipelineViewportWScalingStateCreateInfoNV

instance FromCStruct PipelineViewportWScalingStateCreateInfoNV


data ViewportWScalingNV

instance ToCStruct ViewportWScalingNV
instance Show ViewportWScalingNV

instance FromCStruct ViewportWScalingNV

