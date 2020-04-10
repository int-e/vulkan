{-# language CPP #-}
module Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits  ( FormatFeatureFlagBits( FORMAT_FEATURE_SAMPLED_IMAGE_BIT
                                                                                  , FORMAT_FEATURE_STORAGE_IMAGE_BIT
                                                                                  , FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT
                                                                                  , FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT
                                                                                  , FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT
                                                                                  , FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT
                                                                                  , FORMAT_FEATURE_VERTEX_BUFFER_BIT
                                                                                  , FORMAT_FEATURE_COLOR_ATTACHMENT_BIT
                                                                                  , FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT
                                                                                  , FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT
                                                                                  , FORMAT_FEATURE_BLIT_SRC_BIT
                                                                                  , FORMAT_FEATURE_BLIT_DST_BIT
                                                                                  , FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT
                                                                                  , FORMAT_FEATURE_FRAGMENT_DENSITY_MAP_BIT_EXT
                                                                                  , FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG
                                                                                  , FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT
                                                                                  , FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT
                                                                                  , FORMAT_FEATURE_DISJOINT_BIT
                                                                                  , FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT
                                                                                  , FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT
                                                                                  , FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT
                                                                                  , FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT
                                                                                  , FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT
                                                                                  , FORMAT_FEATURE_TRANSFER_DST_BIT
                                                                                  , FORMAT_FEATURE_TRANSFER_SRC_BIT
                                                                                  , ..
                                                                                  )
                                                           , FormatFeatureFlags
                                                           ) where

import GHC.Read (choose)
import GHC.Read (expectP)
import GHC.Read (parens)
import GHC.Show (showParen)
import GHC.Show (showString)
import Numeric (showHex)
import Text.ParserCombinators.ReadPrec ((+++))
import Text.ParserCombinators.ReadPrec (prec)
import Text.ParserCombinators.ReadPrec (step)
import Data.Bits (Bits)
import Foreign.Storable (Storable)
import GHC.Read (Read(readPrec))
import Text.Read.Lex (Lexeme(Ident))
import Graphics.Vulkan.Core10.BaseType (Flags)
import Graphics.Vulkan.Zero (Zero)
-- | VkFormatFeatureFlagBits - Bitmask specifying features supported by a
-- buffer
--
-- = Description
--
-- The following bits /may/ be set in @linearTilingFeatures@,
-- @optimalTilingFeatures@, and
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkDrmFormatModifierPropertiesEXT drmFormatModifierTilingFeatures>,
-- specifying that the features are supported by
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkImage images>
-- or
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkImageView image views>
-- created with the queried
-- 'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceFormatProperties'::@format@:
--
-- -   'FORMAT_FEATURE_SAMPLED_IMAGE_BIT' specifies that an image view
--     /can/ be
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#descriptorsets-sampledimage sampled from>.
--
-- -   'FORMAT_FEATURE_STORAGE_IMAGE_BIT' specifies that an image view
--     /can/ be used as a
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#descriptorsets-storageimage storage images>.
--
-- -   'FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT' specifies that an image
--     view /can/ be used as storage image that supports atomic operations.
--
-- -   'FORMAT_FEATURE_COLOR_ATTACHMENT_BIT' specifies that an image view
--     /can/ be used as a framebuffer color attachment and as an input
--     attachment.
--
-- -   'FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT' specifies that an image
--     view /can/ be used as a framebuffer color attachment that supports
--     blending and as an input attachment.
--
-- -   'FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT' specifies that an
--     image view /can/ be used as a framebuffer depth\/stencil attachment
--     and as an input attachment.
--
-- -   'FORMAT_FEATURE_BLIT_SRC_BIT' specifies that an image /can/ be used
--     as @srcImage@ for the
--     'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdBlitImage' command.
--
-- -   'FORMAT_FEATURE_BLIT_DST_BIT' specifies that an image /can/ be used
--     as @dstImage@ for the
--     'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdBlitImage' command.
--
-- -   'FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT' specifies that if
--     'FORMAT_FEATURE_SAMPLED_IMAGE_BIT' is also set, an image view /can/
--     be used with a sampler that has either of @magFilter@ or @minFilter@
--     set to 'Graphics.Vulkan.Core10.Enums.Filter.FILTER_LINEAR', or
--     @mipmapMode@ set to
--     'Graphics.Vulkan.Core10.Enums.SamplerMipmapMode.SAMPLER_MIPMAP_MODE_LINEAR'.
--     If 'FORMAT_FEATURE_BLIT_SRC_BIT' is also set, an image can be used
--     as the @srcImage@ to
--     'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdBlitImage' with a
--     @filter@ of 'Graphics.Vulkan.Core10.Enums.Filter.FILTER_LINEAR'.
--     This bit /must/ only be exposed for formats that also support the
--     'FORMAT_FEATURE_SAMPLED_IMAGE_BIT' or 'FORMAT_FEATURE_BLIT_SRC_BIT'.
--
--     If the format being queried is a depth\/stencil format, this bit
--     only specifies that the depth aspect (not the stencil aspect) of an
--     image of this format supports linear filtering, and that linear
--     filtering of the depth aspect is supported whether depth compare is
--     enabled in the sampler or not. If this bit is not present, linear
--     filtering with depth compare disabled is unsupported and linear
--     filtering with depth compare enabled is supported, but /may/ compute
--     the filtered value in an implementation-dependent manner which
--     differs from the normal rules of linear filtering. The resulting
--     value /must/ be in the range [0,1] and /should/ be proportional to,
--     or a weighted average of, the number of comparison passes or
--     failures.
--
-- -   'FORMAT_FEATURE_TRANSFER_SRC_BIT' specifies that an image /can/ be
--     used as a source image for
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#copies copy commands>.
--
-- -   'FORMAT_FEATURE_TRANSFER_DST_BIT' specifies that an image /can/ be
--     used as a destination image for
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#copies copy commands>
--     and
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#clears clear commands>.
--
-- -   'FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT' specifies
--     'Graphics.Vulkan.Core10.Handles.Image' /can/ be used as a sampled
--     image with a min or max
--     'Graphics.Vulkan.Core12.Enums.SamplerReductionMode.SamplerReductionMode'.
--     This bit /must/ only be exposed for formats that also support the
--     'FORMAT_FEATURE_SAMPLED_IMAGE_BIT'.
--
-- -   'Graphics.Vulkan.Extensions.VK_EXT_filter_cubic.FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_EXT'
--     specifies that 'Graphics.Vulkan.Core10.Handles.Image' /can/ be used
--     with a sampler that has either of @magFilter@ or @minFilter@ set to
--     'Graphics.Vulkan.Extensions.VK_EXT_filter_cubic.FILTER_CUBIC_EXT',
--     or be the source image for a blit with @filter@ set to
--     'Graphics.Vulkan.Extensions.VK_EXT_filter_cubic.FILTER_CUBIC_EXT'.
--     This bit /must/ only be exposed for formats that also support the
--     'FORMAT_FEATURE_SAMPLED_IMAGE_BIT'. If the format being queried is a
--     depth\/stencil format, this only specifies that the depth aspect is
--     cubic filterable.
--
-- -   'FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT' specifies that an
--     application /can/ define a
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#samplers-YCbCr-conversion sampler Y′CBCR conversion>
--     using this format as a source, and that an image of this format
--     /can/ be used with a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'
--     @xChromaOffset@ and\/or @yChromaOffset@ of
--     'Graphics.Vulkan.Core11.Enums.ChromaLocation.CHROMA_LOCATION_MIDPOINT'.
--     Otherwise both @xChromaOffset@ and @yChromaOffset@ /must/ be
--     'Graphics.Vulkan.Core11.Enums.ChromaLocation.CHROMA_LOCATION_COSITED_EVEN'.
--     If a format does not incorporate chroma downsampling (it is not a
--     “422” or “420” format) but the implementation supports sampler
--     Y′CBCR conversion for this format, the implementation /must/ set
--     'FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT'.
--
-- -   'FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT' specifies that an
--     application /can/ define a
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#samplers-YCbCr-conversion sampler Y′CBCR conversion>
--     using this format as a source, and that an image of this format
--     /can/ be used with a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'
--     @xChromaOffset@ and\/or @yChromaOffset@ of
--     'Graphics.Vulkan.Core11.Enums.ChromaLocation.CHROMA_LOCATION_COSITED_EVEN'.
--     Otherwise both @xChromaOffset@ and @yChromaOffset@ /must/ be
--     'Graphics.Vulkan.Core11.Enums.ChromaLocation.CHROMA_LOCATION_MIDPOINT'.
--     If neither 'FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT' nor
--     'FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT' is set, the application
--     /must/ not define a
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#samplers-YCbCr-conversion sampler Y′CBCR conversion>
--     using this format as a source.
--
-- -   'FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT'
--     specifies that the format can do linear sampler filtering
--     (min\/magFilter) whilst sampler Y′CBCR conversion is enabled.
--
-- -   'FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT'
--     specifies that the format can have different chroma, min, and mag
--     filters.
--
-- -   'FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT'
--     specifies that reconstruction is explicit, as described in
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#textures-chroma-reconstruction>.
--     If this bit is not present, reconstruction is implicit by default.
--
-- -   'FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT'
--     specifies that reconstruction /can/ be forcibly made explicit by
--     setting
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'::@forceExplicitReconstruction@
--     to 'Graphics.Vulkan.Core10.BaseType.TRUE'. If the format being
--     queried supports
--     'FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT'
--     it /must/ also support
--     'FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT'.
--
-- -   'FORMAT_FEATURE_DISJOINT_BIT' specifies that a multi-planar image
--     /can/ have the
--     'Graphics.Vulkan.Core10.Enums.ImageCreateFlagBits.IMAGE_CREATE_DISJOINT_BIT'
--     set during image creation. An implementation /must/ not set
--     'FORMAT_FEATURE_DISJOINT_BIT' for /single-plane formats/.
--
-- -   'FORMAT_FEATURE_FRAGMENT_DENSITY_MAP_BIT_EXT' specifies that an
--     image view /can/ be used as a
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#renderpass-fragmentdensitymapattachment fragment density map attachment>.
--
-- The following bits /may/ be set in @bufferFeatures@, specifying that the
-- features are supported by
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkBuffer buffers>
-- or
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkBufferView buffer views>
-- created with the queried
-- 'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceProperties'::@format@:
--
-- -   'FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT' specifies that the format
--     /can/ be used to create a buffer view that /can/ be bound to a
--     'Graphics.Vulkan.Core10.Enums.DescriptorType.DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER'
--     descriptor.
--
-- -   'FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT' specifies that the format
--     /can/ be used to create a buffer view that /can/ be bound to a
--     'Graphics.Vulkan.Core10.Enums.DescriptorType.DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER'
--     descriptor.
--
-- -   'FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT' specifies that
--     atomic operations are supported on
--     'Graphics.Vulkan.Core10.Enums.DescriptorType.DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER'
--     with this format.
--
-- -   'FORMAT_FEATURE_VERTEX_BUFFER_BIT' specifies that the format /can/
--     be used as a vertex attribute format
--     ('Graphics.Vulkan.Core10.Pipeline.VertexInputAttributeDescription'::@format@).
--
-- = See Also
--
-- 'FormatFeatureFlags'
newtype FormatFeatureFlagBits = FormatFeatureFlagBits Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits)

-- | 'FORMAT_FEATURE_SAMPLED_IMAGE_BIT' specifies that an image view /can/ be
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#descriptorsets-sampledimage sampled from>.
pattern FORMAT_FEATURE_SAMPLED_IMAGE_BIT = FormatFeatureFlagBits 0x00000001
-- | 'FORMAT_FEATURE_STORAGE_IMAGE_BIT' specifies that an image view /can/ be
-- used as a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#descriptorsets-storageimage storage images>.
pattern FORMAT_FEATURE_STORAGE_IMAGE_BIT = FormatFeatureFlagBits 0x00000002
-- | 'FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT' specifies that an image view
-- /can/ be used as storage image that supports atomic operations.
pattern FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT = FormatFeatureFlagBits 0x00000004
-- | 'FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT' specifies that the format
-- /can/ be used to create a buffer view that /can/ be bound to a
-- 'Graphics.Vulkan.Core10.Enums.DescriptorType.DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER'
-- descriptor.
pattern FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT = FormatFeatureFlagBits 0x00000008
-- | 'FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT' specifies that the format
-- /can/ be used to create a buffer view that /can/ be bound to a
-- 'Graphics.Vulkan.Core10.Enums.DescriptorType.DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER'
-- descriptor.
pattern FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT = FormatFeatureFlagBits 0x00000010
-- | 'FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT' specifies that atomic
-- operations are supported on
-- 'Graphics.Vulkan.Core10.Enums.DescriptorType.DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER'
-- with this format.
pattern FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT = FormatFeatureFlagBits 0x00000020
-- | 'FORMAT_FEATURE_VERTEX_BUFFER_BIT' specifies that the format /can/ be
-- used as a vertex attribute format
-- ('Graphics.Vulkan.Core10.Pipeline.VertexInputAttributeDescription'::@format@).
pattern FORMAT_FEATURE_VERTEX_BUFFER_BIT = FormatFeatureFlagBits 0x00000040
-- | 'FORMAT_FEATURE_COLOR_ATTACHMENT_BIT' specifies that an image view /can/
-- be used as a framebuffer color attachment and as an input attachment.
pattern FORMAT_FEATURE_COLOR_ATTACHMENT_BIT = FormatFeatureFlagBits 0x00000080
-- | 'FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT' specifies that an image view
-- /can/ be used as a framebuffer color attachment that supports blending
-- and as an input attachment.
pattern FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT = FormatFeatureFlagBits 0x00000100
-- | 'FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT' specifies that an image
-- view /can/ be used as a framebuffer depth\/stencil attachment and as an
-- input attachment.
pattern FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT = FormatFeatureFlagBits 0x00000200
-- | 'FORMAT_FEATURE_BLIT_SRC_BIT' specifies that an image /can/ be used as
-- @srcImage@ for the
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdBlitImage' command.
pattern FORMAT_FEATURE_BLIT_SRC_BIT = FormatFeatureFlagBits 0x00000400
-- | 'FORMAT_FEATURE_BLIT_DST_BIT' specifies that an image /can/ be used as
-- @dstImage@ for the
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdBlitImage' command.
pattern FORMAT_FEATURE_BLIT_DST_BIT = FormatFeatureFlagBits 0x00000800
-- | 'FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT' specifies that if
-- 'FORMAT_FEATURE_SAMPLED_IMAGE_BIT' is also set, an image view /can/ be
-- used with a sampler that has either of @magFilter@ or @minFilter@ set to
-- 'Graphics.Vulkan.Core10.Enums.Filter.FILTER_LINEAR', or @mipmapMode@ set
-- to
-- 'Graphics.Vulkan.Core10.Enums.SamplerMipmapMode.SAMPLER_MIPMAP_MODE_LINEAR'.
-- If 'FORMAT_FEATURE_BLIT_SRC_BIT' is also set, an image can be used as
-- the @srcImage@ to
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdBlitImage' with a
-- @filter@ of 'Graphics.Vulkan.Core10.Enums.Filter.FILTER_LINEAR'. This
-- bit /must/ only be exposed for formats that also support the
-- 'FORMAT_FEATURE_SAMPLED_IMAGE_BIT' or 'FORMAT_FEATURE_BLIT_SRC_BIT'.
--
-- If the format being queried is a depth\/stencil format, this bit only
-- specifies that the depth aspect (not the stencil aspect) of an image of
-- this format supports linear filtering, and that linear filtering of the
-- depth aspect is supported whether depth compare is enabled in the
-- sampler or not. If this bit is not present, linear filtering with depth
-- compare disabled is unsupported and linear filtering with depth compare
-- enabled is supported, but /may/ compute the filtered value in an
-- implementation-dependent manner which differs from the normal rules of
-- linear filtering. The resulting value /must/ be in the range [0,1] and
-- /should/ be proportional to, or a weighted average of, the number of
-- comparison passes or failures.
pattern FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT = FormatFeatureFlagBits 0x00001000
-- | 'FORMAT_FEATURE_FRAGMENT_DENSITY_MAP_BIT_EXT' specifies that an image
-- view /can/ be used as a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#renderpass-fragmentdensitymapattachment fragment density map attachment>.
pattern FORMAT_FEATURE_FRAGMENT_DENSITY_MAP_BIT_EXT = FormatFeatureFlagBits 0x01000000
-- No documentation found for Nested "VkFormatFeatureFlagBits" "VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG"
pattern FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG = FormatFeatureFlagBits 0x00002000
-- | 'FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT' specifies
-- 'Graphics.Vulkan.Core10.Handles.Image' /can/ be used as a sampled image
-- with a min or max
-- 'Graphics.Vulkan.Core12.Enums.SamplerReductionMode.SamplerReductionMode'.
-- This bit /must/ only be exposed for formats that also support the
-- 'FORMAT_FEATURE_SAMPLED_IMAGE_BIT'.
pattern FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT = FormatFeatureFlagBits 0x00010000
-- | 'FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT' specifies that an
-- application /can/ define a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#samplers-YCbCr-conversion sampler Y′CBCR conversion>
-- using this format as a source, and that an image of this format /can/ be
-- used with a
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'
-- @xChromaOffset@ and\/or @yChromaOffset@ of
-- 'Graphics.Vulkan.Core11.Enums.ChromaLocation.CHROMA_LOCATION_COSITED_EVEN'.
-- Otherwise both @xChromaOffset@ and @yChromaOffset@ /must/ be
-- 'Graphics.Vulkan.Core11.Enums.ChromaLocation.CHROMA_LOCATION_MIDPOINT'.
-- If neither 'FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT' nor
-- 'FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT' is set, the application
-- /must/ not define a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#samplers-YCbCr-conversion sampler Y′CBCR conversion>
-- using this format as a source.
pattern FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT = FormatFeatureFlagBits 0x00800000
-- | 'FORMAT_FEATURE_DISJOINT_BIT' specifies that a multi-planar image /can/
-- have the
-- 'Graphics.Vulkan.Core10.Enums.ImageCreateFlagBits.IMAGE_CREATE_DISJOINT_BIT'
-- set during image creation. An implementation /must/ not set
-- 'FORMAT_FEATURE_DISJOINT_BIT' for /single-plane formats/.
pattern FORMAT_FEATURE_DISJOINT_BIT = FormatFeatureFlagBits 0x00400000
-- | 'FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT'
-- specifies that reconstruction /can/ be forcibly made explicit by setting
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'::@forceExplicitReconstruction@
-- to 'Graphics.Vulkan.Core10.BaseType.TRUE'. If the format being queried
-- supports
-- 'FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT'
-- it /must/ also support
-- 'FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT'.
pattern FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT = FormatFeatureFlagBits 0x00200000
-- | 'FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT'
-- specifies that reconstruction is explicit, as described in
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#textures-chroma-reconstruction>.
-- If this bit is not present, reconstruction is implicit by default.
pattern FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT = FormatFeatureFlagBits 0x00100000
-- | 'FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT'
-- specifies that the format can have different chroma, min, and mag
-- filters.
pattern FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT = FormatFeatureFlagBits 0x00080000
-- | 'FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT'
-- specifies that the format can do linear sampler filtering
-- (min\/magFilter) whilst sampler Y′CBCR conversion is enabled.
pattern FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT = FormatFeatureFlagBits 0x00040000
-- | 'FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT' specifies that an
-- application /can/ define a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#samplers-YCbCr-conversion sampler Y′CBCR conversion>
-- using this format as a source, and that an image of this format /can/ be
-- used with a
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'
-- @xChromaOffset@ and\/or @yChromaOffset@ of
-- 'Graphics.Vulkan.Core11.Enums.ChromaLocation.CHROMA_LOCATION_MIDPOINT'.
-- Otherwise both @xChromaOffset@ and @yChromaOffset@ /must/ be
-- 'Graphics.Vulkan.Core11.Enums.ChromaLocation.CHROMA_LOCATION_COSITED_EVEN'.
-- If a format does not incorporate chroma downsampling (it is not a “422”
-- or “420” format) but the implementation supports sampler Y′CBCR
-- conversion for this format, the implementation /must/ set
-- 'FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT'.
pattern FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT = FormatFeatureFlagBits 0x00020000
-- | 'FORMAT_FEATURE_TRANSFER_DST_BIT' specifies that an image /can/ be used
-- as a destination image for
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#copies copy commands>
-- and
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#clears clear commands>.
pattern FORMAT_FEATURE_TRANSFER_DST_BIT = FormatFeatureFlagBits 0x00008000
-- | 'FORMAT_FEATURE_TRANSFER_SRC_BIT' specifies that an image /can/ be used
-- as a source image for
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#copies copy commands>.
pattern FORMAT_FEATURE_TRANSFER_SRC_BIT = FormatFeatureFlagBits 0x00004000

type FormatFeatureFlags = FormatFeatureFlagBits

instance Show FormatFeatureFlagBits where
  showsPrec p = \case
    FORMAT_FEATURE_SAMPLED_IMAGE_BIT -> showString "FORMAT_FEATURE_SAMPLED_IMAGE_BIT"
    FORMAT_FEATURE_STORAGE_IMAGE_BIT -> showString "FORMAT_FEATURE_STORAGE_IMAGE_BIT"
    FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT -> showString "FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT"
    FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT -> showString "FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT"
    FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT -> showString "FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT"
    FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT -> showString "FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT"
    FORMAT_FEATURE_VERTEX_BUFFER_BIT -> showString "FORMAT_FEATURE_VERTEX_BUFFER_BIT"
    FORMAT_FEATURE_COLOR_ATTACHMENT_BIT -> showString "FORMAT_FEATURE_COLOR_ATTACHMENT_BIT"
    FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT -> showString "FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT"
    FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT -> showString "FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT"
    FORMAT_FEATURE_BLIT_SRC_BIT -> showString "FORMAT_FEATURE_BLIT_SRC_BIT"
    FORMAT_FEATURE_BLIT_DST_BIT -> showString "FORMAT_FEATURE_BLIT_DST_BIT"
    FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT -> showString "FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT"
    FORMAT_FEATURE_FRAGMENT_DENSITY_MAP_BIT_EXT -> showString "FORMAT_FEATURE_FRAGMENT_DENSITY_MAP_BIT_EXT"
    FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG -> showString "FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG"
    FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT -> showString "FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT"
    FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT -> showString "FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT"
    FORMAT_FEATURE_DISJOINT_BIT -> showString "FORMAT_FEATURE_DISJOINT_BIT"
    FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT -> showString "FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT"
    FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT -> showString "FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT"
    FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT -> showString "FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT"
    FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT -> showString "FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT"
    FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT -> showString "FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT"
    FORMAT_FEATURE_TRANSFER_DST_BIT -> showString "FORMAT_FEATURE_TRANSFER_DST_BIT"
    FORMAT_FEATURE_TRANSFER_SRC_BIT -> showString "FORMAT_FEATURE_TRANSFER_SRC_BIT"
    FormatFeatureFlagBits x -> showParen (p >= 11) (showString "FormatFeatureFlagBits 0x" . showHex x)

instance Read FormatFeatureFlagBits where
  readPrec = parens (choose [("FORMAT_FEATURE_SAMPLED_IMAGE_BIT", pure FORMAT_FEATURE_SAMPLED_IMAGE_BIT)
                            , ("FORMAT_FEATURE_STORAGE_IMAGE_BIT", pure FORMAT_FEATURE_STORAGE_IMAGE_BIT)
                            , ("FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT", pure FORMAT_FEATURE_STORAGE_IMAGE_ATOMIC_BIT)
                            , ("FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT", pure FORMAT_FEATURE_UNIFORM_TEXEL_BUFFER_BIT)
                            , ("FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT", pure FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_BIT)
                            , ("FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT", pure FORMAT_FEATURE_STORAGE_TEXEL_BUFFER_ATOMIC_BIT)
                            , ("FORMAT_FEATURE_VERTEX_BUFFER_BIT", pure FORMAT_FEATURE_VERTEX_BUFFER_BIT)
                            , ("FORMAT_FEATURE_COLOR_ATTACHMENT_BIT", pure FORMAT_FEATURE_COLOR_ATTACHMENT_BIT)
                            , ("FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT", pure FORMAT_FEATURE_COLOR_ATTACHMENT_BLEND_BIT)
                            , ("FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT", pure FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT)
                            , ("FORMAT_FEATURE_BLIT_SRC_BIT", pure FORMAT_FEATURE_BLIT_SRC_BIT)
                            , ("FORMAT_FEATURE_BLIT_DST_BIT", pure FORMAT_FEATURE_BLIT_DST_BIT)
                            , ("FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT", pure FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT)
                            , ("FORMAT_FEATURE_FRAGMENT_DENSITY_MAP_BIT_EXT", pure FORMAT_FEATURE_FRAGMENT_DENSITY_MAP_BIT_EXT)
                            , ("FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG", pure FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_CUBIC_BIT_IMG)
                            , ("FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT", pure FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_MINMAX_BIT)
                            , ("FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT", pure FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT)
                            , ("FORMAT_FEATURE_DISJOINT_BIT", pure FORMAT_FEATURE_DISJOINT_BIT)
                            , ("FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT", pure FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT)
                            , ("FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT", pure FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_BIT)
                            , ("FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT", pure FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT)
                            , ("FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT", pure FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT)
                            , ("FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT", pure FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT)
                            , ("FORMAT_FEATURE_TRANSFER_DST_BIT", pure FORMAT_FEATURE_TRANSFER_DST_BIT)
                            , ("FORMAT_FEATURE_TRANSFER_SRC_BIT", pure FORMAT_FEATURE_TRANSFER_SRC_BIT)]
                     +++
                     prec 10 (do
                       expectP (Ident "FormatFeatureFlagBits")
                       v <- step readPrec
                       pure (FormatFeatureFlagBits v)))

