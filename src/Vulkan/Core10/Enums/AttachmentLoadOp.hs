{-# language CPP #-}
-- No documentation found for Chapter "AttachmentLoadOp"
module Vulkan.Core10.Enums.AttachmentLoadOp  (AttachmentLoadOp( ATTACHMENT_LOAD_OP_LOAD
                                                              , ATTACHMENT_LOAD_OP_CLEAR
                                                              , ATTACHMENT_LOAD_OP_DONT_CARE
                                                              , ..
                                                              )) where

import Vulkan.Internal.Utils (enumReadPrec)
import Vulkan.Internal.Utils (enumShowsPrec)
import GHC.Show (showsPrec)
import Foreign.Storable (Storable)
import Data.Int (Int32)
import GHC.Read (Read(readPrec))
import GHC.Show (Show(showsPrec))
import Vulkan.Zero (Zero)
-- | VkAttachmentLoadOp - Specify how contents of an attachment are treated
-- at the beginning of a subpass
--
-- = See Also
--
-- 'Vulkan.Core10.Pass.AttachmentDescription',
-- 'Vulkan.Core12.Promoted_From_VK_KHR_create_renderpass2.AttachmentDescription2'
newtype AttachmentLoadOp = AttachmentLoadOp Int32
  deriving newtype (Eq, Ord, Storable, Zero)

-- | 'ATTACHMENT_LOAD_OP_LOAD' specifies that the previous contents of the
-- image within the render area will be preserved. For attachments with a
-- depth\/stencil format, this uses the access type
-- 'Vulkan.Core10.Enums.AccessFlagBits.ACCESS_DEPTH_STENCIL_ATTACHMENT_READ_BIT'.
-- For attachments with a color format, this uses the access type
-- 'Vulkan.Core10.Enums.AccessFlagBits.ACCESS_COLOR_ATTACHMENT_READ_BIT'.
pattern ATTACHMENT_LOAD_OP_LOAD      = AttachmentLoadOp 0
-- | 'ATTACHMENT_LOAD_OP_CLEAR' specifies that the contents within the render
-- area will be cleared to a uniform value, which is specified when a
-- render pass instance is begun. For attachments with a depth\/stencil
-- format, this uses the access type
-- 'Vulkan.Core10.Enums.AccessFlagBits.ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT'.
-- For attachments with a color format, this uses the access type
-- 'Vulkan.Core10.Enums.AccessFlagBits.ACCESS_COLOR_ATTACHMENT_WRITE_BIT'.
pattern ATTACHMENT_LOAD_OP_CLEAR     = AttachmentLoadOp 1
-- | 'ATTACHMENT_LOAD_OP_DONT_CARE' specifies that the previous contents
-- within the area need not be preserved; the contents of the attachment
-- will be undefined inside the render area. For attachments with a
-- depth\/stencil format, this uses the access type
-- 'Vulkan.Core10.Enums.AccessFlagBits.ACCESS_DEPTH_STENCIL_ATTACHMENT_WRITE_BIT'.
-- For attachments with a color format, this uses the access type
-- 'Vulkan.Core10.Enums.AccessFlagBits.ACCESS_COLOR_ATTACHMENT_WRITE_BIT'.
pattern ATTACHMENT_LOAD_OP_DONT_CARE = AttachmentLoadOp 2
{-# complete ATTACHMENT_LOAD_OP_LOAD,
             ATTACHMENT_LOAD_OP_CLEAR,
             ATTACHMENT_LOAD_OP_DONT_CARE :: AttachmentLoadOp #-}

conNameAttachmentLoadOp :: String
conNameAttachmentLoadOp = "AttachmentLoadOp"

enumPrefixAttachmentLoadOp :: String
enumPrefixAttachmentLoadOp = "ATTACHMENT_LOAD_OP_"

showTableAttachmentLoadOp :: [(AttachmentLoadOp, String)]
showTableAttachmentLoadOp =
  [(ATTACHMENT_LOAD_OP_LOAD, "LOAD"), (ATTACHMENT_LOAD_OP_CLEAR, "CLEAR"), (ATTACHMENT_LOAD_OP_DONT_CARE, "DONT_CARE")]

instance Show AttachmentLoadOp where
  showsPrec = enumShowsPrec enumPrefixAttachmentLoadOp
                            showTableAttachmentLoadOp
                            conNameAttachmentLoadOp
                            (\(AttachmentLoadOp x) -> x)
                            (showsPrec 11)

instance Read AttachmentLoadOp where
  readPrec = enumReadPrec enumPrefixAttachmentLoadOp showTableAttachmentLoadOp conNameAttachmentLoadOp AttachmentLoadOp

