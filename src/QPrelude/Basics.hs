module QPrelude.Basics
  ( (<&>)
  , evaluateDeep
  )
where



import Control.DeepSeq ( NFData, force )
import Control.Exception.Base ( evaluate )



(<&>) :: Functor f => f a -> (a -> b) -> f b
(<&>) = flip fmap

evaluateDeep :: NFData a => a -> IO a
evaluateDeep = evaluate . force
