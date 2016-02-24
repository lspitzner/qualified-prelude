import QPrelude.Basics
import QPrelude.ErrorIf

import Prelude                            ( Char
                                          , String
                                          , Int
                                          , Integer
                                          , Float
                                          , Double
                                          , Bool (..)
                                          , undefined
                                          , Eq (..)
                                          , Ord (..)
                                          , Enum (..)
                                          , Bounded (..)
                                          , Maybe (..)
                                          , Either (..)
                                          , IO
                                          , (<$>)
                                          , (.)
                                          , ($)
                                          , Num (..)
                                          , Integral (..)
                                          , Fractional (..)
                                          , Floating (..)
                                          , RealFrac (..)
                                          , RealFloat (..)
                                          , fromIntegral
                                          , error
                                          , foldr
                                          , foldl
                                          , foldr1
                                          , id
                                          , map
                                          , subtract
                                          , putStrLn
                                          , putStr
                                          , Show (..)
                                          , print
                                          , fst
                                          , snd
                                          , (++)
                                          , not
                                          , (&&)
                                          , (||)
                                          , curry
                                          , uncurry
                                          , Ordering (..)
                                          , flip
                                          , const
                                          , seq
                                          , reverse
                                          , otherwise
                                          , traverse
                                          , realToFrac
                                          , or
                                          , and
                                          , head
                                          , any
                                          , (^)
                                          , Foldable
                                          , Traversable
                                          )

import Data.Foldable                      ( foldl'
                                          , foldr'
                                          , fold
                                          , asum
                                          )

import Data.List                          ( partition
                                          , null
                                          , elem
                                          , notElem
                                          , minimum
                                          , maximum
                                          , length
                                          , all
                                          , take
                                          , drop
                                          , find
                                          , sum
                                          , zip
                                          , zip3
                                          , zipWith
                                          , repeat
                                          , replicate
                                          , iterate
                                          , nub
                                          , filter
                                          , intersperse
                                          , intercalate
                                          , isSuffixOf
                                          , isPrefixOf
                                          , dropWhile
                                          , takeWhile
                                          , unzip
                                          , break
                                          , transpose
                                          , sortBy
                                          , mapAccumL
                                          , mapAccumR
                                          , uncons
                                          )

import Data.Tuple                         ( swap
                                          )

import Data.Char                          ( ord
                                          , chr
                                          )

import Data.Maybe                         ( fromMaybe
                                          , maybe
                                          , listToMaybe
                                          , maybeToList
                                          , catMaybes
                                          )

import Data.Word                          ( Word32
                                          )

import Data.Ord                           ( comparing
                                          , Down (..)
                                          )

import Data.Either                        ( either
                                          )

import Data.Ratio                         ( Ratio
                                          , (%)
                                          , numerator
                                          , denominator
                                          )

import Text.Read                          ( readMaybe
                                          )

import Control.Monad                      ( Functor (..)
                                          , Monad (..)
                                          , MonadPlus (..)
                                          , mapM
                                          , mapM_
                                          , forM
                                          , forM_
                                          , sequence
                                          , sequence_
                                          , (=<<)
                                          , (>=>)
                                          , (<=<)
                                          , forever
                                          , void
                                          , join
                                          , replicateM
                                          , replicateM_
                                          , guard
                                          , when
                                          , unless
                                          , liftM
                                          , liftM2
                                          , liftM3
                                          , liftM4
                                          , liftM5
                                          , filterM
                                          )

import Control.Applicative                ( Applicative (..)
                                          , Alternative (..)
                                          )

import Foreign.Storable                   ( Storable )
import GHC.Exts                           ( Constraint )

import Control.Concurrent                 ( threadDelay
                                          , forkIO
                                          , forkOS
                                          )

import Control.Concurrent.MVar            ( MVar
                                          , newEmptyMVar
                                          , newMVar
                                          , putMVar
                                          , readMVar
                                          , takeMVar
                                          , swapMVar
                                          )

import Control.Exception                  ( evaluate
                                          , bracket
                                          , assert
                                          )

import Debug.Trace                        ( trace
                                          , traceId
                                          , traceShowId
                                          , traceShow
                                          , traceStack
                                          , traceShowId
                                          , traceIO
                                          , traceM
                                          , traceShowM
                                          )

import Foreign.ForeignPtr                 ( ForeignPtr
                                          )

import Data.Monoid                        ( (<>)
                                          , mconcat
                                          , Monoid (..)
                                          )

import Data.Bifunctor                     ( bimap )
import Data.Functor                       ( (<$), ($>) )
import Data.Function                      ( (&) )
import System.IO                          ( hFlush
                                          , stdout
                                          )

import Data.Typeable                      ( Typeable
                                          )

import Control.Arrow                      ( first
                                          , second
                                          , (***)
                                          , (&&&)
                                          , (>>>)
                                          , (<<<)
                                          )

import Data.Functor.Identity              ( Identity (..)
                                          )

import Data.Proxy                         ( Proxy (..)
                                          )

import Data.Version                       ( showVersion
                                          )

#ifdef MIN_VERSION_safe
import Safe                               ( fromJustNote
                                          , headNote
                                          , lastNote
                                          , readNote
                                          )
#endif

#ifdef MIN_VERSION_extra
import Data.List.Extra                    ( nubOrd
                                          , stripSuffix
                                          )
import Control.Monad.Extra                ( whenM
                                          , unlessM
                                          , ifM
                                          , notM
                                          , orM
                                          , andM
                                          , anyM
                                          , allM
                                          )
#endif

#ifdef MIN_VERSION_containers
import Data.Tree                          ( Tree(..)
                                          )
#endif

#ifdef MIN_VERSION_dlist
import Data.DList                         ( DList
                                          )
#endif

#ifdef MIN_VERSION_multistate
import Control.Monad.Trans.MultiRWS       ( MultiRWST (..)
                                          , MultiRWSTNull
                                          , MultiRWS
                                          , MonadMultiReader(..)
                                          , MonadMultiWriter(..)
                                          , MonadMultiState(..)
                                          , runMultiRWST
                                          , runMultiRWSTASW
                                          , runMultiRWSTW
                                          , runMultiRWSTAW
                                          , runMultiRWSTSW
                                          , runMultiRWSTNil
                                          , runMultiRWSTNil_
                                          -- , withMultiReader
                                          -- , withMultiReader_
                                          -- , withMultiReaders
                                          -- , withMultiReaders_
                                          -- , withMultiWriter
                                          -- , withMultiWriterAW
                                          -- , withMultiWriterWA
                                          -- , withMultiWriterW
                                          -- , withMultiWriters
                                          -- , withMultiWritersAW
                                          -- , withMultiWritersWA
                                          -- , withMultiWritersW
                                          -- , withMultiState
                                          -- , withMultiStateAS
                                          -- , withMultiStateSA
                                          -- , withMultiStateA
                                          -- , withMultiStateS
                                          -- , withMultiState_
                                          -- , withMultiStates
                                          -- , withMultiStatesAS
                                          -- , withMultiStatesSA
                                          -- , withMultiStatesA
                                          -- , withMultiStatesS
                                          -- , withMultiStates_
                                          , inflateReader
                                          , inflateMultiReader
                                          , inflateWriter
                                          , inflateMultiWriter
                                          , inflateState
                                          , inflateMultiState
                                          , mapMultiRWST
                                          , mGetRawR
                                          , mGetRawW
                                          , mGetRawS
                                          , mPutRawR
                                          , mPutRawW
                                          , mPutRawS
                                          )

import Control.Monad.Trans.MultiReader    ( runMultiReaderTNil
                                          , runMultiReaderTNil_
                                          , MultiReaderT (..)
                                          , MultiReader
                                          , MultiReaderTNull
                                          )
#endif

#ifdef MIN_VERSION_text
import Data.Text                          ( Text )
#endif

#ifdef MIN_VERSION_void
import Data.Void                          ( Void )
#endif

#ifdef MIN_VERSION_transformers
import Control.Monad.IO.Class             ( MonadIO (..)
                                          )

import Control.Monad.Trans.Class          ( lift
                                          )
import Control.Monad.Trans.Maybe          ( MaybeT (..)
                                          )

#endif

#ifdef MIN_VERSION_binary
import Data.Binary                        ( Binary ()
                                          , encode
                                          , decode
                                          , decodeOrFail
                                          )
#endif

#ifdef MIN_VERSION_either
import Control.Monad.Trans.Either         ( EitherT (..)
                                          , hoistEither
                                          , left
                                          , right
                                          , bimapEitherT
                                          )
#endif

#ifdef MIN_VERSION_deepseq
import Control.DeepSeq                    ( deepseq
                                          , force
                                          , NFData
                                          )
#endif
