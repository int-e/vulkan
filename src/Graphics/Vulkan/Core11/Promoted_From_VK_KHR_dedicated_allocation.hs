{-# language CPP #-}
module Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation  ( MemoryDedicatedRequirements(..)
                                                                         , MemoryDedicatedAllocateInfo(..)
                                                                         , StructureType(..)
                                                                         ) where

import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Foreign.Ptr (Ptr)
import Data.Kind (Type)
import Graphics.Vulkan.Core10.BaseType (bool32ToBool)
import Graphics.Vulkan.Core10.BaseType (boolToBool32)
import Graphics.Vulkan.Core10.BaseType (Bool32)
import Graphics.Vulkan.Core10.Handles (Buffer)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Core10.Handles (Image)
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(..))
-- | VkMemoryDedicatedRequirements - Structure describing dedicated
-- allocation requirements of buffer and image resources
--
-- = Description
--
-- When the implementation sets @requiresDedicatedAllocation@ to
-- 'Graphics.Vulkan.Core10.BaseType.TRUE', it /must/ also set
-- @prefersDedicatedAllocation@ to 'Graphics.Vulkan.Core10.BaseType.TRUE'.
--
-- If the 'MemoryDedicatedRequirements' structure is included in the
-- @pNext@ chain of the
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.MemoryRequirements2'
-- structure passed as the @pMemoryRequirements@ parameter of a
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.getBufferMemoryRequirements2'
-- call, @requiresDedicatedAllocation@ /may/ be
-- 'Graphics.Vulkan.Core10.BaseType.TRUE' under one of the following
-- conditions:
--
-- -   The @pNext@ chain of
--     'Graphics.Vulkan.Core10.Buffer.BufferCreateInfo' for the call to
--     'Graphics.Vulkan.Core10.Buffer.createBuffer' used to create the
--     buffer being queried included a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExternalMemoryBufferCreateInfo'
--     structure, and any of the handle types specified in
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExternalMemoryBufferCreateInfo'::@handleTypes@
--     requires dedicated allocation, as reported by
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities.getPhysicalDeviceExternalBufferProperties'
--     in
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities.ExternalBufferProperties'::@externalMemoryProperties.externalMemoryFeatures@,
--     the @requiresDedicatedAllocation@ field will be set to
--     'Graphics.Vulkan.Core10.BaseType.TRUE'.
--
-- In all other cases, @requiresDedicatedAllocation@ /must/ be set to
-- 'Graphics.Vulkan.Core10.BaseType.FALSE' by the implementation whenever a
-- 'MemoryDedicatedRequirements' structure is included in the @pNext@ chain
-- of the
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.MemoryRequirements2'
-- structure passed to a call to
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.getBufferMemoryRequirements2'.
--
-- If the 'MemoryDedicatedRequirements' structure is included in the
-- @pNext@ chain of the
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.MemoryRequirements2'
-- structure passed as the @pMemoryRequirements@ parameter of a
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.getBufferMemoryRequirements2'
-- call and
-- 'Graphics.Vulkan.Core10.Enums.BufferCreateFlagBits.BUFFER_CREATE_SPARSE_BINDING_BIT'
-- was set in
-- 'Graphics.Vulkan.Core10.Buffer.BufferCreateInfo'::'Graphics.Vulkan.Core10.BaseType.Flags'
-- when 'Graphics.Vulkan.Core10.Handles.Buffer' was created then the
-- implementation /must/ set both @prefersDedicatedAllocation@ and
-- @requiresDedicatedAllocation@ to
-- 'Graphics.Vulkan.Core10.BaseType.FALSE'.
--
-- If the 'MemoryDedicatedRequirements' structure is included in the
-- @pNext@ chain of the
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.MemoryRequirements2'
-- structure passed as the @pMemoryRequirements@ parameter of a
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.getImageMemoryRequirements2'
-- call, @requiresDedicatedAllocation@ /may/ be
-- 'Graphics.Vulkan.Core10.BaseType.TRUE' under one of the following
-- conditions:
--
-- -   The @pNext@ chain of 'Graphics.Vulkan.Core10.Image.ImageCreateInfo'
--     for the call to 'Graphics.Vulkan.Core10.Image.createImage' used to
--     create the image being queried included a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExternalMemoryImageCreateInfo'
--     structure, and any of the handle types specified in
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExternalMemoryImageCreateInfo'::@handleTypes@
--     requires dedicated allocation, as reported by
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.getPhysicalDeviceImageFormatProperties2'
--     in
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities.ExternalImageFormatProperties'::@externalMemoryProperties.externalMemoryFeatures@,
--     the @requiresDedicatedAllocation@ field will be set to
--     'Graphics.Vulkan.Core10.BaseType.TRUE'.
--
-- In all other cases, @requiresDedicatedAllocation@ /must/ be set to
-- 'Graphics.Vulkan.Core10.BaseType.FALSE' by the implementation whenever a
-- 'MemoryDedicatedRequirements' structure is included in the @pNext@ chain
-- of the
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.MemoryRequirements2'
-- structure passed to a call to
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.getImageMemoryRequirements2'.
--
-- If the 'MemoryDedicatedRequirements' structure is included in the
-- @pNext@ chain of the
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.MemoryRequirements2'
-- structure passed as the @pMemoryRequirements@ parameter of a
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.getImageMemoryRequirements2'
-- call and
-- 'Graphics.Vulkan.Core10.Enums.ImageCreateFlagBits.IMAGE_CREATE_SPARSE_BINDING_BIT'
-- was set in
-- 'Graphics.Vulkan.Core10.Image.ImageCreateInfo'::'Graphics.Vulkan.Core10.BaseType.Flags'
-- when 'Graphics.Vulkan.Core10.Handles.Image' was created then the
-- implementation /must/ set both @prefersDedicatedAllocation@ and
-- @requiresDedicatedAllocation@ to
-- 'Graphics.Vulkan.Core10.BaseType.FALSE'.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.BaseType.Bool32',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data MemoryDedicatedRequirements = MemoryDedicatedRequirements
  { -- | @prefersDedicatedAllocation@ specifies that the implementation would
    -- prefer a dedicated allocation for this resource. The application is
    -- still free to suballocate the resource but it /may/ get better
    -- performance if a dedicated allocation is used.
    prefersDedicatedAllocation :: Bool
  , -- | @requiresDedicatedAllocation@ specifies that a dedicated allocation is
    -- required for this resource.
    requiresDedicatedAllocation :: Bool
  }
  deriving (Typeable)
deriving instance Show MemoryDedicatedRequirements

instance ToCStruct MemoryDedicatedRequirements where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p MemoryDedicatedRequirements{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Bool32)) (boolToBool32 (prefersDedicatedAllocation))
    poke ((p `plusPtr` 20 :: Ptr Bool32)) (boolToBool32 (requiresDedicatedAllocation))
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_MEMORY_DEDICATED_REQUIREMENTS)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Bool32)) (boolToBool32 (zero))
    poke ((p `plusPtr` 20 :: Ptr Bool32)) (boolToBool32 (zero))
    f

instance FromCStruct MemoryDedicatedRequirements where
  peekCStruct p = do
    prefersDedicatedAllocation <- peek @Bool32 ((p `plusPtr` 16 :: Ptr Bool32))
    requiresDedicatedAllocation <- peek @Bool32 ((p `plusPtr` 20 :: Ptr Bool32))
    pure $ MemoryDedicatedRequirements
             (bool32ToBool prefersDedicatedAllocation) (bool32ToBool requiresDedicatedAllocation)

instance Storable MemoryDedicatedRequirements where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero MemoryDedicatedRequirements where
  zero = MemoryDedicatedRequirements
           zero
           zero


-- | VkMemoryDedicatedAllocateInfo - Specify a dedicated memory allocation
-- resource
--
-- == Valid Usage
--
-- -   At least one of 'Graphics.Vulkan.Core10.Handles.Image' and
--     'Graphics.Vulkan.Core10.Handles.Buffer' /must/ be
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE'
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Image' is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE',
--     'Graphics.Vulkan.Core10.Memory.MemoryAllocateInfo'::@allocationSize@
--     /must/ equal the
--     'Graphics.Vulkan.Core10.MemoryManagement.MemoryRequirements'::@size@
--     of the image
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Image' is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE',
--     'Graphics.Vulkan.Core10.Handles.Image' /must/ have been created
--     without
--     'Graphics.Vulkan.Core10.Enums.ImageCreateFlagBits.IMAGE_CREATE_SPARSE_BINDING_BIT'
--     set in
--     'Graphics.Vulkan.Core10.Image.ImageCreateInfo'::'Graphics.Vulkan.Core10.BaseType.Flags'
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Buffer' is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE',
--     'Graphics.Vulkan.Core10.Memory.MemoryAllocateInfo'::@allocationSize@
--     /must/ equal the
--     'Graphics.Vulkan.Core10.MemoryManagement.MemoryRequirements'::@size@
--     of the buffer
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Buffer' is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE',
--     'Graphics.Vulkan.Core10.Handles.Buffer' /must/ have been created
--     without
--     'Graphics.Vulkan.Core10.Enums.BufferCreateFlagBits.BUFFER_CREATE_SPARSE_BINDING_BIT'
--     set in
--     'Graphics.Vulkan.Core10.Buffer.BufferCreateInfo'::'Graphics.Vulkan.Core10.BaseType.Flags'
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Image' is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE' and
--     'Graphics.Vulkan.Core10.Memory.MemoryAllocateInfo' defines a memory
--     import operation with handle type
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT',
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT',
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT',
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT',
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT',
--     or
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT',
--     and the external handle was created by the Vulkan API, then the
--     memory being imported /must/ also be a dedicated image allocation
--     and 'Graphics.Vulkan.Core10.Handles.Image' must be identical to the
--     image associated with the imported memory.
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Buffer' is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE' and
--     'Graphics.Vulkan.Core10.Memory.MemoryAllocateInfo' defines a memory
--     import operation with handle type
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT',
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT',
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT',
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT',
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT',
--     or
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT',
--     and the external handle was created by the Vulkan API, then the
--     memory being imported /must/ also be a dedicated buffer allocation
--     and 'Graphics.Vulkan.Core10.Handles.Buffer' must be identical to the
--     buffer associated with the imported memory.
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Image' is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE' and
--     'Graphics.Vulkan.Core10.Memory.MemoryAllocateInfo' defines a memory
--     import operation with handle type
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT',
--     the memory being imported /must/ also be a dedicated image
--     allocation and 'Graphics.Vulkan.Core10.Handles.Image' must be
--     identical to the image associated with the imported memory.
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Buffer' is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE' and
--     'Graphics.Vulkan.Core10.Memory.MemoryAllocateInfo' defines a memory
--     import operation with handle type
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT',
--     the memory being imported /must/ also be a dedicated buffer
--     allocation and 'Graphics.Vulkan.Core10.Handles.Buffer' must be
--     identical to the buffer associated with the imported memory.
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Image' is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE',
--     'Graphics.Vulkan.Core10.Handles.Image' /must/ not have been created
--     with
--     'Graphics.Vulkan.Core10.Enums.ImageCreateFlagBits.IMAGE_CREATE_DISJOINT_BIT'
--     set in
--     'Graphics.Vulkan.Core10.Image.ImageCreateInfo'::'Graphics.Vulkan.Core10.BaseType.Flags'
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO'
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Image' is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE',
--     'Graphics.Vulkan.Core10.Handles.Image' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Image' handle
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Buffer' is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE',
--     'Graphics.Vulkan.Core10.Handles.Buffer' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Buffer' handle
--
-- -   Both of 'Graphics.Vulkan.Core10.Handles.Buffer', and
--     'Graphics.Vulkan.Core10.Handles.Image' that are valid handles of
--     non-ignored parameters /must/ have been created, allocated, or
--     retrieved from the same 'Graphics.Vulkan.Core10.Handles.Device'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Buffer',
-- 'Graphics.Vulkan.Core10.Handles.Image',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data MemoryDedicatedAllocateInfo = MemoryDedicatedAllocateInfo
  { -- | 'Graphics.Vulkan.Core10.Handles.Image' is
    -- 'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE' or a handle of an
    -- image which this memory will be bound to.
    image :: Image
  , -- | 'Graphics.Vulkan.Core10.Handles.Buffer' is
    -- 'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE' or a handle of a
    -- buffer which this memory will be bound to.
    buffer :: Buffer
  }
  deriving (Typeable)
deriving instance Show MemoryDedicatedAllocateInfo

instance ToCStruct MemoryDedicatedAllocateInfo where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p MemoryDedicatedAllocateInfo{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Image)) (image)
    poke ((p `plusPtr` 24 :: Ptr Buffer)) (buffer)
    f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    f

instance FromCStruct MemoryDedicatedAllocateInfo where
  peekCStruct p = do
    image <- peek @Image ((p `plusPtr` 16 :: Ptr Image))
    buffer <- peek @Buffer ((p `plusPtr` 24 :: Ptr Buffer))
    pure $ MemoryDedicatedAllocateInfo
             image buffer

instance Storable MemoryDedicatedAllocateInfo where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero MemoryDedicatedAllocateInfo where
  zero = MemoryDedicatedAllocateInfo
           zero
           zero

