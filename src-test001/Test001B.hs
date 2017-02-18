module Test001B where

#include "qprelude/default.inc"
#include "qprelude/either.inc"
#include "qprelude/multistate.inc"



main :: IO ()
main = do
  print $ MapS.singleton True True
  print $ DList.fromList [1::Int,2,3]
  Text.IO.putStrLn $ Text.pack "hello, world."
