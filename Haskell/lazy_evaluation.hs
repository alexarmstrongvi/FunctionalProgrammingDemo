import qualified Control.Exception
assert = flip Control.Exception.assert (pure ())
--------------------------------------------------------------------------------

accumulate = scanl1 (+)
main = do
    assert $ accumulate [1..5] == [1,3,6,10,15]
    let x = [1..]
    let y = filter even x
    let z = map (*2) y
    let acc = accumulate z

    assert $ take 3 x == [1,2,3]
    assert $ take 3 y == [2,4,6]
    assert $ take 3 z == [4,8,12]
    assert $ take 3 acc == [4,12,24]

    putStrLn "SUCCESS"


