import qualified Control.Exception
assert = flip Control.Exception.assert (pure ())

--------------------------------------------------------------------------------
increment :: Int -> Int
increment = (+1)

createDecrement :: Int -> Int -> Int
createDecrement x y = y - x

applyTwice :: (Int -> Int) -> Int -> Int
applyTwice f = f . f

main = do
    let decrement = createDecrement 1
    let x = 5
    assert $ applyTwice increment x == 7
    assert $ applyTwice decrement x == 3
    assert $ applyTwice (2*)      x == 20
    
    putStrLn "SUCCESS"


