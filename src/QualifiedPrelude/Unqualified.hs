module QualifiedPrelude.Unqualified
  ( module Export
  , evaluateDeep
  , (<&>)
  , (.>)
  )
where



-- ***************
-- ** types
-- ***************

-- base
import Data.Functor.Identity           as Export ( Identity(..) )
import Control.Concurrent              as Export ( ThreadId )
import Control.Concurrent.Chan         as Export ( Chan )
import Control.Concurrent.MVar         as Export ( MVar )
import Data.Int                        as Export ( Int )
import Data.Word                       as Export ( Word )
import Prelude                         as Export ( Integer, Float, Double )
import Control.Monad.ST                as Export ( ST )
import Data.Bool                       as Export ( Bool(..) )
import Data.Char                       as Export ( Char )
import Data.Either                     as Export ( Either(..) )
import Data.IORef                      as Export ( IORef )
import Data.Maybe                      as Export ( Maybe(..) )
import Data.Monoid                     as Export ( Endo(..), All(..), Any(..), Sum(..), Product(..), First(..), Last(..), Alt(..), )
import Data.Ord                        as Export ( Ordering(..), Down(..) )
import Data.Ratio                      as Export ( Ratio, Rational )
import Data.String                     as Export ( String )
import Data.Void                       as Export ( Void )
import System.IO                       as Export ( IO )
import Data.Proxy                      as Export ( Proxy(..) )
import Data.Sequence                   as Export ( Seq )

-- dlist
import Data.DList                      as Export ( DList )
-- containers
import Data.Map                        as Export ( Map )
import Data.Set                        as Export ( Set )

-- **********************
-- ** classes and functions (yeah that grouping does not make too much sense)
-- **********************

-- base
import Prelude                         as Export ( undefined
                                                 , Eq (..)
                                                 , Ord (..)
                                                 , Enum (..)
                                                 , Bounded (..)
                                                 , (<$>)
                                                 , FilePath
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
                                                 , flip
                                                 , const
                                                 , seq
                                                 , reverse
                                                 , otherwise
                                                 , traverse
                                                 , realToFrac
                                                 , or
                                                 , and
                                                 , any
                                                 , (^)
                                                 , Foldable
                                                 , Traversable
                                                 ) 

import Data.Foldable                   as Export ( foldl'
                                                 , foldr'
                                                 , fold
                                                 , asum
                                                 )

import Data.List                       as Export ( partition
                                                 , null
                                                 , elem
                                                 , notElem
                                                 , zip
                                                 , zip3
                                                 , zipWith
                                                 , zipWith3
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

import Data.Tuple                      as Export ( swap
                                                 )

import Data.Char                       as Export ( ord
                                                 , chr
                                                 , isSpace
                                                 , toLower
                                                 , toUpper
                                                 )

import Data.Bool                       as Export ( bool
                                                 )

import Data.Maybe                      as Export ( fromMaybe
                                                 , maybe
                                                 , listToMaybe
                                                 , maybeToList
                                                 , catMaybes
                                                 , isNothing
                                                 , isJust
                                                 )

import Data.Word                       as Export ( Word32
                                                 )

import Data.Ord                        as Export ( comparing
                                                 )

import Data.Either                     as Export ( either
                                                 )

import Data.Ratio                      as Export ( (%)
                                                 , numerator
                                                 , denominator
                                                 )

import Text.Read                       as Export ( readMaybe
                                                 )

import Control.Monad                   as Export ( Functor (..)
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
                                                 , zipWithM
                                                 , (<$!>)
                                                 )

import Control.Applicative             as Export ( Applicative (..)
                                                 , Alternative (..)
                                                 , (<**>)
                                                 , liftA2
                                                 , liftA3
                                                 )

import Foreign.Storable                as Export ( Storable )
import GHC.Exts                        as Export ( Constraint )

import Control.Concurrent              as Export ( threadDelay
                                                 , forkIO
                                                 , forkOS
                                                 , forkOn
                                                 )

import Control.Concurrent.MVar         as Export ( newEmptyMVar
                                                 , newMVar
                                                 , takeMVar
                                                 , putMVar
                                                 , readMVar
                                                 , swapMVar
                                                 , tryTakeMVar
                                                 , tryPutMVar
                                                 , isEmptyMVar
                                                 , withMVar
                                                 , withMVarMasked
                                                 , modifyMVar_
                                                 , modifyMVar
                                                 , modifyMVarMasked_
                                                 , modifyMVarMasked
                                                 , tryReadMVar
                                                 , mkWeakMVar
                                                 , addMVarFinalizer
                                                 )

import Control.Exception               as Export ( evaluate
                                                 , bracket
                                                 , assert
                                                 , catch
                                                 , finally
                                                 , try
                                                 , SomeException(..)
                                                 , Exception(..)
                                                 , IOException
                                                 , ArithException(..)
                                                 , ArrayException(..)
                                                 , AssertionFailed(..)
                                                 , SomeAsyncException(..)
                                                 , AsyncException(..)
                                                 , NonTermination(..)
                                                 , NestedAtomically(..)
                                                 , BlockedIndefinitelyOnMVar(..)
                                                 , BlockedIndefinitelyOnSTM(..)
                                                 , AllocationLimitExceeded(..)
                                                 , Deadlock(..)
                                                 , NoMethodError(..)
                                                 , PatternMatchFail(..)
                                                 , RecConError(..)
                                                 , RecSelError(..)
                                                 , RecUpdError(..)
                                                 , ErrorCall(..)
                                                 -- , TypeError(..)
                                                 )

import Debug.Trace                     as Export ( trace
                                                 , traceId
                                                 , traceShowId
                                                 , traceShow
                                                 , traceStack
                                                 , traceShowId
                                                 , traceIO
                                                 , traceM
                                                 , traceShowM
                                                 )

import Control.Monad.IO.Class          as Export ( MonadIO (..)
                                                 , liftIO
                                                 )

import Foreign.ForeignPtr              as Export ( ForeignPtr
                                                 )

import Data.Monoid                     as Export ( (<>)
                                                 , mconcat
                                                 , Monoid (..)
                                                 )

import Data.Bifunctor                  as Export ( bimap )
import Data.Functor                    as Export ( (<$), ($>) )
import Data.Function                   as Export ( fix
                                                 , (&)
                                                 )
import System.IO                       as Export ( hFlush
                                                 , stdout
                                                 , stdin
                                                 , hClose
                                                 )

import Data.Typeable                   as Export ( Typeable
                                                 )

import Control.Arrow                   as Export ( first
                                                 , second
                                                 , (***)
                                                 , (&&&)
                                                 , (>>>)
                                                 , (<<<)
                                                 )


-- safe
import Safe                            as Export ( fromJustNote
                                                 , headNote
                                                 , lastNote
                                                 , readNote
                                                 )


-- extra
import Data.List.Extra                 as Export ( nubOrd )

import Control.Monad.Extra             as Export ( whenM
                                                 , unlessM
                                                 , ifM
                                                 , notM
                                                 , orM
                                                 , andM
                                                 , anyM
                                                 , allM
                                                 )

import Control.Monad.Fix               as Export ( MonadFix(..)
                                                 )


-- containers
import Data.Tree                       as Export ( Tree(..)
                                                 )


-- text
import Data.Text                       as Export ( Text )


-- transformers
import Control.Monad.Trans.Class       as Export ( lift
                                                 )

import Control.Monad.Trans.Maybe       as Export ( MaybeT (..)
                                                 )

-- import Control.Monad.Trans.Either      as Export ( EitherT (..)
--                                                  , hoistEither
--                                                  , left
--                                                  , right
--                                                  , bimapEitherT
--                                                  )


-- binary
import Data.Binary                     as Export ( Binary ()
                                                 , encode
                                                 , decodeOrFail
                                                 )


-- deepseq
import Control.DeepSeq                 as Export ( deepseq
                                                 , force
                                                 , NFData
                                                 )

-- unordered-containers
import Data.HashSet                    as Export ( HashSet )
-- maps are lazy vs. strict conflicted; only qualified


-- tagged
import Data.Tagged                     as Export ( Tagged(..)
                                                 , retag
                                                 , untag
                                                 , tagSelf
                                                 , untagSelf
                                                 , asTaggedTypeOf
                                                 , tagWith
                                                 )





evaluateDeep :: Export.NFData a => a -> IO a
evaluateDeep = evaluate . force

(<&>) :: Functor f => f a -> (a -> b) -> f b
(<&>) = flip fmap
infixl 4 <&>

(.>) :: (a -> b) -> (b -> c) -> (a -> c)
f .> g = g . f
infixl 9 .>
