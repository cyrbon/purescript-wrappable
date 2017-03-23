-- | Type classes to enable convenient wrapping and unwrapping.
-- |
-- | Unlike `purescript-newtype` it provides separation between things that can
-- | be `wrap`ed and those that can be only `unwrap`ed. This provides extra
-- | safety in contexts where you want to hide the `newtype` constructor and
-- | only expose constuctor functions that validate data before wrapping it
-- | with a newtype.

-- | In those scenarios, you want to be sure that data inside your newtype
-- | is always valid and that only your custom constructors will be used to
-- | create it, prohibiting invalid values from sneaking in.

-- | If you only have a singular function that constructs your newtype then you
-- | can still provide a sensible `wrap` for `Newtype` by giving it your
-- | custom constructor that validates data before wrapping it. In that case,
-- | this package will not provide any extra value.

-- | But if you have severa alternative constructor functions that all generate
-- | the same newtype, then you can't supply a meaningful `wrap` function.

-- | This allows you to enjoy the convenience of the `unwrap` without having to
-- | to specify `wrap` and vice versa.
module Data.Wrappable where

import Data.Newtype (class Newtype)
import Data.Newtype as Newtype

-- | A type class for things that can be wrapped
class Wrappable t a | t -> a where
  wrap :: a -> t

-- | A type class for things that can be unwrapped
class Unwrappable t a | t -> a where
  unwrap :: t -> a
