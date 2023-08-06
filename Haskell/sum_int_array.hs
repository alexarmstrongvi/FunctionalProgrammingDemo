import qualified Control.Exception
assert = flip Control.Exception.assert (pure ())

sumArray1 :: [Int] -> Int
sumArray1 [] = 0
sumArray1 (x:xs) = x + sumArray1 xs

sumArray2 :: [Int] -> Int
sumArray2 = foldr (+) 0

main = do
    let arr = [1,2,3,4]
    assert $ sumArray1 arr == 10
    assert $ sumArray2 arr == 10

    putStrLn "SUCCESS"
