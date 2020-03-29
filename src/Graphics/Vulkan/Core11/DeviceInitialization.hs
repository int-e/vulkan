{-# language CPP #-}
module Graphics.Vulkan.Core11.DeviceInitialization  (enumerateInstanceVersion) where

import Control.Exception.Base (bracket)
import Foreign.Marshal.Alloc (callocBytes)
import Foreign.Marshal.Alloc (free)
import Foreign.Ptr (castFunPtr)
import Foreign.Ptr (nullPtr)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Foreign.Storable (Storable(peek))
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import GHC.Ptr (Ptr(Ptr))
import Data.Word (Word32)
import Control.Monad.Trans.Cont (ContT(..))
import Graphics.Vulkan.Dynamic (getInstanceProcAddr')
import Graphics.Vulkan.NamedType ((:::))
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkEnumerateInstanceVersion
  :: FunPtr (Ptr Word32 -> IO Result) -> Ptr Word32 -> IO Result

-- | vkEnumerateInstanceVersion - Query instance-level version before
-- instance creation
--
-- = Parameters
--
-- -   @pApiVersion@ is a pointer to a @uint32_t@, which is the version of
--     Vulkan supported by instance-level functionality, encoded as
--     described in
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#extendingvulkan-coreversions-versionnumbers>.
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- = See Also
--
-- No cross-references are available
enumerateInstanceVersion :: IO (("apiVersion" ::: Word32))
enumerateInstanceVersion  = evalContT $ do
  vkEnumerateInstanceVersion' <- lift $ mkVkEnumerateInstanceVersion . castFunPtr @_ @(("pApiVersion" ::: Ptr Word32) -> IO Result) <$> getInstanceProcAddr' nullPtr (Ptr "vkEnumerateInstanceVersion\NUL"#)
  pPApiVersion <- ContT $ bracket (callocBytes @Word32 4) free
  _ <- lift $ vkEnumerateInstanceVersion' (pPApiVersion)
  pApiVersion <- lift $ peek @Word32 pPApiVersion
  pure $ (pApiVersion)

