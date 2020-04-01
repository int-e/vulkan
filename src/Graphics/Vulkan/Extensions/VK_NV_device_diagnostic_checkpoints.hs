{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_NV_device_diagnostic_checkpoints  ( cmdSetCheckpointNV
                                                                       , getQueueCheckpointDataNV
                                                                       , QueueFamilyCheckpointPropertiesNV(..)
                                                                       , CheckpointDataNV(..)
                                                                       , NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_SPEC_VERSION
                                                                       , pattern NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_SPEC_VERSION
                                                                       , NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_EXTENSION_NAME
                                                                       , pattern NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_EXTENSION_NAME
                                                                       ) where

import Control.Exception.Base (bracket)
import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Marshal.Alloc (callocBytes)
import Foreign.Marshal.Alloc (free)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Data.Vector (generateM)
import Data.String (IsString)
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import Data.Word (Word32)
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Data.Vector (Vector)
import Graphics.Vulkan.CStruct.Utils (advancePtrBytes)
import Graphics.Vulkan.NamedType ((:::))
import Graphics.Vulkan.Core10.Handles (CommandBuffer)
import Graphics.Vulkan.Core10.Handles (CommandBuffer(..))
import Graphics.Vulkan.Core10.Handles (CommandBuffer_T)
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkCmdSetCheckpointNV))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkGetQueueCheckpointDataNV))
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits (PipelineStageFlagBits)
import Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits (PipelineStageFlags)
import Graphics.Vulkan.Core10.Handles (Queue)
import Graphics.Vulkan.Core10.Handles (Queue(..))
import Graphics.Vulkan.Core10.Handles (Queue_T)
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_CHECKPOINT_DATA_NV))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_QUEUE_FAMILY_CHECKPOINT_PROPERTIES_NV))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetCheckpointNV
  :: FunPtr (Ptr CommandBuffer_T -> Ptr () -> IO ()) -> Ptr CommandBuffer_T -> Ptr () -> IO ()

-- | vkCmdSetCheckpointNV - insert diagnostic checkpoint in command stream
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.CommandBuffer' is the command buffer
--     that will receive the marker
--
-- -   @pCheckpointMarker@ is an opaque application-provided value that
--     will be associated with the checkpoint.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.CommandBuffer' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.CommandBuffer' handle
--
-- -   'Graphics.Vulkan.Core10.Handles.CommandBuffer' /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.Core10.Handles.CommandPool' that
--     'Graphics.Vulkan.Core10.Handles.CommandBuffer' was allocated from
--     /must/ support graphics, compute, or transfer operations
--
-- == Host Synchronization
--
-- -   Host access to the 'Graphics.Vulkan.Core10.Handles.CommandPool' that
--     'Graphics.Vulkan.Core10.Handles.CommandBuffer' was allocated from
--     /must/ be externally synchronized
--
-- == Command Properties
--
-- \'
--
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
-- | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkCommandBufferLevel Command Buffer Levels> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#vkCmdBeginRenderPass Render Pass Scope> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkQueueFlagBits Supported Queue Types> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-types Pipeline Type> |
-- +============================================================================================================================+========================================================================================================================+=======================================================================================================================+=====================================================================================================================================+
-- | Primary                                                                                                                    | Both                                                                                                                   | Graphics                                                                                                              |                                                                                                                                     |
-- | Secondary                                                                                                                  |                                                                                                                        | Compute                                                                                                               |                                                                                                                                     |
-- |                                                                                                                            |                                                                                                                        | Transfer                                                                                                              |                                                                                                                                     |
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.CommandBuffer'
cmdSetCheckpointNV :: CommandBuffer -> ("checkpointMarker" ::: Ptr ()) -> IO ()
cmdSetCheckpointNV commandBuffer checkpointMarker = do
  let vkCmdSetCheckpointNV' = mkVkCmdSetCheckpointNV (pVkCmdSetCheckpointNV (deviceCmds (commandBuffer :: CommandBuffer)))
  vkCmdSetCheckpointNV' (commandBufferHandle (commandBuffer)) (checkpointMarker)
  pure $ ()


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetQueueCheckpointDataNV
  :: FunPtr (Ptr Queue_T -> Ptr Word32 -> Ptr CheckpointDataNV -> IO ()) -> Ptr Queue_T -> Ptr Word32 -> Ptr CheckpointDataNV -> IO ()

-- | vkGetQueueCheckpointDataNV - retrieve diagnostic checkpoint data
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Queue' is the
--     'Graphics.Vulkan.Core10.Handles.Queue' object the caller would like
--     to retrieve checkpoint data for
--
-- -   @pCheckpointDataCount@ is a pointer to an integer related to the
--     number of checkpoint markers available or queried, as described
--     below.
--
-- -   @pCheckpointData@ is either @NULL@ or a pointer to an array of
--     'CheckpointDataNV' structures.
--
-- = Description
--
-- If @pCheckpointData@ is @NULL@, then the number of checkpoint markers
-- available is returned in @pCheckpointDataCount@.
--
-- Otherwise, @pCheckpointDataCount@ /must/ point to a variable set by the
-- user to the number of elements in the @pCheckpointData@ array, and on
-- return the variable is overwritten with the number of structures
-- actually written to @pCheckpointData@.
--
-- If @pCheckpointDataCount@ is less than the number of checkpoint markers
-- available, at most @pCheckpointDataCount@ structures will be written.
--
-- == Valid Usage
--
-- -   The device that 'Graphics.Vulkan.Core10.Handles.Queue' belongs to
--     /must/ be in the lost state
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Queue' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Queue' handle
--
-- -   @pCheckpointDataCount@ /must/ be a valid pointer to a @uint32_t@
--     value
--
-- -   If the value referenced by @pCheckpointDataCount@ is not @0@, and
--     @pCheckpointData@ is not @NULL@, @pCheckpointData@ /must/ be a valid
--     pointer to an array of @pCheckpointDataCount@ 'CheckpointDataNV'
--     structures
--
-- = See Also
--
-- 'CheckpointDataNV', 'Graphics.Vulkan.Core10.Handles.Queue'
getQueueCheckpointDataNV :: Queue -> IO (("checkpointData" ::: Vector CheckpointDataNV))
getQueueCheckpointDataNV queue = evalContT $ do
  let vkGetQueueCheckpointDataNV' = mkVkGetQueueCheckpointDataNV (pVkGetQueueCheckpointDataNV (deviceCmds (queue :: Queue)))
  let queue' = queueHandle (queue)
  pPCheckpointDataCount <- ContT $ bracket (callocBytes @Word32 4) free
  lift $ vkGetQueueCheckpointDataNV' queue' (pPCheckpointDataCount) (nullPtr)
  pCheckpointDataCount <- lift $ peek @Word32 pPCheckpointDataCount
  pPCheckpointData <- ContT $ bracket (callocBytes @CheckpointDataNV ((fromIntegral (pCheckpointDataCount)) * 32)) free
  _ <- traverse (\i -> ContT $ pokeZeroCStruct (pPCheckpointData `advancePtrBytes` (i * 32) :: Ptr CheckpointDataNV) . ($ ())) [0..(fromIntegral (pCheckpointDataCount)) - 1]
  lift $ vkGetQueueCheckpointDataNV' queue' (pPCheckpointDataCount) ((pPCheckpointData))
  pCheckpointDataCount' <- lift $ peek @Word32 pPCheckpointDataCount
  pCheckpointData' <- lift $ generateM (fromIntegral (pCheckpointDataCount')) (\i -> peekCStruct @CheckpointDataNV (((pPCheckpointData) `advancePtrBytes` (32 * (i)) :: Ptr CheckpointDataNV)))
  pure $ (pCheckpointData')


-- | VkQueueFamilyCheckpointPropertiesNV - return structure for queue family
-- checkpoint info query
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PipelineStageFlags',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data QueueFamilyCheckpointPropertiesNV = QueueFamilyCheckpointPropertiesNV
  { -- | @checkpointExecutionStageMask@ is a mask indicating which pipeline
    -- stages the implementation can execute checkpoint markers in.
    checkpointExecutionStageMask :: PipelineStageFlags }
  deriving (Typeable)
deriving instance Show QueueFamilyCheckpointPropertiesNV

instance ToCStruct QueueFamilyCheckpointPropertiesNV where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p QueueFamilyCheckpointPropertiesNV{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_QUEUE_FAMILY_CHECKPOINT_PROPERTIES_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr PipelineStageFlags)) (checkpointExecutionStageMask)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_QUEUE_FAMILY_CHECKPOINT_PROPERTIES_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr PipelineStageFlags)) (zero)
    f

instance FromCStruct QueueFamilyCheckpointPropertiesNV where
  peekCStruct p = do
    checkpointExecutionStageMask <- peek @PipelineStageFlags ((p `plusPtr` 16 :: Ptr PipelineStageFlags))
    pure $ QueueFamilyCheckpointPropertiesNV
             checkpointExecutionStageMask

instance Storable QueueFamilyCheckpointPropertiesNV where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero QueueFamilyCheckpointPropertiesNV where
  zero = QueueFamilyCheckpointPropertiesNV
           zero


-- | VkCheckpointDataNV - return structure for command buffer checkpoint data
--
-- == Valid Usage (Implicit)
--
-- Note that the stages at which a checkpoint marker /can/ be executed are
-- implementation-defined and /can/ be queried by calling
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.getPhysicalDeviceQueueFamilyProperties2'.
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PipelineStageFlagBits',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getQueueCheckpointDataNV'
data CheckpointDataNV = CheckpointDataNV
  { -- | @stage@ indicates which pipeline stage the checkpoint marker data refers
    -- to.
    stage :: PipelineStageFlagBits
  , -- | @pCheckpointMarker@ contains the value of the last checkpoint marker
    -- executed in the stage that @stage@ refers to.
    checkpointMarker :: Ptr ()
  }
  deriving (Typeable)
deriving instance Show CheckpointDataNV

instance ToCStruct CheckpointDataNV where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p CheckpointDataNV{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_CHECKPOINT_DATA_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr PipelineStageFlagBits)) (stage)
    poke ((p `plusPtr` 24 :: Ptr (Ptr ()))) (checkpointMarker)
    f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_CHECKPOINT_DATA_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr PipelineStageFlagBits)) (zero)
    poke ((p `plusPtr` 24 :: Ptr (Ptr ()))) (zero)
    f

instance FromCStruct CheckpointDataNV where
  peekCStruct p = do
    stage <- peek @PipelineStageFlagBits ((p `plusPtr` 16 :: Ptr PipelineStageFlagBits))
    pCheckpointMarker <- peek @(Ptr ()) ((p `plusPtr` 24 :: Ptr (Ptr ())))
    pure $ CheckpointDataNV
             stage pCheckpointMarker

instance Storable CheckpointDataNV where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero CheckpointDataNV where
  zero = CheckpointDataNV
           zero
           zero


type NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_SPEC_VERSION = 2

-- No documentation found for TopLevel "VK_NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_SPEC_VERSION"
pattern NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_SPEC_VERSION :: forall a . Integral a => a
pattern NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_SPEC_VERSION = 2


type NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_EXTENSION_NAME = "VK_NV_device_diagnostic_checkpoints"

-- No documentation found for TopLevel "VK_NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_EXTENSION_NAME"
pattern NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern NV_DEVICE_DIAGNOSTIC_CHECKPOINTS_EXTENSION_NAME = "VK_NV_device_diagnostic_checkpoints"
