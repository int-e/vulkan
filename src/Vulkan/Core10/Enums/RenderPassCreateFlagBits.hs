{-# language CPP #-}
-- No documentation found for Chapter "RenderPassCreateFlagBits"
module Vulkan.Core10.Enums.RenderPassCreateFlagBits  ( RenderPassCreateFlags
                                                     , RenderPassCreateFlagBits( RENDER_PASS_CREATE_TRANSFORM_BIT_QCOM
                                                                               , ..
                                                                               )
                                                     ) where

import Vulkan.Internal.Utils (enumReadPrec)
import Vulkan.Internal.Utils (enumShowsPrec)
import GHC.Show (showString)
import Numeric (showHex)
import Data.Bits (Bits)
import Data.Bits (FiniteBits)
import Foreign.Storable (Storable)
import GHC.Read (Read(readPrec))
import GHC.Show (Show(showsPrec))
import Vulkan.Core10.FundamentalTypes (Flags)
import Vulkan.Zero (Zero)
type RenderPassCreateFlags = RenderPassCreateFlagBits

-- | VkRenderPassCreateFlagBits - Bitmask specifying additional properties of
-- a renderpass
--
-- = See Also
--
-- 'RenderPassCreateFlags'
newtype RenderPassCreateFlagBits = RenderPassCreateFlagBits Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits, FiniteBits)

-- | 'RENDER_PASS_CREATE_TRANSFORM_BIT_QCOM' specifies that the created
-- renderpass is compatible with
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#vertexpostproc-renderpass-transform render pass transform>.
pattern RENDER_PASS_CREATE_TRANSFORM_BIT_QCOM = RenderPassCreateFlagBits 0x00000002

conNameRenderPassCreateFlagBits :: String
conNameRenderPassCreateFlagBits = "RenderPassCreateFlagBits"

enumPrefixRenderPassCreateFlagBits :: String
enumPrefixRenderPassCreateFlagBits = "RENDER_PASS_CREATE_TRANSFORM_BIT_QCOM"

showTableRenderPassCreateFlagBits :: [(RenderPassCreateFlagBits, String)]
showTableRenderPassCreateFlagBits = [(RENDER_PASS_CREATE_TRANSFORM_BIT_QCOM, "")]

instance Show RenderPassCreateFlagBits where
  showsPrec = enumShowsPrec enumPrefixRenderPassCreateFlagBits
                            showTableRenderPassCreateFlagBits
                            conNameRenderPassCreateFlagBits
                            (\(RenderPassCreateFlagBits x) -> x)
                            (\x -> showString "0x" . showHex x)

instance Read RenderPassCreateFlagBits where
  readPrec = enumReadPrec enumPrefixRenderPassCreateFlagBits
                          showTableRenderPassCreateFlagBits
                          conNameRenderPassCreateFlagBits
                          RenderPassCreateFlagBits

