let upstream = https://github.com/dfinity/vessel-package-set/releases/download/mo-0.9.8-20230811/package-set.dhall sha256:162f8cfe5f4df8c65d3ef46b6ee2275235476b94290b92dff2626733676fd2db
let Package =
    { name : Text, version : Text, repo : Text, dependencies : List Text }

let
  -- This is where you can add your own packages to the package-set
  additions =
    [] : List Package

let
  {- This is where you can override existing packages in the package-set

     For example, if you wanted to use version `v2.0.0` of the foo library:
     let overrides = [
         { name = "foo"
         , version = "v2.0.0"
         , repo = "https://github.com/bar/foo"
         , dependencies = [] : List Text
         }
     ]
  -}
  overrides =
    [] : List Package

in  upstream # additions # overrides
