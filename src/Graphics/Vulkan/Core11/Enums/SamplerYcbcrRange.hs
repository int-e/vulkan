{-# language CPP #-}
module Graphics.Vulkan.Core11.Enums.SamplerYcbcrRange  (SamplerYcbcrRange( SAMPLER_YCBCR_RANGE_ITU_FULL
                                                                         , SAMPLER_YCBCR_RANGE_ITU_NARROW
                                                                         , ..
                                                                         )) where

import GHC.Read (choose)
import GHC.Read (expectP)
import GHC.Read (parens)
import GHC.Show (showParen)
import GHC.Show (showString)
import GHC.Show (showsPrec)
import Text.ParserCombinators.ReadPrec ((+++))
import Text.ParserCombinators.ReadPrec (prec)
import Text.ParserCombinators.ReadPrec (step)
import Foreign.Storable (Storable)
import Data.Int (Int32)
import GHC.Read (Read(readPrec))
import Text.Read.Lex (Lexeme(Ident))
import Graphics.Vulkan.Zero (Zero)
-- | VkSamplerYcbcrRange - Range of encoded values in a color space
--
-- = Description
--
-- The formulae for these conversions is described in the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#textures-sampler-YCbCr-conversion-rangeexpand Sampler Y′CBCR Range Expansion>
-- section of the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#textures Image Operations>
-- chapter.
--
-- No range modification takes place if @ycbcrModel@ is
-- 'Graphics.Vulkan.Core11.Enums.SamplerYcbcrModelConversion.SAMPLER_YCBCR_MODEL_CONVERSION_RGB_IDENTITY';
-- the @ycbcrRange@ field of
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'
-- is ignored in this case.
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.AndroidHardwareBufferFormatPropertiesANDROID',
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'
newtype SamplerYcbcrRange = SamplerYcbcrRange Int32
  deriving newtype (Eq, Ord, Storable, Zero)

-- | 'SAMPLER_YCBCR_RANGE_ITU_FULL' specifies that the full range of the
-- encoded values are valid and interpreted according to the ITU “full
-- range” quantization rules.
pattern SAMPLER_YCBCR_RANGE_ITU_FULL = SamplerYcbcrRange 0
-- | 'SAMPLER_YCBCR_RANGE_ITU_NARROW' specifies that headroom and foot room
-- are reserved in the numerical range of encoded values, and the remaining
-- values are expanded according to the ITU “narrow range” quantization
-- rules.
pattern SAMPLER_YCBCR_RANGE_ITU_NARROW = SamplerYcbcrRange 1
{-# complete SAMPLER_YCBCR_RANGE_ITU_FULL,
             SAMPLER_YCBCR_RANGE_ITU_NARROW :: SamplerYcbcrRange #-}

instance Show SamplerYcbcrRange where
  showsPrec p = \case
    SAMPLER_YCBCR_RANGE_ITU_FULL -> showString "SAMPLER_YCBCR_RANGE_ITU_FULL"
    SAMPLER_YCBCR_RANGE_ITU_NARROW -> showString "SAMPLER_YCBCR_RANGE_ITU_NARROW"
    SamplerYcbcrRange x -> showParen (p >= 11) (showString "SamplerYcbcrRange " . showsPrec 11 x)

instance Read SamplerYcbcrRange where
  readPrec = parens (choose [("SAMPLER_YCBCR_RANGE_ITU_FULL", pure SAMPLER_YCBCR_RANGE_ITU_FULL)
                            , ("SAMPLER_YCBCR_RANGE_ITU_NARROW", pure SAMPLER_YCBCR_RANGE_ITU_NARROW)]
                     +++
                     prec 10 (do
                       expectP (Ident "SamplerYcbcrRange")
                       v <- step readPrec
                       pure (SamplerYcbcrRange v)))

