module Test001B where

#include "qprelude/bundle-gamma.inc"

main :: IO ()
main = do
  print $ Map.singleton True True
  print $ DList.fromList [1::Int,2,3]
  Text.IO.putStrLn $ Text.pack "hello, world."
