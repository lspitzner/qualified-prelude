module Test001A where

#include "qprelude/default.inc"

main :: IO ()
main = do
  System.IO.print $ MapS.singleton True True
  System.IO.print $ DList.fromList [1::Int,2,3]
  Text.IO.putStrLn $ Text.pack "hello, world."
