{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer  ( getAndroidHardwareBufferPropertiesANDROID
                                                                                      , getMemoryAndroidHardwareBufferANDROID
                                                                                      , ImportAndroidHardwareBufferInfoANDROID(..)
                                                                                      , AndroidHardwareBufferUsageANDROID(..)
                                                                                      , AndroidHardwareBufferPropertiesANDROID(..)
                                                                                      , MemoryGetAndroidHardwareBufferInfoANDROID(..)
                                                                                      , AndroidHardwareBufferFormatPropertiesANDROID(..)
                                                                                      , ExternalFormatANDROID(..)
                                                                                      , ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_SPEC_VERSION
                                                                                      , pattern ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_SPEC_VERSION
                                                                                      , ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_EXTENSION_NAME
                                                                                      , pattern ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_EXTENSION_NAME
                                                                                      , AHardwareBuffer
                                                                                      ) where

import Control.Exception.Base (bracket)
import Control.Monad.IO.Class (liftIO)
import Data.Typeable (eqT)
import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Marshal.Alloc (callocBytes)
import Foreign.Marshal.Alloc (free)
import GHC.Base (when)
import GHC.IO (throwIO)
import GHC.Ptr (castPtr)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Control.Monad.IO.Class (MonadIO)
import Data.String (IsString)
import Data.Type.Equality ((:~:)(Refl))
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import Data.Word (Word32)
import Data.Word (Word64)
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Graphics.Vulkan.Extensions.WSITypes (AHardwareBuffer)
import Graphics.Vulkan.CStruct.Extends (Chain)
import Graphics.Vulkan.Core11.Enums.ChromaLocation (ChromaLocation)
import Graphics.Vulkan.Core10.ImageView (ComponentMapping)
import Graphics.Vulkan.Core10.Handles (Device)
import Graphics.Vulkan.Core10.Handles (Device(..))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkGetAndroidHardwareBufferPropertiesANDROID))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkGetMemoryAndroidHardwareBufferANDROID))
import Graphics.Vulkan.Core10.Handles (DeviceMemory)
import Graphics.Vulkan.Core10.BaseType (DeviceSize)
import Graphics.Vulkan.Core10.Handles (Device_T)
import Graphics.Vulkan.CStruct.Extends (Extends)
import Graphics.Vulkan.CStruct.Extends (Extensible(..))
import Graphics.Vulkan.Core10.Enums.Format (Format)
import Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits (FormatFeatureFlags)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.CStruct.Extends (PeekChain)
import Graphics.Vulkan.CStruct.Extends (PeekChain(..))
import Graphics.Vulkan.CStruct.Extends (PokeChain)
import Graphics.Vulkan.CStruct.Extends (PokeChain(..))
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Core11.Enums.SamplerYcbcrModelConversion (SamplerYcbcrModelConversion)
import Graphics.Vulkan.Core11.Enums.SamplerYcbcrRange (SamplerYcbcrRange)
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Exception (VulkanException(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_ANDROID))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_USAGE_ANDROID))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_EXTERNAL_FORMAT_ANDROID))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_IMPORT_ANDROID_HARDWARE_BUFFER_INFO_ANDROID))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_MEMORY_GET_ANDROID_HARDWARE_BUFFER_INFO_ANDROID))
import Graphics.Vulkan.Core10.Enums.Result (Result(SUCCESS))
import Graphics.Vulkan.Extensions.WSITypes (AHardwareBuffer)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetAndroidHardwareBufferPropertiesANDROID
  :: FunPtr (Ptr Device_T -> Ptr AHardwareBuffer -> Ptr (AndroidHardwareBufferPropertiesANDROID a) -> IO Result) -> Ptr Device_T -> Ptr AHardwareBuffer -> Ptr (AndroidHardwareBufferPropertiesANDROID a) -> IO Result

-- | vkGetAndroidHardwareBufferPropertiesANDROID - Get Properties of External
-- Memory Android Hardware Buffers
--
-- = Parameters
--
-- -   @device@ is the logical device that will be importing @buffer@.
--
-- -   @buffer@ is the Android hardware buffer which will be imported.
--
-- -   @pProperties@ is a pointer to a
--     'AndroidHardwareBufferPropertiesANDROID' structure in which the
--     properties of @buffer@ are returned.
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Extensions.VK_KHR_external_memory.ERROR_INVALID_EXTERNAL_HANDLE_KHR'
--
-- = See Also
--
-- 'AndroidHardwareBufferPropertiesANDROID',
-- 'Graphics.Vulkan.Core10.Handles.Device'
getAndroidHardwareBufferPropertiesANDROID :: forall a io . (PokeChain a, PeekChain a, MonadIO io) => Device -> Ptr AHardwareBuffer -> io (AndroidHardwareBufferPropertiesANDROID a)
getAndroidHardwareBufferPropertiesANDROID device buffer = liftIO . evalContT $ do
  let vkGetAndroidHardwareBufferPropertiesANDROID' = mkVkGetAndroidHardwareBufferPropertiesANDROID (pVkGetAndroidHardwareBufferPropertiesANDROID (deviceCmds (device :: Device)))
  pPProperties <- ContT (withZeroCStruct @(AndroidHardwareBufferPropertiesANDROID _))
  r <- lift $ vkGetAndroidHardwareBufferPropertiesANDROID' (deviceHandle (device)) (buffer) (pPProperties)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pProperties <- lift $ peekCStruct @(AndroidHardwareBufferPropertiesANDROID _) pPProperties
  pure $ (pProperties)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetMemoryAndroidHardwareBufferANDROID
  :: FunPtr (Ptr Device_T -> Ptr MemoryGetAndroidHardwareBufferInfoANDROID -> Ptr (Ptr AHardwareBuffer) -> IO Result) -> Ptr Device_T -> Ptr MemoryGetAndroidHardwareBufferInfoANDROID -> Ptr (Ptr AHardwareBuffer) -> IO Result

-- | vkGetMemoryAndroidHardwareBufferANDROID - Get an Android hardware buffer
-- for a memory object
--
-- = Parameters
--
-- -   @device@ is the logical device that created the device memory being
--     exported.
--
-- -   @pInfo@ is a pointer to a
--     'MemoryGetAndroidHardwareBufferInfoANDROID' structure containing
--     parameters of the export operation.
--
-- -   @pBuffer@ will return an Android hardware buffer representing the
--     underlying resources of the device memory object.
--
-- = Description
--
-- Each call to 'getMemoryAndroidHardwareBufferANDROID' /must/ return an
-- Android hardware buffer with a new reference acquired in addition to the
-- reference held by the 'Graphics.Vulkan.Core10.Handles.DeviceMemory'. To
-- avoid leaking resources, the application /must/ release the reference by
-- calling @AHardwareBuffer_release@ when it is no longer needed. When
-- called with the same handle in
-- 'MemoryGetAndroidHardwareBufferInfoANDROID'::@memory@,
-- 'getMemoryAndroidHardwareBufferANDROID' /must/ return the same Android
-- hardware buffer object. If the device memory was created by importing an
-- Android hardware buffer, 'getMemoryAndroidHardwareBufferANDROID' /must/
-- return that same Android hardware buffer object.
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_TOO_MANY_OBJECTS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'MemoryGetAndroidHardwareBufferInfoANDROID'
getMemoryAndroidHardwareBufferANDROID :: forall io . MonadIO io => Device -> MemoryGetAndroidHardwareBufferInfoANDROID -> io (Ptr AHardwareBuffer)
getMemoryAndroidHardwareBufferANDROID device info = liftIO . evalContT $ do
  let vkGetMemoryAndroidHardwareBufferANDROID' = mkVkGetMemoryAndroidHardwareBufferANDROID (pVkGetMemoryAndroidHardwareBufferANDROID (deviceCmds (device :: Device)))
  pInfo <- ContT $ withCStruct (info)
  pPBuffer <- ContT $ bracket (callocBytes @(Ptr AHardwareBuffer) 8) free
  r <- lift $ vkGetMemoryAndroidHardwareBufferANDROID' (deviceHandle (device)) pInfo (pPBuffer)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pBuffer <- lift $ peek @(Ptr AHardwareBuffer) pPBuffer
  pure $ (pBuffer)


-- | VkImportAndroidHardwareBufferInfoANDROID - Import memory from an Android
-- hardware buffer
--
-- = Description
--
-- If the 'Graphics.Vulkan.Core10.Memory.allocateMemory' command succeeds,
-- the implementation /must/ acquire a reference to the imported hardware
-- buffer, which it /must/ release when the device memory object is freed.
-- If the command fails, the implementation /must/ not retain a reference.
--
-- == Valid Usage
--
-- -   If @buffer@ is not @NULL@, Android hardware buffers /must/ be
--     supported for import, as reported by
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities.ExternalImageFormatProperties'
--     or
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities.ExternalBufferProperties'.
--
-- -   If @buffer@ is not @NULL@, it /must/ be a valid Android hardware
--     buffer object with @AHardwareBuffer_Desc@::@format@ and
--     @AHardwareBuffer_Desc@::@usage@ compatible with Vulkan as described
--     in
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-external-android-hardware-buffer Android Hardware Buffers>.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_IMPORT_ANDROID_HARDWARE_BUFFER_INFO_ANDROID'
--
-- -   @buffer@ /must/ be a valid pointer to an
--     'Graphics.Vulkan.Extensions.WSITypes.AHardwareBuffer' value
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data ImportAndroidHardwareBufferInfoANDROID = ImportAndroidHardwareBufferInfoANDROID
  { -- | @buffer@ is the Android hardware buffer to import.
    buffer :: Ptr AHardwareBuffer }
  deriving (Typeable)
deriving instance Show ImportAndroidHardwareBufferInfoANDROID

instance ToCStruct ImportAndroidHardwareBufferInfoANDROID where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p ImportAndroidHardwareBufferInfoANDROID{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_IMPORT_ANDROID_HARDWARE_BUFFER_INFO_ANDROID)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr (Ptr AHardwareBuffer))) (buffer)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_IMPORT_ANDROID_HARDWARE_BUFFER_INFO_ANDROID)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr (Ptr AHardwareBuffer))) (zero)
    f

instance FromCStruct ImportAndroidHardwareBufferInfoANDROID where
  peekCStruct p = do
    buffer <- peek @(Ptr AHardwareBuffer) ((p `plusPtr` 16 :: Ptr (Ptr AHardwareBuffer)))
    pure $ ImportAndroidHardwareBufferInfoANDROID
             buffer

instance Storable ImportAndroidHardwareBufferInfoANDROID where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero ImportAndroidHardwareBufferInfoANDROID where
  zero = ImportAndroidHardwareBufferInfoANDROID
           zero


-- | VkAndroidHardwareBufferUsageANDROID - Struct containing Android hardware
-- buffer usage flags
--
-- = Description
--
-- The @androidHardwareBufferUsage@ field /must/ include Android hardware
-- buffer usage flags listed in the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-external-android-hardware-buffer-usage AHardwareBuffer Usage Equivalence>
-- table when the corresponding Vulkan image usage or image creation flags
-- are included in the @usage@ or @flags@ fields of
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.PhysicalDeviceImageFormatInfo2'.
-- It /must/ include at least one GPU usage flag
-- (@AHARDWAREBUFFER_USAGE_GPU_@*), even if none of the corresponding
-- Vulkan usages or flags are requested.
--
-- Note
--
-- Requiring at least one GPU usage flag ensures that Android hardware
-- buffer memory will be allocated in a memory pool accessible to the
-- Vulkan implementation, and that specializing the memory layout based on
-- usage flags does not prevent it from being compatible with Vulkan.
-- Implementations /may/ avoid unnecessary restrictions caused by this
-- requirement by using vendor usage flags to indicate that only the Vulkan
-- uses indicated in
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.ImageFormatProperties2'
-- are required.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data AndroidHardwareBufferUsageANDROID = AndroidHardwareBufferUsageANDROID
  { -- | @androidHardwareBufferUsage@ returns the Android hardware buffer usage
    -- flags.
    androidHardwareBufferUsage :: Word64 }
  deriving (Typeable)
deriving instance Show AndroidHardwareBufferUsageANDROID

instance ToCStruct AndroidHardwareBufferUsageANDROID where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p AndroidHardwareBufferUsageANDROID{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_USAGE_ANDROID)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word64)) (androidHardwareBufferUsage)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_USAGE_ANDROID)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word64)) (zero)
    f

instance FromCStruct AndroidHardwareBufferUsageANDROID where
  peekCStruct p = do
    androidHardwareBufferUsage <- peek @Word64 ((p `plusPtr` 16 :: Ptr Word64))
    pure $ AndroidHardwareBufferUsageANDROID
             androidHardwareBufferUsage

instance Storable AndroidHardwareBufferUsageANDROID where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero AndroidHardwareBufferUsageANDROID where
  zero = AndroidHardwareBufferUsageANDROID
           zero


-- | VkAndroidHardwareBufferPropertiesANDROID - Properties of External Memory
-- Android Hardware Buffers
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID'
--
-- -   @pNext@ /must/ be @NULL@ or a pointer to a valid instance of
--     'AndroidHardwareBufferFormatPropertiesANDROID'
--
-- -   The @sType@ value of each struct in the @pNext@ chain /must/ be
--     unique
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.BaseType.DeviceSize',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getAndroidHardwareBufferPropertiesANDROID'
data AndroidHardwareBufferPropertiesANDROID (es :: [Type]) = AndroidHardwareBufferPropertiesANDROID
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
    next :: Chain es
  , -- | @allocationSize@ is the size of the external memory
    allocationSize :: DeviceSize
  , -- | @memoryTypeBits@ is a bitmask containing one bit set for every memory
    -- type which the specified Android hardware buffer /can/ be imported as.
    memoryTypeBits :: Word32
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (AndroidHardwareBufferPropertiesANDROID es)

instance Extensible AndroidHardwareBufferPropertiesANDROID where
  extensibleType = STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID
  setNext x next = x{next = next}
  getNext AndroidHardwareBufferPropertiesANDROID{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends AndroidHardwareBufferPropertiesANDROID e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @AndroidHardwareBufferFormatPropertiesANDROID = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (AndroidHardwareBufferPropertiesANDROID es) where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p AndroidHardwareBufferPropertiesANDROID{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    lift $ poke ((p `plusPtr` 16 :: Ptr DeviceSize)) (allocationSize)
    lift $ poke ((p `plusPtr` 24 :: Ptr Word32)) (memoryTypeBits)
    lift $ f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    lift $ poke ((p `plusPtr` 16 :: Ptr DeviceSize)) (zero)
    lift $ poke ((p `plusPtr` 24 :: Ptr Word32)) (zero)
    lift $ f

instance PeekChain es => FromCStruct (AndroidHardwareBufferPropertiesANDROID es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    allocationSize <- peek @DeviceSize ((p `plusPtr` 16 :: Ptr DeviceSize))
    memoryTypeBits <- peek @Word32 ((p `plusPtr` 24 :: Ptr Word32))
    pure $ AndroidHardwareBufferPropertiesANDROID
             next allocationSize memoryTypeBits

instance es ~ '[] => Zero (AndroidHardwareBufferPropertiesANDROID es) where
  zero = AndroidHardwareBufferPropertiesANDROID
           ()
           zero
           zero


-- | VkMemoryGetAndroidHardwareBufferInfoANDROID - Structure describing an
-- Android hardware buffer memory export operation
--
-- == Valid Usage
--
-- -   'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID'
--     /must/ have been included in
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExportMemoryAllocateInfo'::@handleTypes@
--     when @memory@ was created.
--
-- -   If the @pNext@ chain of the
--     'Graphics.Vulkan.Core10.Memory.MemoryAllocateInfo' used to allocate
--     @memory@ included a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     with non-@NULL@ @image@ member, then that @image@ /must/ already be
--     bound to @memory@.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_MEMORY_GET_ANDROID_HARDWARE_BUFFER_INFO_ANDROID'
--
-- -   @pNext@ /must/ be @NULL@
--
-- -   @memory@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.DeviceMemory' handle
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.DeviceMemory',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getMemoryAndroidHardwareBufferANDROID'
data MemoryGetAndroidHardwareBufferInfoANDROID = MemoryGetAndroidHardwareBufferInfoANDROID
  { -- | @memory@ is the memory object from which the Android hardware buffer
    -- will be exported.
    memory :: DeviceMemory }
  deriving (Typeable)
deriving instance Show MemoryGetAndroidHardwareBufferInfoANDROID

instance ToCStruct MemoryGetAndroidHardwareBufferInfoANDROID where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p MemoryGetAndroidHardwareBufferInfoANDROID{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_MEMORY_GET_ANDROID_HARDWARE_BUFFER_INFO_ANDROID)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr DeviceMemory)) (memory)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_MEMORY_GET_ANDROID_HARDWARE_BUFFER_INFO_ANDROID)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr DeviceMemory)) (zero)
    f

instance FromCStruct MemoryGetAndroidHardwareBufferInfoANDROID where
  peekCStruct p = do
    memory <- peek @DeviceMemory ((p `plusPtr` 16 :: Ptr DeviceMemory))
    pure $ MemoryGetAndroidHardwareBufferInfoANDROID
             memory

instance Storable MemoryGetAndroidHardwareBufferInfoANDROID where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero MemoryGetAndroidHardwareBufferInfoANDROID where
  zero = MemoryGetAndroidHardwareBufferInfoANDROID
           zero


-- | VkAndroidHardwareBufferFormatPropertiesANDROID - Structure describing
-- the image format properties of an Android hardware buffer
--
-- = Description
--
-- If the Android hardware buffer has one of the formats listed in the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-external-android-hardware-buffer-formats Format Equivalence table>,
-- then @format@ /must/ have the equivalent Vulkan format listed in the
-- table. Otherwise, @format@ /may/ be
-- 'Graphics.Vulkan.Core10.Enums.Format.FORMAT_UNDEFINED', indicating the
-- Android hardware buffer /can/ only be used with an external format.
--
-- The @formatFeatures@ member /must/ include
-- 'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_SAMPLED_IMAGE_BIT'
-- and at least one of
-- 'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT'
-- or
-- 'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT',
-- and /should/ include
-- 'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT'
-- and
-- 'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT'.
--
-- Note
--
-- The @formatFeatures@ member only indicates the features available when
-- using an
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-external-android-hardware-buffer-external-formats external-format image>
-- created from the Android hardware buffer. Images from Android hardware
-- buffers with a format other than
-- 'Graphics.Vulkan.Core10.Enums.Format.FORMAT_UNDEFINED' are subject to
-- the format capabilities obtained from
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.getPhysicalDeviceFormatProperties2',
-- and
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.getPhysicalDeviceImageFormatProperties2'
-- with appropriate parameters. These sets of features are independent of
-- each other, e.g. the external format will support sampler Y′CBCR
-- conversion even if the non-external format does not, and writing to
-- non-external format images is possible but writing to external format
-- images is not.
--
-- Android hardware buffers with the same external format /must/ have the
-- same support for
-- 'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT',
-- 'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_MIDPOINT_CHROMA_SAMPLES_BIT',
-- 'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_COSITED_CHROMA_SAMPLES_BIT',
-- 'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER_BIT',
-- 'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER_BIT',
-- and
-- 'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE_BIT'.
-- in @formatFeatures@. Other format features /may/ differ between Android
-- hardware buffers that have the same external format. This allows
-- applications to use the same
-- 'Graphics.Vulkan.Core11.Handles.SamplerYcbcrConversion' object (and
-- samplers and pipelines created from them) for any Android hardware
-- buffers that have the same external format.
--
-- If @format@ is not
-- 'Graphics.Vulkan.Core10.Enums.Format.FORMAT_UNDEFINED', then the value
-- of @samplerYcbcrConversionComponents@ /must/ be valid when used as the
-- @components@ member of
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'
-- with that format. If @format@ is
-- 'Graphics.Vulkan.Core10.Enums.Format.FORMAT_UNDEFINED', all members of
-- @samplerYcbcrConversionComponents@ /must/ be
-- 'Graphics.Vulkan.Core10.Enums.ComponentSwizzle.COMPONENT_SWIZZLE_IDENTITY'.
--
-- Implementations /may/ not always be able to determine the color model,
-- numerical range, or chroma offsets of the image contents, so the values
-- in 'AndroidHardwareBufferFormatPropertiesANDROID' are only suggestions.
-- Applications /should/ treat these values as sensible defaults to use in
-- the absence of more reliable information obtained through some other
-- means. If the underlying physical device is also usable via OpenGL ES
-- with the
-- <https://www.khronos.org/registry/OpenGL/extensions/OES/OES_EGL_image_external.txt GL_OES_EGL_image_external>
-- extension, the implementation /should/ suggest values that will produce
-- similar sampled values as would be obtained by sampling the same
-- external image via @samplerExternalOES@ in OpenGL ES using equivalent
-- sampler parameters.
--
-- Note
--
-- Since
-- <https://www.khronos.org/registry/OpenGL/extensions/OES/OES_EGL_image_external.txt GL_OES_EGL_image_external>
-- does not require the same sampling and conversion calculations as Vulkan
-- does, achieving identical results between APIs /may/ not be possible on
-- some implementations.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core11.Enums.ChromaLocation.ChromaLocation',
-- 'Graphics.Vulkan.Core10.ImageView.ComponentMapping',
-- 'Graphics.Vulkan.Core10.Enums.Format.Format',
-- 'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FormatFeatureFlags',
-- 'Graphics.Vulkan.Core11.Enums.SamplerYcbcrModelConversion.SamplerYcbcrModelConversion',
-- 'Graphics.Vulkan.Core11.Enums.SamplerYcbcrRange.SamplerYcbcrRange',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data AndroidHardwareBufferFormatPropertiesANDROID = AndroidHardwareBufferFormatPropertiesANDROID
  { -- | @format@ is the Vulkan format corresponding to the Android hardware
    -- buffer’s format, or
    -- 'Graphics.Vulkan.Core10.Enums.Format.FORMAT_UNDEFINED' if there is not
    -- an equivalent Vulkan format.
    format :: Format
  , -- | @externalFormat@ is an implementation-defined external format identifier
    -- for use with 'ExternalFormatANDROID'. It /must/ not be zero.
    externalFormat :: Word64
  , -- | @formatFeatures@ describes the capabilities of this external format when
    -- used with an image bound to memory imported from @buffer@.
    formatFeatures :: FormatFeatureFlags
  , -- | @samplerYcbcrConversionComponents@ is the component swizzle that
    -- /should/ be used in
    -- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'.
    samplerYcbcrConversionComponents :: ComponentMapping
  , -- | @suggestedYcbcrModel@ is a suggested color model to use in the
    -- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'.
    suggestedYcbcrModel :: SamplerYcbcrModelConversion
  , -- | @suggestedYcbcrRange@ is a suggested numerical value range to use in
    -- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'.
    suggestedYcbcrRange :: SamplerYcbcrRange
  , -- | @suggestedXChromaOffset@ is a suggested X chroma offset to use in
    -- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'.
    suggestedXChromaOffset :: ChromaLocation
  , -- | @suggestedYChromaOffset@ is a suggested Y chroma offset to use in
    -- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionCreateInfo'.
    suggestedYChromaOffset :: ChromaLocation
  }
  deriving (Typeable)
deriving instance Show AndroidHardwareBufferFormatPropertiesANDROID

instance ToCStruct AndroidHardwareBufferFormatPropertiesANDROID where
  withCStruct x f = allocaBytesAligned 72 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p AndroidHardwareBufferFormatPropertiesANDROID{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_ANDROID)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    lift $ poke ((p `plusPtr` 16 :: Ptr Format)) (format)
    lift $ poke ((p `plusPtr` 24 :: Ptr Word64)) (externalFormat)
    lift $ poke ((p `plusPtr` 32 :: Ptr FormatFeatureFlags)) (formatFeatures)
    ContT $ pokeCStruct ((p `plusPtr` 36 :: Ptr ComponentMapping)) (samplerYcbcrConversionComponents) . ($ ())
    lift $ poke ((p `plusPtr` 52 :: Ptr SamplerYcbcrModelConversion)) (suggestedYcbcrModel)
    lift $ poke ((p `plusPtr` 56 :: Ptr SamplerYcbcrRange)) (suggestedYcbcrRange)
    lift $ poke ((p `plusPtr` 60 :: Ptr ChromaLocation)) (suggestedXChromaOffset)
    lift $ poke ((p `plusPtr` 64 :: Ptr ChromaLocation)) (suggestedYChromaOffset)
    lift $ f
  cStructSize = 72
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_ANDROID)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    lift $ poke ((p `plusPtr` 16 :: Ptr Format)) (zero)
    lift $ poke ((p `plusPtr` 24 :: Ptr Word64)) (zero)
    lift $ poke ((p `plusPtr` 32 :: Ptr FormatFeatureFlags)) (zero)
    ContT $ pokeCStruct ((p `plusPtr` 36 :: Ptr ComponentMapping)) (zero) . ($ ())
    lift $ poke ((p `plusPtr` 52 :: Ptr SamplerYcbcrModelConversion)) (zero)
    lift $ poke ((p `plusPtr` 56 :: Ptr SamplerYcbcrRange)) (zero)
    lift $ poke ((p `plusPtr` 60 :: Ptr ChromaLocation)) (zero)
    lift $ poke ((p `plusPtr` 64 :: Ptr ChromaLocation)) (zero)
    lift $ f

instance FromCStruct AndroidHardwareBufferFormatPropertiesANDROID where
  peekCStruct p = do
    format <- peek @Format ((p `plusPtr` 16 :: Ptr Format))
    externalFormat <- peek @Word64 ((p `plusPtr` 24 :: Ptr Word64))
    formatFeatures <- peek @FormatFeatureFlags ((p `plusPtr` 32 :: Ptr FormatFeatureFlags))
    samplerYcbcrConversionComponents <- peekCStruct @ComponentMapping ((p `plusPtr` 36 :: Ptr ComponentMapping))
    suggestedYcbcrModel <- peek @SamplerYcbcrModelConversion ((p `plusPtr` 52 :: Ptr SamplerYcbcrModelConversion))
    suggestedYcbcrRange <- peek @SamplerYcbcrRange ((p `plusPtr` 56 :: Ptr SamplerYcbcrRange))
    suggestedXChromaOffset <- peek @ChromaLocation ((p `plusPtr` 60 :: Ptr ChromaLocation))
    suggestedYChromaOffset <- peek @ChromaLocation ((p `plusPtr` 64 :: Ptr ChromaLocation))
    pure $ AndroidHardwareBufferFormatPropertiesANDROID
             format externalFormat formatFeatures samplerYcbcrConversionComponents suggestedYcbcrModel suggestedYcbcrRange suggestedXChromaOffset suggestedYChromaOffset

instance Zero AndroidHardwareBufferFormatPropertiesANDROID where
  zero = AndroidHardwareBufferFormatPropertiesANDROID
           zero
           zero
           zero
           zero
           zero
           zero
           zero
           zero


-- | VkExternalFormatANDROID - Structure containing an Android hardware
-- buffer external format
--
-- = Description
--
-- If @externalFormat@ is zero, the effect is as if the
-- 'ExternalFormatANDROID' structure was not present. Otherwise, the
-- @image@ will have the specified external format.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data ExternalFormatANDROID = ExternalFormatANDROID
  { -- | @externalFormat@ /must/ be @0@ or a value returned in the
    -- @externalFormat@ member of
    -- 'AndroidHardwareBufferFormatPropertiesANDROID' by an earlier call to
    -- 'getAndroidHardwareBufferPropertiesANDROID'
    externalFormat :: Word64 }
  deriving (Typeable)
deriving instance Show ExternalFormatANDROID

instance ToCStruct ExternalFormatANDROID where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p ExternalFormatANDROID{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_EXTERNAL_FORMAT_ANDROID)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word64)) (externalFormat)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_EXTERNAL_FORMAT_ANDROID)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word64)) (zero)
    f

instance FromCStruct ExternalFormatANDROID where
  peekCStruct p = do
    externalFormat <- peek @Word64 ((p `plusPtr` 16 :: Ptr Word64))
    pure $ ExternalFormatANDROID
             externalFormat

instance Storable ExternalFormatANDROID where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero ExternalFormatANDROID where
  zero = ExternalFormatANDROID
           zero


type ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_SPEC_VERSION = 3

-- No documentation found for TopLevel "VK_ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_SPEC_VERSION"
pattern ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_SPEC_VERSION :: forall a . Integral a => a
pattern ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_SPEC_VERSION = 3


type ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_EXTENSION_NAME = "VK_ANDROID_external_memory_android_hardware_buffer"

-- No documentation found for TopLevel "VK_ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_EXTENSION_NAME"
pattern ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern ANDROID_EXTERNAL_MEMORY_ANDROID_HARDWARE_BUFFER_EXTENSION_NAME = "VK_ANDROID_external_memory_android_hardware_buffer"

