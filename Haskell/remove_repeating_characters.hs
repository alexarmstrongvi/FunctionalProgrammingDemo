import qualified Control.Exception
assert = flip Control.Exception.assert (pure ())

--------------------------------------------------------------------------------

removeRepeats :: String -> String
removeRepeats "" = ""
removeRepeats [x] = [x]
removeRepeats (x0:x1:xs) = 
    if x0 == x1
    then removeRepeats (x0:xs)
    else x0 : removeRepeats (x1:xs)


main = do
    assert $ removeRepeats "" == ""
    assert $ removeRepeats "a" == "a"
    assert $ removeRepeats "abbcccda" == "abcda"

    putStrLn "SUCCESS"
    
 
