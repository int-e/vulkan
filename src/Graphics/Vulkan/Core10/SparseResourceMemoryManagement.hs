{-# language Strict #-}
{-# language CPP #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}
{-# language DuplicateRecordFields #-}

module Graphics.Vulkan.Core10.SparseResourceMemoryManagement
  ( VkImageAspectFlagBits(..)
  , pattern VK_IMAGE_ASPECT_COLOR_BIT
  , pattern VK_IMAGE_ASPECT_DEPTH_BIT
  , pattern VK_IMAGE_ASPECT_STENCIL_BIT
  , pattern VK_IMAGE_ASPECT_METADATA_BIT
  , VkSparseMemoryBindFlagBits(..)
  , pattern VK_SPARSE_MEMORY_BIND_METADATA_BIT
  , VkSparseImageFormatFlagBits(..)
  , pattern VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT
  , pattern VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT
  , pattern VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT
  , vkGetImageSparseMemoryRequirements
  , vkGetPhysicalDeviceSparseImageFormatProperties
  , vkQueueBindSparse
  , VkOffset3D(..)
  , VkSparseImageFormatProperties(..)
  , VkSparseImageMemoryRequirements(..)
  , VkImageSubresource(..)
  , VkSparseMemoryBind(..)
  , VkSparseImageMemoryBind(..)
  , VkSparseBufferMemoryBindInfo(..)
  , VkSparseImageOpaqueMemoryBindInfo(..)
  , VkSparseImageMemoryBindInfo(..)
  , VkBindSparseInfo(..)
  , VkImageAspectFlags
  , VkSparseMemoryBindFlags
  , VkSparseImageFormatFlags
  ) where

import Data.Bits
  ( Bits
  , FiniteBits
  )
import Data.Int
  ( Int32
  )
import Data.Word
  ( Word32
  )
import Foreign.Ptr
  ( plusPtr
  , Ptr
  )
import Foreign.Storable
  ( Storable(..)
  , Storable
  )
import GHC.Read
  ( expectP
  , choose
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )
import Text.ParserCombinators.ReadPrec
  ( (+++)
  , prec
  , step
  )
import Text.Read
  ( Read(..)
  , parens
  )
import Text.Read.Lex
  ( Lexeme(Ident)
  )


import Graphics.Vulkan.Core10.Core
  ( VkStructureType(..)
  , VkResult(..)
  , VkFormat(..)
  , VkFlags
  )
import Graphics.Vulkan.Core10.DeviceInitialization
  ( VkDeviceSize
  , VkExtent3D(..)
  , VkImageUsageFlagBits(..)
  , VkImageTiling(..)
  , VkImageUsageFlags
  , VkSampleCountFlagBits(..)
  , VkImageType(..)
  , VkPhysicalDevice
  , VkDevice
  )
import Graphics.Vulkan.Core10.Memory
  ( VkDeviceMemory
  )
import Graphics.Vulkan.Core10.MemoryManagement
  ( VkBuffer
  , VkImage
  )
import Graphics.Vulkan.Core10.Queue
  ( VkSemaphore
  , VkFence
  , VkQueue
  )


-- ** VkImageAspectFlagBits

-- | VkImageAspectFlagBits - Bitmask specifying which aspects of an image are
-- included in a view
--
-- = See Also
-- #_see_also#
--
-- 'Graphics.Vulkan.Core11.Promoted_from_VK_KHR_sampler_ycbcr_conversion.VkBindImagePlaneMemoryInfo',
-- 'VkImageAspectFlags',
-- 'Graphics.Vulkan.Core11.Promoted_from_VK_KHR_sampler_ycbcr_conversion.VkImagePlaneMemoryRequirementsInfo'
newtype VkImageAspectFlagBits = VkImageAspectFlagBits VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits)

instance Show VkImageAspectFlagBits where
  showsPrec _ VK_IMAGE_ASPECT_COLOR_BIT = showString "VK_IMAGE_ASPECT_COLOR_BIT"
  showsPrec _ VK_IMAGE_ASPECT_DEPTH_BIT = showString "VK_IMAGE_ASPECT_DEPTH_BIT"
  showsPrec _ VK_IMAGE_ASPECT_STENCIL_BIT = showString "VK_IMAGE_ASPECT_STENCIL_BIT"
  showsPrec _ VK_IMAGE_ASPECT_METADATA_BIT = showString "VK_IMAGE_ASPECT_METADATA_BIT"
  -- The following values are from extensions, the patterns themselves are exported from the extension modules
  showsPrec _ (VkImageAspectFlagBits 0x00000010) = showString "VK_IMAGE_ASPECT_PLANE_0_BIT"
  showsPrec _ (VkImageAspectFlagBits 0x00000020) = showString "VK_IMAGE_ASPECT_PLANE_1_BIT"
  showsPrec _ (VkImageAspectFlagBits 0x00000040) = showString "VK_IMAGE_ASPECT_PLANE_2_BIT"
  showsPrec p (VkImageAspectFlagBits x) = showParen (p >= 11) (showString "VkImageAspectFlagBits " . showsPrec 11 x)

instance Read VkImageAspectFlagBits where
  readPrec = parens ( choose [ ("VK_IMAGE_ASPECT_COLOR_BIT",    pure VK_IMAGE_ASPECT_COLOR_BIT)
                             , ("VK_IMAGE_ASPECT_DEPTH_BIT",    pure VK_IMAGE_ASPECT_DEPTH_BIT)
                             , ("VK_IMAGE_ASPECT_STENCIL_BIT",  pure VK_IMAGE_ASPECT_STENCIL_BIT)
                             , ("VK_IMAGE_ASPECT_METADATA_BIT", pure VK_IMAGE_ASPECT_METADATA_BIT)
                             , -- The following values are from extensions, the patterns themselves are exported from the extension modules
                               ("VK_IMAGE_ASPECT_PLANE_0_BIT", pure (VkImageAspectFlagBits 0x00000010))
                             , ("VK_IMAGE_ASPECT_PLANE_1_BIT", pure (VkImageAspectFlagBits 0x00000020))
                             , ("VK_IMAGE_ASPECT_PLANE_2_BIT", pure (VkImageAspectFlagBits 0x00000040))
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkImageAspectFlagBits")
                        v <- step readPrec
                        pure (VkImageAspectFlagBits v)
                        )
                    )

-- | @VK_IMAGE_ASPECT_COLOR_BIT@ specifies the color aspect.
pattern VK_IMAGE_ASPECT_COLOR_BIT :: VkImageAspectFlagBits
pattern VK_IMAGE_ASPECT_COLOR_BIT = VkImageAspectFlagBits 0x00000001

-- | @VK_IMAGE_ASPECT_DEPTH_BIT@ specifies the depth aspect.
pattern VK_IMAGE_ASPECT_DEPTH_BIT :: VkImageAspectFlagBits
pattern VK_IMAGE_ASPECT_DEPTH_BIT = VkImageAspectFlagBits 0x00000002

-- | @VK_IMAGE_ASPECT_STENCIL_BIT@ specifies the stencil aspect.
pattern VK_IMAGE_ASPECT_STENCIL_BIT :: VkImageAspectFlagBits
pattern VK_IMAGE_ASPECT_STENCIL_BIT = VkImageAspectFlagBits 0x00000004

-- | @VK_IMAGE_ASPECT_METADATA_BIT@ specifies the metadata aspect, used for
-- sparse <{html_spec_relative}#sparsememory sparse resource> operations.
pattern VK_IMAGE_ASPECT_METADATA_BIT :: VkImageAspectFlagBits
pattern VK_IMAGE_ASPECT_METADATA_BIT = VkImageAspectFlagBits 0x00000008
-- ** VkSparseMemoryBindFlagBits

-- | VkSparseMemoryBindFlagBits - Bitmask specifying usage of a sparse memory
-- binding operation
--
-- = See Also
-- #_see_also#
--
-- 'VkSparseMemoryBindFlags'
newtype VkSparseMemoryBindFlagBits = VkSparseMemoryBindFlagBits VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits)

instance Show VkSparseMemoryBindFlagBits where
  showsPrec _ VK_SPARSE_MEMORY_BIND_METADATA_BIT = showString "VK_SPARSE_MEMORY_BIND_METADATA_BIT"
  showsPrec p (VkSparseMemoryBindFlagBits x) = showParen (p >= 11) (showString "VkSparseMemoryBindFlagBits " . showsPrec 11 x)

instance Read VkSparseMemoryBindFlagBits where
  readPrec = parens ( choose [ ("VK_SPARSE_MEMORY_BIND_METADATA_BIT", pure VK_SPARSE_MEMORY_BIND_METADATA_BIT)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkSparseMemoryBindFlagBits")
                        v <- step readPrec
                        pure (VkSparseMemoryBindFlagBits v)
                        )
                    )

-- | @VK_SPARSE_MEMORY_BIND_METADATA_BIT@ specifies that the memory being
-- bound is only for the metadata aspect.
pattern VK_SPARSE_MEMORY_BIND_METADATA_BIT :: VkSparseMemoryBindFlagBits
pattern VK_SPARSE_MEMORY_BIND_METADATA_BIT = VkSparseMemoryBindFlagBits 0x00000001
-- ** VkSparseImageFormatFlagBits

-- | VkSparseImageFormatFlagBits - Bitmask specifying additional information
-- about a sparse image resource
--
-- = See Also
-- #_see_also#
--
-- 'VkSparseImageFormatFlags'
newtype VkSparseImageFormatFlagBits = VkSparseImageFormatFlagBits VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits)

instance Show VkSparseImageFormatFlagBits where
  showsPrec _ VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT = showString "VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT"
  showsPrec _ VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT = showString "VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT"
  showsPrec _ VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT = showString "VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT"
  showsPrec p (VkSparseImageFormatFlagBits x) = showParen (p >= 11) (showString "VkSparseImageFormatFlagBits " . showsPrec 11 x)

instance Read VkSparseImageFormatFlagBits where
  readPrec = parens ( choose [ ("VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT",         pure VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT)
                             , ("VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT",       pure VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT)
                             , ("VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT", pure VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkSparseImageFormatFlagBits")
                        v <- step readPrec
                        pure (VkSparseImageFormatFlagBits v)
                        )
                    )

-- | @VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT@ specifies that the image
-- uses a single mip tail region for all array layers.
pattern VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT :: VkSparseImageFormatFlagBits
pattern VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT = VkSparseImageFormatFlagBits 0x00000001

-- | @VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT@ specifies that the first
-- mip level whose dimensions are not integer multiples of the
-- corresponding dimensions of the sparse image block begins the mip tail
-- region.
pattern VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT :: VkSparseImageFormatFlagBits
pattern VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT = VkSparseImageFormatFlagBits 0x00000002

-- | @VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT@ specifies that the
-- image uses non-standard sparse image block dimensions, and the
-- @imageGranularity@ values do not match the standard sparse image block
-- dimensions for the given format.
pattern VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT :: VkSparseImageFormatFlagBits
pattern VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT = VkSparseImageFormatFlagBits 0x00000004
-- | vkGetImageSparseMemoryRequirements - Query the memory requirements for a
-- sparse image
--
-- = Parameters
-- #_parameters#
--
-- -   @device@ is the logical device that owns the image.
--
-- -   @image@ is the @VkImage@ object to get the memory requirements for.
--
-- -   @pSparseMemoryRequirementCount@ is a pointer to an integer related
--     to the number of sparse memory requirements available or queried, as
--     described below.
--
-- -   @pSparseMemoryRequirements@ is either @NULL@ or a pointer to an
--     array of @VkSparseImageMemoryRequirements@ structures.
--
-- = Description
-- #_description#
--
-- If @pSparseMemoryRequirements@ is @NULL@, then the number of sparse
-- memory requirements available is returned in
-- @pSparseMemoryRequirementCount@. Otherwise,
-- @pSparseMemoryRequirementCount@ /must/ point to a variable set by the
-- user to the number of elements in the @pSparseMemoryRequirements@ array,
-- and on return the variable is overwritten with the number of structures
-- actually written to @pSparseMemoryRequirements@. If
-- @pSparseMemoryRequirementCount@ is less than the number of sparse memory
-- requirements available, at most @pSparseMemoryRequirementCount@
-- structures will be written.
--
-- If the image was not created with @VK_IMAGE_CREATE_SPARSE_RESIDENCY_BIT@
-- then @pSparseMemoryRequirementCount@ will be set to zero and
-- @pSparseMemoryRequirements@ will not be written to.
--
-- __Note__
--
-- It is legal for an implementation to report a larger value in
-- @VkMemoryRequirements@::@size@ than would be obtained by adding together
-- memory sizes for all @VkSparseImageMemoryRequirements@ returned by
-- @vkGetImageSparseMemoryRequirements@. This /may/ occur when the
-- implementation requires unused padding in the address range describing
-- the resource.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid @VkDevice@ handle
--
-- -   @image@ /must/ be a valid @VkImage@ handle
--
-- -   @pSparseMemoryRequirementCount@ /must/ be a valid pointer to a
--     @uint32_t@ value
--
-- -   If the value referenced by @pSparseMemoryRequirementCount@ is not
--     @0@, and @pSparseMemoryRequirements@ is not @NULL@,
--     @pSparseMemoryRequirements@ /must/ be a valid pointer to an array of
--     @pSparseMemoryRequirementCount@ @VkSparseImageMemoryRequirements@
--     structures
--
-- -   @image@ /must/ have been created, allocated, or retrieved from
--     @device@
--
-- = See Also
-- #_see_also#
--
-- 'Graphics.Vulkan.Core10.DeviceInitialization.VkDevice',
-- 'Graphics.Vulkan.Core10.MemoryManagement.VkImage',
-- 'VkSparseImageMemoryRequirements'
foreign import ccall "vkGetImageSparseMemoryRequirements" vkGetImageSparseMemoryRequirements :: ("device" ::: VkDevice) -> ("image" ::: VkImage) -> ("pSparseMemoryRequirementCount" ::: Ptr Word32) -> ("pSparseMemoryRequirements" ::: Ptr VkSparseImageMemoryRequirements) -> IO ()
-- | vkGetPhysicalDeviceSparseImageFormatProperties - Retrieve properties of
-- an image format applied to sparse images
--
-- = Parameters
-- #_parameters#
--
-- -   @physicalDevice@ is the physical device from which to query the
--     sparse image capabilities.
--
-- -   @format@ is the image format.
--
-- -   @type@ is the dimensionality of image.
--
-- -   @samples@ is the number of samples per texel as defined in
--     'Graphics.Vulkan.Core10.DeviceInitialization.VkSampleCountFlagBits'.
--
-- -   @usage@ is a bitmask describing the intended usage of the image.
--
-- -   @tiling@ is the tiling arrangement of the data elements in memory.
--
-- -   @pPropertyCount@ is a pointer to an integer related to the number of
--     sparse format properties available or queried, as described below.
--
-- -   @pProperties@ is either @NULL@ or a pointer to an array of
--     'VkSparseImageFormatProperties' structures.
--
-- = Description
-- #_description#
--
-- If @pProperties@ is @NULL@, then the number of sparse format properties
-- available is returned in @pPropertyCount@. Otherwise, @pPropertyCount@
-- /must/ point to a variable set by the user to the number of elements in
-- the @pProperties@ array, and on return the variable is overwritten with
-- the number of structures actually written to @pProperties@. If
-- @pPropertyCount@ is less than the number of sparse format properties
-- available, at most @pPropertyCount@ structures will be written.
--
-- If @VK_IMAGE_CREATE_SPARSE_RESIDENCY_BIT@ is not supported for the given
-- arguments, @pPropertyCount@ will be set to zero upon return, and no data
-- will be written to @pProperties@.
--
-- Multiple aspects are returned for depth\/stencil images that are
-- implemented as separate planes by the implementation. The depth and
-- stencil data planes each have unique @VkSparseImageFormatProperties@
-- data.
--
-- Depth\/stencil images with depth and stencil data interleaved into a
-- single plane will return a single @VkSparseImageFormatProperties@
-- structure with the @aspectMask@ set to @VK_IMAGE_ASPECT_DEPTH_BIT@ |
-- @VK_IMAGE_ASPECT_STENCIL_BIT@.
--
-- == Valid Usage
--
-- -   @samples@ /must/ be a bit value that is set in
--     @VkImageFormatProperties@::@sampleCounts@ returned by
--     @vkGetPhysicalDeviceImageFormatProperties@ with @format@, @type@,
--     @tiling@, and @usage@ equal to those in this command and @flags@
--     equal to the value that is set in @VkImageCreateInfo@::@flags@ when
--     the image is created
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid @VkPhysicalDevice@ handle
--
-- -   @format@ /must/ be a valid 'Graphics.Vulkan.Core10.Core.VkFormat'
--     value
--
-- -   @type@ /must/ be a valid
--     'Graphics.Vulkan.Core10.DeviceInitialization.VkImageType' value
--
-- -   @samples@ /must/ be a valid
--     'Graphics.Vulkan.Core10.DeviceInitialization.VkSampleCountFlagBits'
--     value
--
-- -   @usage@ /must/ be a valid combination of
--     'Graphics.Vulkan.Core10.DeviceInitialization.VkImageUsageFlagBits'
--     values
--
-- -   @usage@ /must/ not be @0@
--
-- -   @tiling@ /must/ be a valid
--     'Graphics.Vulkan.Core10.DeviceInitialization.VkImageTiling' value
--
-- -   @pPropertyCount@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If the value referenced by @pPropertyCount@ is not @0@, and
--     @pProperties@ is not @NULL@, @pProperties@ /must/ be a valid pointer
--     to an array of @pPropertyCount@ @VkSparseImageFormatProperties@
--     structures
--
-- = See Also
-- #_see_also#
--
-- 'Graphics.Vulkan.Core10.Core.VkFormat',
-- 'Graphics.Vulkan.Core10.DeviceInitialization.VkImageTiling',
-- 'Graphics.Vulkan.Core10.DeviceInitialization.VkImageType',
-- 'Graphics.Vulkan.Core10.DeviceInitialization.VkImageUsageFlags',
-- 'Graphics.Vulkan.Core10.DeviceInitialization.VkPhysicalDevice',
-- 'Graphics.Vulkan.Core10.DeviceInitialization.VkSampleCountFlagBits',
-- 'VkSparseImageFormatProperties'
foreign import ccall "vkGetPhysicalDeviceSparseImageFormatProperties" vkGetPhysicalDeviceSparseImageFormatProperties :: ("physicalDevice" ::: VkPhysicalDevice) -> ("format" ::: VkFormat) -> ("type" ::: VkImageType) -> ("samples" ::: VkSampleCountFlagBits) -> ("usage" ::: VkImageUsageFlags) -> ("tiling" ::: VkImageTiling) -> ("pPropertyCount" ::: Ptr Word32) -> ("pProperties" ::: Ptr VkSparseImageFormatProperties) -> IO ()
-- | vkQueueBindSparse - Bind device memory to a sparse resource object
--
-- = Parameters
-- #_parameters#
--
-- -   @queue@ is the queue that the sparse binding operations will be
--     submitted to.
--
-- -   @bindInfoCount@ is the number of elements in the @pBindInfo@ array.
--
-- -   @pBindInfo@ is an array of 'VkBindSparseInfo' structures, each
--     specifying a sparse binding submission batch.
--
-- -   @fence@ is an /optional/ handle to a fence to be signaled. If
--     @fence@ is not 'Graphics.Vulkan.Core10.Constants.VK_NULL_HANDLE', it
--     defines a
--     <{html_spec_relative}#synchronization-fences-signaling fence signal operation>.
--
-- = Description
-- #_description#
--
-- @vkQueueBindSparse@ is a
-- <{html_spec_relative}#devsandqueues-submission queue submission command>,
-- with each batch defined by an element of @pBindInfo@ as an instance of
-- the 'VkBindSparseInfo' structure. Batches begin execution in the order
-- they appear in @pBindInfo@, but /may/ complete out of order.
--
-- Within a batch, a given range of a resource /must/ not be bound more
-- than once. Across batches, if a range is to be bound to one allocation
-- and offset and then to another allocation and offset, then the
-- application /must/ guarantee (usually using semaphores) that the binding
-- operations are executed in the correct order, as well as to order
-- binding operations against the execution of command buffer submissions.
--
-- As no operation to 'vkQueueBindSparse' causes any pipeline stage to
-- access memory, synchronization primitives used in this command
-- effectively only define execution dependencies.
--
-- Additional information about fence and semaphore operation is described
-- in <{html_spec_relative}#synchronization the synchronization chapter>.
--
-- == Valid Usage
--
-- -   If @fence@ is not 'Graphics.Vulkan.Core10.Constants.VK_NULL_HANDLE',
--     @fence@ /must/ be unsignaled
--
-- -   If @fence@ is not 'Graphics.Vulkan.Core10.Constants.VK_NULL_HANDLE',
--     @fence@ /must/ not be associated with any other queue command that
--     has not yet completed execution on that queue
--
-- -   Each element of the @pSignalSemaphores@ member of each element of
--     @pBindInfo@ /must/ be unsignaled when the semaphore signal operation
--     it defines is executed on the device
--
-- -   When a semaphore unsignal operation defined by any element of the
--     @pWaitSemaphores@ member of any element of @pBindInfo@ executes on
--     @queue@, no other queue /must/ be waiting on the same semaphore.
--
-- -   All elements of the @pWaitSemaphores@ member of all elements of
--     @pBindInfo@ /must/ be semaphores that are signaled, or have
--     <{html_spec_relative}#synchronization-semaphores-signaling semaphore signal operations>
--     previously submitted for execution.
--
-- == Valid Usage (Implicit)
--
-- -   @queue@ /must/ be a valid @VkQueue@ handle
--
-- -   If @bindInfoCount@ is not @0@, @pBindInfo@ /must/ be a valid pointer
--     to an array of @bindInfoCount@ valid @VkBindSparseInfo@ structures
--
-- -   If @fence@ is not 'Graphics.Vulkan.Core10.Constants.VK_NULL_HANDLE',
--     @fence@ /must/ be a valid @VkFence@ handle
--
-- -   The @queue@ /must/ support sparse binding operations
--
-- -   Both of @fence@, and @queue@ that are valid handles /must/ have been
--     created, allocated, or retrieved from the same @VkDevice@
--
-- == Host Synchronization
--
-- -   Host access to @queue@ /must/ be externally synchronized
--
-- -   Host access to @pBindInfo@[].pWaitSemaphores[] /must/ be externally
--     synchronized
--
-- -   Host access to @pBindInfo@[].pSignalSemaphores[] /must/ be
--     externally synchronized
--
-- -   Host access to @pBindInfo@[].pBufferBinds[].buffer /must/ be
--     externally synchronized
--
-- -   Host access to @pBindInfo@[].pImageOpaqueBinds[].image /must/ be
--     externally synchronized
--
-- -   Host access to @pBindInfo@[].pImageBinds[].image /must/ be
--     externally synchronized
--
-- -   Host access to @fence@ /must/ be externally synchronized
--
-- == Command Properties
--
-- > +-----------------+-----------------+-----------------+-----------------+
-- > | <#VkCommandBuff | <#vkCmdBeginRen | <#VkQueueFlagBi | <#synchronizati |
-- > | erLevel Command | derPass Render  | ts Supported Qu | on-pipeline-sta |
-- > |  Buffer Levels> | Pass Scope>     | eue Types>      | ges-types Pipel |
-- > |                 |                 |                 | ine Type>       |
-- > +=================+=================+=================+=================+
-- > | -               | -               | SPARSE_BINDING  | -               |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- == Return Codes
--
-- [<#fundamentals-successcodes Success>]
--     -   @VK_SUCCESS@
--
-- [<#fundamentals-errorcodes Failure>]
--     -   @VK_ERROR_OUT_OF_HOST_MEMORY@
--
--     -   @VK_ERROR_OUT_OF_DEVICE_MEMORY@
--
--     -   @VK_ERROR_DEVICE_LOST@
--
-- = See Also
-- #_see_also#
--
-- 'VkBindSparseInfo', 'Graphics.Vulkan.Core10.Queue.VkFence',
-- 'Graphics.Vulkan.Core10.Queue.VkQueue'
foreign import ccall "vkQueueBindSparse" vkQueueBindSparse :: ("queue" ::: VkQueue) -> ("bindInfoCount" ::: Word32) -> ("pBindInfo" ::: Ptr VkBindSparseInfo) -> ("fence" ::: VkFence) -> IO VkResult
-- | VkOffset3D - Structure specifying a three-dimensional offset
--
-- = Description
-- #_description#
--
-- = See Also
-- #_see_also#
--
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.VkBufferImageCopy',
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.VkImageBlit',
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.VkImageCopy',
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.VkImageResolve',
-- 'VkSparseImageMemoryBind'
data VkOffset3D = VkOffset3D
  { -- No documentation found for Nested "VkOffset3D" "vkX"
  vkX :: Int32
  , -- No documentation found for Nested "VkOffset3D" "vkY"
  vkY :: Int32
  , -- No documentation found for Nested "VkOffset3D" "vkZ"
  vkZ :: Int32
  }
  deriving (Eq, Show)

instance Storable VkOffset3D where
  sizeOf ~_ = 12
  alignment ~_ = 4
  peek ptr = VkOffset3D <$> peek (ptr `plusPtr` 0)
                        <*> peek (ptr `plusPtr` 4)
                        <*> peek (ptr `plusPtr` 8)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkX (poked :: VkOffset3D))
                *> poke (ptr `plusPtr` 4) (vkY (poked :: VkOffset3D))
                *> poke (ptr `plusPtr` 8) (vkZ (poked :: VkOffset3D))
-- | VkSparseImageFormatProperties - Structure specifying sparse image format
-- properties
--
-- = Description
-- #_description#
--
-- = See Also
-- #_see_also#
--
-- 'Graphics.Vulkan.Core10.DeviceInitialization.VkExtent3D',
-- 'VkImageAspectFlags', 'VkSparseImageFormatFlags',
-- 'Graphics.Vulkan.Core11.Promoted_from_VK_KHR_get_physical_device_properties2.VkSparseImageFormatProperties2',
-- 'VkSparseImageMemoryRequirements',
-- 'vkGetPhysicalDeviceSparseImageFormatProperties'
data VkSparseImageFormatProperties = VkSparseImageFormatProperties
  { -- No documentation found for Nested "VkSparseImageFormatProperties" "vkAspectMask"
  vkAspectMask :: VkImageAspectFlags
  , -- No documentation found for Nested "VkSparseImageFormatProperties" "vkImageGranularity"
  vkImageGranularity :: VkExtent3D
  , -- No documentation found for Nested "VkSparseImageFormatProperties" "vkFlags"
  vkFlags :: VkSparseImageFormatFlags
  }
  deriving (Eq, Show)

instance Storable VkSparseImageFormatProperties where
  sizeOf ~_ = 20
  alignment ~_ = 4
  peek ptr = VkSparseImageFormatProperties <$> peek (ptr `plusPtr` 0)
                                           <*> peek (ptr `plusPtr` 4)
                                           <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkAspectMask (poked :: VkSparseImageFormatProperties))
                *> poke (ptr `plusPtr` 4) (vkImageGranularity (poked :: VkSparseImageFormatProperties))
                *> poke (ptr `plusPtr` 16) (vkFlags (poked :: VkSparseImageFormatProperties))
-- | VkSparseImageMemoryRequirements - Structure specifying sparse image
-- memory requirements
--
-- = Members
-- #_members#
--
-- -   @formatProperties.aspectMask@ is the set of aspects of the image
--     that this sparse memory requirement applies to. This will usually
--     have a single aspect specified. However, depth\/stencil images /may/
--     have depth and stencil data interleaved in the same sparse block, in
--     which case both @VK_IMAGE_ASPECT_DEPTH_BIT@ and
--     @VK_IMAGE_ASPECT_STENCIL_BIT@ would be present.
--
-- -   @formatProperties.imageGranularity@ describes the dimensions of a
--     single bindable sparse image block in texel units. For aspect
--     @VK_IMAGE_ASPECT_METADATA_BIT@, all dimensions will be zero. All
--     metadata is located in the mip tail region.
--
-- -   @formatProperties.flags@ is a bitmask of
--     'VkSparseImageFormatFlagBits':
--
--     -   If @VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT@ is set the image
--         uses a single mip tail region for all array layers.
--
--     -   If @VK_SPARSE_IMAGE_FORMAT_ALIGNED_MIP_SIZE_BIT@ is set the
--         dimensions of mip levels /must/ be integer multiples of the
--         corresponding dimensions of the sparse image block for levels
--         not located in the mip tail.
--
--     -   If @VK_SPARSE_IMAGE_FORMAT_NONSTANDARD_BLOCK_SIZE_BIT@ is set
--         the image uses non-standard sparse image block dimensions. The
--         @formatProperties.imageGranularity@ values do not match the
--         standard sparse image block dimension corresponding to the
--         image’s format.
--
-- -   @imageMipTailFirstLod@ is the first mip level at which image
--     subresources are included in the mip tail region.
--
-- -   @imageMipTailSize@ is the memory size (in bytes) of the mip tail
--     region. If @formatProperties.flags@ contains
--     @VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT@, this is the size of the
--     whole mip tail, otherwise this is the size of the mip tail of a
--     single array layer. This value is guaranteed to be a multiple of the
--     sparse block size in bytes.
--
-- -   @imageMipTailOffset@ is the opaque memory offset used with
--     'VkSparseImageOpaqueMemoryBindInfo' to bind the mip tail region(s).
--
-- -   @imageMipTailStride@ is the offset stride between each array-layer’s
--     mip tail, if @formatProperties.flags@ does not contain
--     @VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT@ (otherwise the value is
--     undefined).
--
-- = Description
-- #_description#
--
-- = See Also
-- #_see_also#
--
-- @VkDeviceSize@, 'VkSparseImageFormatProperties',
-- 'Graphics.Vulkan.Core11.Promoted_from_VK_KHR_get_memory_requirements2.VkSparseImageMemoryRequirements2',
-- 'vkGetImageSparseMemoryRequirements'
data VkSparseImageMemoryRequirements = VkSparseImageMemoryRequirements
  { -- No documentation found for Nested "VkSparseImageMemoryRequirements" "vkFormatProperties"
  vkFormatProperties :: VkSparseImageFormatProperties
  , -- No documentation found for Nested "VkSparseImageMemoryRequirements" "vkImageMipTailFirstLod"
  vkImageMipTailFirstLod :: Word32
  , -- No documentation found for Nested "VkSparseImageMemoryRequirements" "vkImageMipTailSize"
  vkImageMipTailSize :: VkDeviceSize
  , -- No documentation found for Nested "VkSparseImageMemoryRequirements" "vkImageMipTailOffset"
  vkImageMipTailOffset :: VkDeviceSize
  , -- No documentation found for Nested "VkSparseImageMemoryRequirements" "vkImageMipTailStride"
  vkImageMipTailStride :: VkDeviceSize
  }
  deriving (Eq, Show)

instance Storable VkSparseImageMemoryRequirements where
  sizeOf ~_ = 48
  alignment ~_ = 8
  peek ptr = VkSparseImageMemoryRequirements <$> peek (ptr `plusPtr` 0)
                                             <*> peek (ptr `plusPtr` 20)
                                             <*> peek (ptr `plusPtr` 24)
                                             <*> peek (ptr `plusPtr` 32)
                                             <*> peek (ptr `plusPtr` 40)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkFormatProperties (poked :: VkSparseImageMemoryRequirements))
                *> poke (ptr `plusPtr` 20) (vkImageMipTailFirstLod (poked :: VkSparseImageMemoryRequirements))
                *> poke (ptr `plusPtr` 24) (vkImageMipTailSize (poked :: VkSparseImageMemoryRequirements))
                *> poke (ptr `plusPtr` 32) (vkImageMipTailOffset (poked :: VkSparseImageMemoryRequirements))
                *> poke (ptr `plusPtr` 40) (vkImageMipTailStride (poked :: VkSparseImageMemoryRequirements))
-- | VkImageSubresource - Structure specifying a image subresource
--
-- = Description
-- #_description#
--
-- == Valid Usage (Implicit)
--
-- -   @aspectMask@ /must/ be a valid combination of
--     'VkImageAspectFlagBits' values
--
-- -   @aspectMask@ /must/ not be @0@
--
-- = See Also
-- #_see_also#
--
-- 'VkImageAspectFlags', 'VkSparseImageMemoryBind',
-- 'Graphics.Vulkan.Core10.Image.vkGetImageSubresourceLayout'
data VkImageSubresource = VkImageSubresource
  { -- No documentation found for Nested "VkImageSubresource" "vkAspectMask"
  vkAspectMask :: VkImageAspectFlags
  , -- No documentation found for Nested "VkImageSubresource" "vkMipLevel"
  vkMipLevel :: Word32
  , -- No documentation found for Nested "VkImageSubresource" "vkArrayLayer"
  vkArrayLayer :: Word32
  }
  deriving (Eq, Show)

instance Storable VkImageSubresource where
  sizeOf ~_ = 12
  alignment ~_ = 4
  peek ptr = VkImageSubresource <$> peek (ptr `plusPtr` 0)
                                <*> peek (ptr `plusPtr` 4)
                                <*> peek (ptr `plusPtr` 8)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkAspectMask (poked :: VkImageSubresource))
                *> poke (ptr `plusPtr` 4) (vkMipLevel (poked :: VkImageSubresource))
                *> poke (ptr `plusPtr` 8) (vkArrayLayer (poked :: VkImageSubresource))
-- | VkSparseMemoryBind - Structure specifying a sparse memory bind operation
--
-- = Description
-- #_description#
--
-- The /binding range/ [@resourceOffset@, @resourceOffset@ + @size@) has
-- different constraints based on @flags@. If @flags@ contains
-- @VK_SPARSE_MEMORY_BIND_METADATA_BIT@, the binding range /must/ be within
-- the mip tail region of the metadata aspect. This metadata region is
-- defined by:
--
-- []
--     metadataRegion = [base, base + @imageMipTailSize@)
--
-- []
--     base = @imageMipTailOffset@ + @imageMipTailStride@ × n
--
-- and @imageMipTailOffset@, @imageMipTailSize@, and @imageMipTailStride@
-- values are from the 'VkSparseImageMemoryRequirements' corresponding to
-- the metadata aspect of the image, and n is a valid array layer index for
-- the image,
--
-- @imageMipTailStride@ is considered to be zero for aspects where
-- @VkSparseImageMemoryRequirements@::@formatProperties.flags@ contains
-- @VK_SPARSE_IMAGE_FORMAT_SINGLE_MIPTAIL_BIT@.
--
-- If @flags@ does not contain @VK_SPARSE_MEMORY_BIND_METADATA_BIT@, the
-- binding range /must/ be within the range
-- [0,'Graphics.Vulkan.Core10.MemoryManagement.VkMemoryRequirements'::@size@).
--
-- == Valid Usage
--
-- -   If @memory@ is not
--     'Graphics.Vulkan.Core10.Constants.VK_NULL_HANDLE', @memory@ and
--     @memoryOffset@ /must/ match the memory requirements of the resource,
--     as described in section
--     <{html_spec_relative}#resources-association {html_spec_relative}#resources-association>
--
-- -   If @memory@ is not
--     'Graphics.Vulkan.Core10.Constants.VK_NULL_HANDLE', @memory@ /must/
--     not have been created with a memory type that reports
--     @VK_MEMORY_PROPERTY_LAZILY_ALLOCATED_BIT@ bit set
--
-- -   @size@ /must/ be greater than @0@
--
-- -   @resourceOffset@ /must/ be less than the size of the resource
--
-- -   @size@ /must/ be less than or equal to the size of the resource
--     minus @resourceOffset@
--
-- -   @memoryOffset@ /must/ be less than the size of @memory@
--
-- -   @size@ /must/ be less than or equal to the size of @memory@ minus
--     @memoryOffset@
--
-- == Valid Usage (Implicit)
--
-- -   If @memory@ is not
--     'Graphics.Vulkan.Core10.Constants.VK_NULL_HANDLE', @memory@ /must/
--     be a valid @VkDeviceMemory@ handle
--
-- -   @flags@ /must/ be a valid combination of
--     'VkSparseMemoryBindFlagBits' values
--
-- = See Also
-- #_see_also#
--
-- 'Graphics.Vulkan.Core10.Memory.VkDeviceMemory', @VkDeviceSize@,
-- 'VkSparseBufferMemoryBindInfo', 'VkSparseImageOpaqueMemoryBindInfo',
-- 'VkSparseMemoryBindFlags'
data VkSparseMemoryBind = VkSparseMemoryBind
  { -- No documentation found for Nested "VkSparseMemoryBind" "vkResourceOffset"
  vkResourceOffset :: VkDeviceSize
  , -- No documentation found for Nested "VkSparseMemoryBind" "vkSize"
  vkSize :: VkDeviceSize
  , -- No documentation found for Nested "VkSparseMemoryBind" "vkMemory"
  vkMemory :: VkDeviceMemory
  , -- No documentation found for Nested "VkSparseMemoryBind" "vkMemoryOffset"
  vkMemoryOffset :: VkDeviceSize
  , -- No documentation found for Nested "VkSparseMemoryBind" "vkFlags"
  vkFlags :: VkSparseMemoryBindFlags
  }
  deriving (Eq, Show)

instance Storable VkSparseMemoryBind where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek ptr = VkSparseMemoryBind <$> peek (ptr `plusPtr` 0)
                                <*> peek (ptr `plusPtr` 8)
                                <*> peek (ptr `plusPtr` 16)
                                <*> peek (ptr `plusPtr` 24)
                                <*> peek (ptr `plusPtr` 32)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkResourceOffset (poked :: VkSparseMemoryBind))
                *> poke (ptr `plusPtr` 8) (vkSize (poked :: VkSparseMemoryBind))
                *> poke (ptr `plusPtr` 16) (vkMemory (poked :: VkSparseMemoryBind))
                *> poke (ptr `plusPtr` 24) (vkMemoryOffset (poked :: VkSparseMemoryBind))
                *> poke (ptr `plusPtr` 32) (vkFlags (poked :: VkSparseMemoryBind))
-- | VkSparseImageMemoryBind - Structure specifying sparse image memory bind
--
-- = Description
-- #_description#
--
-- == Valid Usage
--
-- -   If the
--     <{html_spec_relative}#features-features-sparseResidencyAliased sparse aliased residency>
--     feature is not enabled, and if any other resources are bound to
--     ranges of @memory@, the range of @memory@ being bound /must/ not
--     overlap with those bound ranges
--
-- -   @memory@ and @memoryOffset@ /must/ match the memory requirements of
--     the calling command’s @image@, as described in section
--     <{html_spec_relative}#resources-association {html_spec_relative}#resources-association>
--
-- -   @subresource@ /must/ be a valid image subresource for @image@ (see
--     <{html_spec_relative}#resources-image-views {html_spec_relative}#resources-image-views>)
--
-- -   @offset.x@ /must/ be a multiple of the sparse image block width
--     (@VkSparseImageFormatProperties@::@imageGranularity.width@) of the
--     image
--
-- -   @extent.width@ /must/ either be a multiple of the sparse image block
--     width of the image, or else (@extent.width@ + @offset.x@) /must/
--     equal the width of the image subresource
--
-- -   @offset.y@ /must/ be a multiple of the sparse image block height
--     (@VkSparseImageFormatProperties@::@imageGranularity.height@) of the
--     image
--
-- -   @extent.height@ /must/ either be a multiple of the sparse image
--     block height of the image, or else (@extent.height@ + @offset.y@)
--     /must/ equal the height of the image subresource
--
-- -   @offset.z@ /must/ be a multiple of the sparse image block depth
--     (@VkSparseImageFormatProperties@::@imageGranularity.depth@) of the
--     image
--
-- -   @extent.depth@ /must/ either be a multiple of the sparse image block
--     depth of the image, or else (@extent.depth@ + @offset.z@) /must/
--     equal the depth of the image subresource
--
-- == Valid Usage (Implicit)
--
-- -   @subresource@ /must/ be a valid @VkImageSubresource@ structure
--
-- -   If @memory@ is not
--     'Graphics.Vulkan.Core10.Constants.VK_NULL_HANDLE', @memory@ /must/
--     be a valid @VkDeviceMemory@ handle
--
-- -   @flags@ /must/ be a valid combination of
--     'VkSparseMemoryBindFlagBits' values
--
-- = See Also
-- #_see_also#
--
-- 'Graphics.Vulkan.Core10.Memory.VkDeviceMemory', @VkDeviceSize@,
-- 'Graphics.Vulkan.Core10.DeviceInitialization.VkExtent3D',
-- 'VkImageSubresource', 'VkOffset3D', 'VkSparseImageMemoryBindInfo',
-- 'VkSparseMemoryBindFlags'
data VkSparseImageMemoryBind = VkSparseImageMemoryBind
  { -- No documentation found for Nested "VkSparseImageMemoryBind" "vkSubresource"
  vkSubresource :: VkImageSubresource
  , -- No documentation found for Nested "VkSparseImageMemoryBind" "vkOffset"
  vkOffset :: VkOffset3D
  , -- No documentation found for Nested "VkSparseImageMemoryBind" "vkExtent"
  vkExtent :: VkExtent3D
  , -- No documentation found for Nested "VkSparseImageMemoryBind" "vkMemory"
  vkMemory :: VkDeviceMemory
  , -- No documentation found for Nested "VkSparseImageMemoryBind" "vkMemoryOffset"
  vkMemoryOffset :: VkDeviceSize
  , -- No documentation found for Nested "VkSparseImageMemoryBind" "vkFlags"
  vkFlags :: VkSparseMemoryBindFlags
  }
  deriving (Eq, Show)

instance Storable VkSparseImageMemoryBind where
  sizeOf ~_ = 64
  alignment ~_ = 8
  peek ptr = VkSparseImageMemoryBind <$> peek (ptr `plusPtr` 0)
                                     <*> peek (ptr `plusPtr` 12)
                                     <*> peek (ptr `plusPtr` 24)
                                     <*> peek (ptr `plusPtr` 40)
                                     <*> peek (ptr `plusPtr` 48)
                                     <*> peek (ptr `plusPtr` 56)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSubresource (poked :: VkSparseImageMemoryBind))
                *> poke (ptr `plusPtr` 12) (vkOffset (poked :: VkSparseImageMemoryBind))
                *> poke (ptr `plusPtr` 24) (vkExtent (poked :: VkSparseImageMemoryBind))
                *> poke (ptr `plusPtr` 40) (vkMemory (poked :: VkSparseImageMemoryBind))
                *> poke (ptr `plusPtr` 48) (vkMemoryOffset (poked :: VkSparseImageMemoryBind))
                *> poke (ptr `plusPtr` 56) (vkFlags (poked :: VkSparseImageMemoryBind))
-- | VkSparseBufferMemoryBindInfo - Structure specifying a sparse buffer
-- memory bind operation
--
-- = Description
-- #_description#
--
-- == Valid Usage (Implicit)
--
-- -   @buffer@ /must/ be a valid @VkBuffer@ handle
--
-- -   @pBinds@ /must/ be a valid pointer to an array of @bindCount@ valid
--     @VkSparseMemoryBind@ structures
--
-- -   @bindCount@ /must/ be greater than @0@
--
-- = See Also
-- #_see_also#
--
-- 'VkBindSparseInfo', 'Graphics.Vulkan.Core10.MemoryManagement.VkBuffer',
-- 'VkSparseMemoryBind'
data VkSparseBufferMemoryBindInfo = VkSparseBufferMemoryBindInfo
  { -- No documentation found for Nested "VkSparseBufferMemoryBindInfo" "vkBuffer"
  vkBuffer :: VkBuffer
  , -- No documentation found for Nested "VkSparseBufferMemoryBindInfo" "vkBindCount"
  vkBindCount :: Word32
  , -- No documentation found for Nested "VkSparseBufferMemoryBindInfo" "vkPBinds"
  vkPBinds :: Ptr VkSparseMemoryBind
  }
  deriving (Eq, Show)

instance Storable VkSparseBufferMemoryBindInfo where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkSparseBufferMemoryBindInfo <$> peek (ptr `plusPtr` 0)
                                          <*> peek (ptr `plusPtr` 8)
                                          <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkBuffer (poked :: VkSparseBufferMemoryBindInfo))
                *> poke (ptr `plusPtr` 8) (vkBindCount (poked :: VkSparseBufferMemoryBindInfo))
                *> poke (ptr `plusPtr` 16) (vkPBinds (poked :: VkSparseBufferMemoryBindInfo))
-- | VkSparseImageOpaqueMemoryBindInfo - Structure specifying sparse image
-- opaque memory bind info
--
-- = Description
-- #_description#
--
-- == Valid Usage
--
-- -   If the @flags@ member of any element of @pBinds@ contains
--     @VK_SPARSE_MEMORY_BIND_METADATA_BIT@, the binding range defined
--     /must/ be within the mip tail region of the metadata aspect of
--     @image@
--
-- == Valid Usage (Implicit)
--
-- -   @image@ /must/ be a valid @VkImage@ handle
--
-- -   @pBinds@ /must/ be a valid pointer to an array of @bindCount@ valid
--     @VkSparseMemoryBind@ structures
--
-- -   @bindCount@ /must/ be greater than @0@
--
-- = See Also
-- #_see_also#
--
-- 'VkBindSparseInfo', 'Graphics.Vulkan.Core10.MemoryManagement.VkImage',
-- 'VkSparseMemoryBind'
data VkSparseImageOpaqueMemoryBindInfo = VkSparseImageOpaqueMemoryBindInfo
  { -- No documentation found for Nested "VkSparseImageOpaqueMemoryBindInfo" "vkImage"
  vkImage :: VkImage
  , -- No documentation found for Nested "VkSparseImageOpaqueMemoryBindInfo" "vkBindCount"
  vkBindCount :: Word32
  , -- No documentation found for Nested "VkSparseImageOpaqueMemoryBindInfo" "vkPBinds"
  vkPBinds :: Ptr VkSparseMemoryBind
  }
  deriving (Eq, Show)

instance Storable VkSparseImageOpaqueMemoryBindInfo where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkSparseImageOpaqueMemoryBindInfo <$> peek (ptr `plusPtr` 0)
                                               <*> peek (ptr `plusPtr` 8)
                                               <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkImage (poked :: VkSparseImageOpaqueMemoryBindInfo))
                *> poke (ptr `plusPtr` 8) (vkBindCount (poked :: VkSparseImageOpaqueMemoryBindInfo))
                *> poke (ptr `plusPtr` 16) (vkPBinds (poked :: VkSparseImageOpaqueMemoryBindInfo))
-- | VkSparseImageMemoryBindInfo - Structure specifying sparse image memory
-- bind info
--
-- = Description
-- #_description#
--
-- == Valid Usage
--
-- -   The @subresource.mipLevel@ member of each element of @pBinds@ /must/
--     be less than the @mipLevels@ specified in
--     'Graphics.Vulkan.Core10.Image.VkImageCreateInfo' when @image@ was
--     created
--
-- -   The @subresource.arrayLayer@ member of each element of @pBinds@
--     /must/ be less than the @arrayLayers@ specified in
--     'Graphics.Vulkan.Core10.Image.VkImageCreateInfo' when @image@ was
--     created
--
-- == Valid Usage (Implicit)
--
-- -   @image@ /must/ be a valid @VkImage@ handle
--
-- -   @pBinds@ /must/ be a valid pointer to an array of @bindCount@ valid
--     @VkSparseImageMemoryBind@ structures
--
-- -   @bindCount@ /must/ be greater than @0@
--
-- = See Also
-- #_see_also#
--
-- 'VkBindSparseInfo', 'Graphics.Vulkan.Core10.MemoryManagement.VkImage',
-- 'VkSparseImageMemoryBind'
data VkSparseImageMemoryBindInfo = VkSparseImageMemoryBindInfo
  { -- No documentation found for Nested "VkSparseImageMemoryBindInfo" "vkImage"
  vkImage :: VkImage
  , -- No documentation found for Nested "VkSparseImageMemoryBindInfo" "vkBindCount"
  vkBindCount :: Word32
  , -- No documentation found for Nested "VkSparseImageMemoryBindInfo" "vkPBinds"
  vkPBinds :: Ptr VkSparseImageMemoryBind
  }
  deriving (Eq, Show)

instance Storable VkSparseImageMemoryBindInfo where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkSparseImageMemoryBindInfo <$> peek (ptr `plusPtr` 0)
                                         <*> peek (ptr `plusPtr` 8)
                                         <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkImage (poked :: VkSparseImageMemoryBindInfo))
                *> poke (ptr `plusPtr` 8) (vkBindCount (poked :: VkSparseImageMemoryBindInfo))
                *> poke (ptr `plusPtr` 16) (vkPBinds (poked :: VkSparseImageMemoryBindInfo))
-- | VkBindSparseInfo - Structure specifying a sparse binding operation
--
-- = Description
-- #_description#
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be @VK_STRUCTURE_TYPE_BIND_SPARSE_INFO@
--
-- -   @pNext@ /must/ be @NULL@ or a pointer to a valid instance of
--     'Graphics.Vulkan.Core11.Promoted_from_VK_KHR_device_group.VkDeviceGroupBindSparseInfo'
--
-- -   If @waitSemaphoreCount@ is not @0@, @pWaitSemaphores@ /must/ be a
--     valid pointer to an array of @waitSemaphoreCount@ valid
--     @VkSemaphore@ handles
--
-- -   If @bufferBindCount@ is not @0@, @pBufferBinds@ /must/ be a valid
--     pointer to an array of @bufferBindCount@ valid
--     @VkSparseBufferMemoryBindInfo@ structures
--
-- -   If @imageOpaqueBindCount@ is not @0@, @pImageOpaqueBinds@ /must/ be
--     a valid pointer to an array of @imageOpaqueBindCount@ valid
--     @VkSparseImageOpaqueMemoryBindInfo@ structures
--
-- -   If @imageBindCount@ is not @0@, @pImageBinds@ /must/ be a valid
--     pointer to an array of @imageBindCount@ valid
--     @VkSparseImageMemoryBindInfo@ structures
--
-- -   If @signalSemaphoreCount@ is not @0@, @pSignalSemaphores@ /must/ be
--     a valid pointer to an array of @signalSemaphoreCount@ valid
--     @VkSemaphore@ handles
--
-- -   Both of the elements of @pSignalSemaphores@, and the elements of
--     @pWaitSemaphores@ that are valid handles /must/ have been created,
--     allocated, or retrieved from the same @VkDevice@
--
-- = See Also
-- #_see_also#
--
-- 'Graphics.Vulkan.Core10.Queue.VkSemaphore',
-- 'VkSparseBufferMemoryBindInfo', 'VkSparseImageMemoryBindInfo',
-- 'VkSparseImageOpaqueMemoryBindInfo',
-- 'Graphics.Vulkan.Core10.Core.VkStructureType', 'vkQueueBindSparse'
data VkBindSparseInfo = VkBindSparseInfo
  { -- No documentation found for Nested "VkBindSparseInfo" "vkSType"
  vkSType :: VkStructureType
  , -- No documentation found for Nested "VkBindSparseInfo" "vkPNext"
  vkPNext :: Ptr ()
  , -- No documentation found for Nested "VkBindSparseInfo" "vkWaitSemaphoreCount"
  vkWaitSemaphoreCount :: Word32
  , -- No documentation found for Nested "VkBindSparseInfo" "vkPWaitSemaphores"
  vkPWaitSemaphores :: Ptr VkSemaphore
  , -- No documentation found for Nested "VkBindSparseInfo" "vkBufferBindCount"
  vkBufferBindCount :: Word32
  , -- No documentation found for Nested "VkBindSparseInfo" "vkPBufferBinds"
  vkPBufferBinds :: Ptr VkSparseBufferMemoryBindInfo
  , -- No documentation found for Nested "VkBindSparseInfo" "vkImageOpaqueBindCount"
  vkImageOpaqueBindCount :: Word32
  , -- No documentation found for Nested "VkBindSparseInfo" "vkPImageOpaqueBinds"
  vkPImageOpaqueBinds :: Ptr VkSparseImageOpaqueMemoryBindInfo
  , -- No documentation found for Nested "VkBindSparseInfo" "vkImageBindCount"
  vkImageBindCount :: Word32
  , -- No documentation found for Nested "VkBindSparseInfo" "vkPImageBinds"
  vkPImageBinds :: Ptr VkSparseImageMemoryBindInfo
  , -- No documentation found for Nested "VkBindSparseInfo" "vkSignalSemaphoreCount"
  vkSignalSemaphoreCount :: Word32
  , -- No documentation found for Nested "VkBindSparseInfo" "vkPSignalSemaphores"
  vkPSignalSemaphores :: Ptr VkSemaphore
  }
  deriving (Eq, Show)

instance Storable VkBindSparseInfo where
  sizeOf ~_ = 96
  alignment ~_ = 8
  peek ptr = VkBindSparseInfo <$> peek (ptr `plusPtr` 0)
                              <*> peek (ptr `plusPtr` 8)
                              <*> peek (ptr `plusPtr` 16)
                              <*> peek (ptr `plusPtr` 24)
                              <*> peek (ptr `plusPtr` 32)
                              <*> peek (ptr `plusPtr` 40)
                              <*> peek (ptr `plusPtr` 48)
                              <*> peek (ptr `plusPtr` 56)
                              <*> peek (ptr `plusPtr` 64)
                              <*> peek (ptr `plusPtr` 72)
                              <*> peek (ptr `plusPtr` 80)
                              <*> peek (ptr `plusPtr` 88)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkBindSparseInfo))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkBindSparseInfo))
                *> poke (ptr `plusPtr` 16) (vkWaitSemaphoreCount (poked :: VkBindSparseInfo))
                *> poke (ptr `plusPtr` 24) (vkPWaitSemaphores (poked :: VkBindSparseInfo))
                *> poke (ptr `plusPtr` 32) (vkBufferBindCount (poked :: VkBindSparseInfo))
                *> poke (ptr `plusPtr` 40) (vkPBufferBinds (poked :: VkBindSparseInfo))
                *> poke (ptr `plusPtr` 48) (vkImageOpaqueBindCount (poked :: VkBindSparseInfo))
                *> poke (ptr `plusPtr` 56) (vkPImageOpaqueBinds (poked :: VkBindSparseInfo))
                *> poke (ptr `plusPtr` 64) (vkImageBindCount (poked :: VkBindSparseInfo))
                *> poke (ptr `plusPtr` 72) (vkPImageBinds (poked :: VkBindSparseInfo))
                *> poke (ptr `plusPtr` 80) (vkSignalSemaphoreCount (poked :: VkBindSparseInfo))
                *> poke (ptr `plusPtr` 88) (vkPSignalSemaphores (poked :: VkBindSparseInfo))
-- | VkImageAspectFlags - Bitmask of VkImageAspectFlagBits
--
-- = Description
-- #_description#
--
-- @VkImageAspectFlags@ is a bitmask type for setting a mask of zero or
-- more 'VkImageAspectFlagBits'.
--
-- = See Also
-- #_see_also#
--
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.VkClearAttachment',
-- 'VkImageAspectFlagBits', 'VkImageSubresource',
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.VkImageSubresourceLayers',
-- 'Graphics.Vulkan.Core10.ImageView.VkImageSubresourceRange',
-- 'Graphics.Vulkan.Core11.Promoted_from_VK_KHR_maintenance2.VkInputAttachmentAspectReference',
-- 'VkSparseImageFormatProperties'
type VkImageAspectFlags = VkImageAspectFlagBits
-- | VkSparseMemoryBindFlags - Bitmask of VkSparseMemoryBindFlagBits
--
-- = Description
-- #_description#
--
-- @VkSparseMemoryBindFlags@ is a bitmask type for setting a mask of zero
-- or more 'VkSparseMemoryBindFlagBits'.
--
-- = See Also
-- #_see_also#
--
-- 'VkSparseImageMemoryBind', 'VkSparseMemoryBind',
-- 'VkSparseMemoryBindFlagBits'
type VkSparseMemoryBindFlags = VkSparseMemoryBindFlagBits
-- | VkSparseImageFormatFlags - Bitmask of VkSparseImageFormatFlagBits
--
-- = Description
-- #_description#
--
-- @VkSparseImageFormatFlags@ is a bitmask type for setting a mask of zero
-- or more 'VkSparseImageFormatFlagBits'.
--
-- = See Also
-- #_see_also#
--
-- 'VkSparseImageFormatFlagBits', 'VkSparseImageFormatProperties'
type VkSparseImageFormatFlags = VkSparseImageFormatFlagBits
