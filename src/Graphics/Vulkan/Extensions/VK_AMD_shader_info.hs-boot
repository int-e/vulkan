{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_AMD_shader_info  ( ShaderResourceUsageAMD
                                                      , ShaderStatisticsInfoAMD
                                                      , ShaderInfoTypeAMD
                                                      ) where

import Data.Kind (Type)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (ToCStruct)
data ShaderResourceUsageAMD

instance ToCStruct ShaderResourceUsageAMD
instance Show ShaderResourceUsageAMD

instance FromCStruct ShaderResourceUsageAMD


data ShaderStatisticsInfoAMD

instance ToCStruct ShaderStatisticsInfoAMD
instance Show ShaderStatisticsInfoAMD

instance FromCStruct ShaderStatisticsInfoAMD


data ShaderInfoTypeAMD

