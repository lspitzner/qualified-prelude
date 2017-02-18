~~~~
module Main where

#include "qprelude/default.inc"

main :: IO ()
main = do
  System.IO.print $ MapS.singleton True True
  System.IO.print $ DList.fromList [1::Int,2,3]
  Text.IO.putStrLn $ Text.pack "hello, world."
~~~~

# Quick Introduction

Normal custom Preludes are nice, but fall flat in one respect:
It is not possible to provide _qualified_ imports as part of
the Prelude. Want to add `pack`? Well, decide between the one
from `text`, `bytestring`, `storablevector` and whatever else.

One way around that restriction is to use CPP and its `#include`.
The custom Prelude becomes a header/include file.

Advantages of this approach include:

* The Prelude-header can include stuff like
  `import qualified Data.Map as Map` just fine.

* By checking the dependencies using CPP, the Prelude-header
  can expose a subset of the modules of the current
  (the client package's) dependencies. This means that the
  qualified-prelude itself has almost no dependencies.
  You could even get away without the `base` dependency,
  if you really wanted.

* There is no need for typeclasses to prevent nameclashes
  (see e.g. `ClassyPrelude`)

* There is a consistent mapping of shorter names to commonly used
  modules, e.g. `Map` for `Data.Map`.

Disadvantages _in general_ include:

* You need CPP globally (well, whereever you want to include
  the Prelude-header). This comes along with certain negatives,
  most prominently unnecessary recompiles (see [this post from yuras](http://blog.haskell-exists.com/yuras/posts/stop-abusing-cpp-in-haskell.html),
  although not everything applies if you only use CPP for the
  import.)

* The opacity of what exactly is in scope past the one line
  
    ~~~~
    #include "qprelude/default.inc"
    ~~~~
  
    at the top of your module.

* Importing wildly, even when fully qualified, will mean that
  you
    a) effectively need `-fno-warn-unused-imports` and
    b) are at risk of getting unwanted (evil?) instances into
       scope. E.g. see [`base:Text.Show.Functions`](https://hackage.haskell.org/package/base/docs/Text-Show-Functions.html).
       (That particular module is _not_ included even in the
       qualified-everything-qualified header for base.)

* Module deprecation warnings will be hard/impossible to support.
  At least at a first glance.

* If you run wild and create an include file with a 1000
  "import qualified Data.Foo as Foo" lines, and use that
  include file in every module of a 50-module project,
  compilation time suffers. I am not completely certain of
  the exact numbers, but I think you have ~1ms per import,
  so now your project takes 50 seconds to compile.
  
  Before version 0.1, this repo did exactly that (having
  too many imports). At version 0.1, I selected a much
  smaller set of modules (and dependent packages).

This package provides one such CPP Prelude with a subjectively
selected set of modules that I use sufficiently frequently
to warrant putting them in my Prelude.

# Usage

Add qualified-prelude as a dependency; use an `#include` like in the above example. Currently
there are (at least) the following headers:
- qprelude/default.inc (custom Prelude + a few qualified imports from base, text, mtl)
- qprelude/multistate.inc (multistate package qualified imports)
- qprelude/either.inc (either package - EitherT, hoistEither, left, right, bimapEitherT + a few qualified imports)

# Stability

The package is still experimental. Open for discussion. I don't know how to cope with changes in the reexported modules, for example. Or if whole modules get removed.

### Note that this repository had a somewhat different approach before version 0.1. Since version 0.1:
- the package has some explicit dependencies.
- it reexports many modules (but not all, this is open for discussion as well) from its dependencies. This means users don't even need to add dependencies explicitly to their project if the modules are reexported from here. If that is a good thing, API-stability-wise.. not sure.
- the default.inc header contains a rather small set of qualified imports plus a somewhat larger Prelude (collection of unqualified imports/bindings).

# Full list of what is re-exported / in the default.inc header:

[[TODO]]
