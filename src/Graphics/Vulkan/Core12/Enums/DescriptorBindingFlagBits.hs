{-# language CPP #-}
module Graphics.Vulkan.Core12.Enums.DescriptorBindingFlagBits  ( DescriptorBindingFlagBits( DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT
                                                                                          , DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT
                                                                                          , DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT
                                                                                          , DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT
                                                                                          , ..
                                                                                          )
                                                               , DescriptorBindingFlags
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
-- | VkDescriptorBindingFlagBits - Bitmask specifying descriptor set layout
-- binding properties
--
-- = Description
--
-- Note
--
-- Note that while 'DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT' and
-- 'DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT' both involve
-- updates to descriptor sets after they are bound,
-- 'DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT' is a weaker
-- requirement since it is only about descriptors that are not used,
-- whereas 'DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT' requires the
-- implementation to observe updates to descriptors that are used.
--
-- = See Also
--
-- 'DescriptorBindingFlags'
newtype DescriptorBindingFlagBits = DescriptorBindingFlagBits Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits)

-- | 'DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT' indicates that if descriptors
-- in this binding are updated between when the descriptor set is bound in
-- a command buffer and when that command buffer is submitted to a queue,
-- then the submission will use the most recently set descriptors for this
-- binding and the updates do not invalidate the command buffer. Descriptor
-- bindings created with this flag are also partially exempt from the
-- external synchronization requirement in
-- 'Graphics.Vulkan.Extensions.VK_KHR_descriptor_update_template.updateDescriptorSetWithTemplateKHR'
-- and 'Graphics.Vulkan.Core10.DescriptorSet.updateDescriptorSets'.
-- Multiple descriptors with this flag set /can/ be updated concurrently in
-- different threads, though the same descriptor /must/ not be updated
-- concurrently by two threads. Descriptors with this flag set /can/ be
-- updated concurrently with the set being bound to a command buffer in
-- another thread, but not concurrently with the set being reset or freed.
pattern DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT = DescriptorBindingFlagBits 0x00000001
-- | 'DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT' indicates that
-- descriptors in this binding /can/ be updated after a command buffer has
-- bound this descriptor set, or while a command buffer that uses this
-- descriptor set is pending execution, as long as the descriptors that are
-- updated are not used by those command buffers. If
-- 'DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT' is also set, then descriptors
-- /can/ be updated as long as they are not dynamically used by any shader
-- invocations. If 'DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT' is not set,
-- then descriptors /can/ be updated as long as they are not statically
-- used by any shader invocations.
pattern DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT = DescriptorBindingFlagBits 0x00000002
-- | 'DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT' indicates that descriptors in
-- this binding that are not /dynamically used/ need not contain valid
-- descriptors at the time the descriptors are consumed. A descriptor is
-- dynamically used if any shader invocation executes an instruction that
-- performs any memory access using the descriptor.
pattern DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT = DescriptorBindingFlagBits 0x00000004
-- | 'DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT' indicates that this
-- descriptor binding has a variable size that will be specified when a
-- descriptor set is allocated using this layout. The value of
-- @descriptorCount@ is treated as an upper bound on the size of the
-- binding. This /must/ only be used for the last binding in the descriptor
-- set layout (i.e. the binding with the largest value of @binding@). For
-- the purposes of counting against limits such as @maxDescriptorSet@* and
-- @maxPerStageDescriptor@*, the full value of @descriptorCount@ is counted
-- , except for descriptor bindings with a descriptor type of
-- 'Graphics.Vulkan.Core10.Enums.DescriptorType.DESCRIPTOR_TYPE_INLINE_UNIFORM_BLOCK_EXT'
-- where @descriptorCount@ specifies the upper bound on the byte size of
-- the binding, thus it counts against the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#limits-maxInlineUniformBlockSize maxInlineUniformBlockSize>
-- limit instead. .
pattern DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT = DescriptorBindingFlagBits 0x00000008

type DescriptorBindingFlags = DescriptorBindingFlagBits

instance Show DescriptorBindingFlagBits where
  showsPrec p = \case
    DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT -> showString "DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT"
    DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT -> showString "DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT"
    DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT -> showString "DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT"
    DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT -> showString "DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT"
    DescriptorBindingFlagBits x -> showParen (p >= 11) (showString "DescriptorBindingFlagBits 0x" . showHex x)

instance Read DescriptorBindingFlagBits where
  readPrec = parens (choose [("DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT", pure DESCRIPTOR_BINDING_UPDATE_AFTER_BIND_BIT)
                            , ("DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT", pure DESCRIPTOR_BINDING_UPDATE_UNUSED_WHILE_PENDING_BIT)
                            , ("DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT", pure DESCRIPTOR_BINDING_PARTIALLY_BOUND_BIT)
                            , ("DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT", pure DESCRIPTOR_BINDING_VARIABLE_DESCRIPTOR_COUNT_BIT)]
                     +++
                     prec 10 (do
                       expectP (Ident "DescriptorBindingFlagBits")
                       v <- step readPrec
                       pure (DescriptorBindingFlagBits v)))

