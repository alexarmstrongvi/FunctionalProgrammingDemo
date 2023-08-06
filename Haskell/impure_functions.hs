import qualified Control.Exception
import qualified System.Random as Random
import System.IO (writeFile)
-- assert = flip Control.Exception.assert (pure ())
--------------------------------------------------------------------------------

globalVar = 3
pureFunction :: [Int] -> IO [Int]
pureFunction x = 
    let
        -- All random functions must be passed a generator.
        -- This random generator is the same for all function 
        -- calls so identical inputs will still give identical 
        -- outputs.
        random_gen = Random.getStdGen
        rand_int = head . Random.randomRs (0,10) <$> random_gen
        -- Not allowed to overwrite 'x'
        new_x = (x++) . replicate 1 <$> rand_int
        -- Local scope globalVar only
        globalVar = 4
        -- Monadic IO below defines 'actions' that never run
        print0 = putStrLn "Enter your name: "
        name = getLine
        print1 = putStrLn . ("Your name is " ++) <$> name
        write = writeFile "output_file.txt" "Hello\n"
    in
        -- This will return the first 'rand_int' elements of x
        -- but now the function has to have a return type of 
        -- "IO [Int]" instead of "[Int]".
        rand_int >>= (\ n -> return (take n x))
         
main = do
    let arr = [1,2,3,4,5,6,7,8,9,10]
    result <- pureFunction arr
    print globalVar
    print arr
    print result

    putStrLn "SUCCESS"

