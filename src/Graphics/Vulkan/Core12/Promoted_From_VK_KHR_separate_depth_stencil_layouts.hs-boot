{-# language CPP #-}
module Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts  ( AttachmentDescriptionStencilLayout
                                                                                   , AttachmentReferenceStencilLayout
                                                                                   , PhysicalDeviceSeparateDepthStencilLayoutsFeatures
                                                                                   ) where

import Data.Kind (Type)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (ToCStruct)
data AttachmentDescriptionStencilLayout

instance ToCStruct AttachmentDescriptionStencilLayout
instance Show AttachmentDescriptionStencilLayout

instance FromCStruct AttachmentDescriptionStencilLayout


data AttachmentReferenceStencilLayout

instance ToCStruct AttachmentReferenceStencilLayout
instance Show AttachmentReferenceStencilLayout

instance FromCStruct AttachmentReferenceStencilLayout


data PhysicalDeviceSeparateDepthStencilLayoutsFeatures

instance ToCStruct PhysicalDeviceSeparateDepthStencilLayoutsFeatures
instance Show PhysicalDeviceSeparateDepthStencilLayoutsFeatures

instance FromCStruct PhysicalDeviceSeparateDepthStencilLayoutsFeatures

