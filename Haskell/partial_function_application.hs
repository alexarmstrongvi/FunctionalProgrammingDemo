import qualified Control.Exception
assert = flip Control.Exception.assert (pure ())
--------------------------------------------------------------------------------

roundTo :: (Integral b) => Float -> b -> Float
roundTo x n = (fromIntegral . round)(x * 10^n) / 10^n

normalProb :: Float -> Float -> Float -> Float
normalProb mu sig x = n * exp(-(z**2)/2)
    where 
        n = 1 / (sig * sqrt (2*pi))
        z = (x-mu)/sig

-- Standard normal or Z-distribution
zProb = normalProb 0 1

main = do
    assert $ zProb 1 == zProb (-1)
    assert $ roundTo (zProb 2) 2 == 0.05

    putStrLn "SUCCESS"
