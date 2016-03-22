~~~~
module Main where

#include "qprelude/bundle-gamma.inc"
 
main :: IO ()
main = do
  print $ Map.singleton True True
  print $ DList.fromList [1::Int,2,3]
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

Disadvantages include:

* You need CPP globally (well, whereever you want to include
  the Prelude-header). This comes along with certain negatives,
  most prominently unnecessary recompiles (see [this post from yuras](http://blog.haskell-exists.com/yuras/posts/stop-abusing-cpp-in-haskell.html),
  although not everything applies if you only use CPP for the
  import.)

* The opacity of what exactly is in scope past the one line
  
    ~~~~
    #include "qprelude/bundle-alpha.inc"
    ~~~~
  
    at the top of your module.

* Importing wildly, even when fully qualified, will mean that
  you
    a) effectively need `-fno-warn-unused-imports` and
    b) are at risk of getting unwanted (evil?) instances into
       scope. E.g. see [`base:Text.Show.Functions`](https://hackage.haskell.org/package/base/docs/Text-Show-Functions.html).

* Module deprecation warnings will be hard/impossible to support.
  At least at a first glance.

This package provides this kind of CPP Prelude, or rather:
A set of headers from which you can mix and match.

# Usage

Use an `#include` like in the above example. Put your
dependencies in your `foo.cabal` file. (Almost) all modules
from packages supported by qualified-prelude will be
available at least with full qualification. See the full list
below.

Alternatives include:

* `qprelude/fully/all.inc`: all imports are fully
  qualified.
* `qprelude/bundle-alpha.inc`: only some types and very few
  functions are imported unqualified; a certain set of
  modules has shorter names (like `Map`).
* `qprelude/bundle-gamma.inc`: A somewhat larger default
  Prelude (arbitrary selection).

Again, full details below.

# Stability

At this stage, highly experimental. Open for discussion.

Because this package avoids listing dependencies, it cannot define version
bounds either. This is a problem: if qualified-prelude expects a package
`foo` to contain a specific set of packages, but `foo` was since
updated and one of its modules removed, there will be an error.

I am not sure how to resolve this. At least, the hole process of listing
the modules for packages needs to be automated in order to reduce the
maintenance necessary for this package to a reasonable amount.

Until this issue is resolved, the potential of arbitrary breakage due to new
releases of other packages makes this package currently unfit for hackage, in
my opinion.

(Releasing versions of qualified-prelude that work with specific stackage
snapshots might be possible, on the other hand.)

# Implementation

Put long lists of

~~~~
#ifdef MIN_VERSION_whatever
import qualified Whatever.Some.Module
import qualified Whatever.Other.Module
import qualified Some.Deeply.Nested as Shortcut
import Some.Deeply.Nested ( these, i, want, unqualified )
#endif
~~~~

into files; make them includable.

# Headers

While fully qualifying modules is mostly free of risk (apart
from evil instances), providing shorter identifiers (`M` for
`Data.Map`) is risky because there may be name clashes. The
user might want to use `M` for .. well i dunno, but you get
the idea. Even more so for unqualified imports.

For this reason, this packages defines several different
headers.

[[TODO]]

# Full list of indexed packages:

[[TODO]]
