{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_GGP_frame_token  ( PresentFrameTokenGGP(..)
                                                      , GGP_FRAME_TOKEN_SPEC_VERSION
                                                      , pattern GGP_FRAME_TOKEN_SPEC_VERSION
                                                      , GGP_FRAME_TOKEN_EXTENSION_NAME
                                                      , pattern GGP_FRAME_TOKEN_EXTENSION_NAME
                                                      , GgpFrameToken
                                                      ) where

import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import Data.String (IsString)
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Foreign.Ptr (Ptr)
import Data.Kind (Type)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Extensions.WSITypes (GgpFrameToken)
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PRESENT_FRAME_TOKEN_GGP))
import Graphics.Vulkan.Extensions.WSITypes (GgpFrameToken)
-- | VkPresentFrameTokenGGP - The Google Games Platform frame token
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data PresentFrameTokenGGP = PresentFrameTokenGGP
  { -- | @frameToken@ /must/ be a valid
    -- 'Graphics.Vulkan.Extensions.WSITypes.GgpFrameToken'
    frameToken :: GgpFrameToken }
  deriving (Typeable)
deriving instance Show PresentFrameTokenGGP

instance ToCStruct PresentFrameTokenGGP where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PresentFrameTokenGGP{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PRESENT_FRAME_TOKEN_GGP)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr GgpFrameToken)) (frameToken)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PRESENT_FRAME_TOKEN_GGP)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr GgpFrameToken)) (zero)
    f

instance FromCStruct PresentFrameTokenGGP where
  peekCStruct p = do
    frameToken <- peek @GgpFrameToken ((p `plusPtr` 16 :: Ptr GgpFrameToken))
    pure $ PresentFrameTokenGGP
             frameToken

instance Storable PresentFrameTokenGGP where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero PresentFrameTokenGGP where
  zero = PresentFrameTokenGGP
           zero


type GGP_FRAME_TOKEN_SPEC_VERSION = 1

-- No documentation found for TopLevel "VK_GGP_FRAME_TOKEN_SPEC_VERSION"
pattern GGP_FRAME_TOKEN_SPEC_VERSION :: forall a . Integral a => a
pattern GGP_FRAME_TOKEN_SPEC_VERSION = 1


type GGP_FRAME_TOKEN_EXTENSION_NAME = "VK_GGP_frame_token"

-- No documentation found for TopLevel "VK_GGP_FRAME_TOKEN_EXTENSION_NAME"
pattern GGP_FRAME_TOKEN_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern GGP_FRAME_TOKEN_EXTENSION_NAME = "VK_GGP_frame_token"

