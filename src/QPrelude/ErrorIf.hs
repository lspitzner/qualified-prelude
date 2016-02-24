module QPrelude.ErrorIf
  ( errorIf
  , errorIfNote
  )
where



errorIf :: Bool -> a -> a
errorIf False = id
errorIf True  = error "errorIf"

errorIfNote :: Maybe String -> a -> a
errorIfNote Nothing  = id
errorIfNote (Just x) = error x
