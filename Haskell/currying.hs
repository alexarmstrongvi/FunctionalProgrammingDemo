import qualified Control.Exception
assert = flip Control.Exception.assert (pure ())
--------------------------------------------------------------------------------
add :: (Int, Int, Int) -> Int
add (x,y,z) = x + y + z

curriedAdd :: Int -> Int -> Int -> Int
curriedAdd x y z = x + y + z

main = do
    assert $ add (1,2,3) == 6
    assert $ curriedAdd 1 2 3 == 6
    let add1 = curriedAdd 1
    let add1And2 = add1 2
    assert $ add1And2 3 == 6

    putStrLn "SUCCESS"

