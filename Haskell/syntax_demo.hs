-- This won't run

-- Lists: Appending and accessing
myList = [1,2,3]
myPair = (1, 'B')
myTuple = (1, 'B', 3.0, "DEF")

myRange     = [1..10]
myStepRange = [1,3..10]
myInfRange  = [1..]

[5,3,1] !! 1 == 3
head [5,3,1] == 5
take 3 [1,2,3,4,5] == [1,2,3]

[1,2] ++ [3,4] == [1,2,3,4]
"Hello" ++ " World" == "Hello World"

list = [3,4]
0 : list == [0,3,4]
0 : 1 : 2 : list == [0,1,2,3,4]

-- Function calls don't use parentheses
gcd 20 15 == 5
length [1,2,3] == 3
splitAt 2 [2,3,4,0,1] == ([2,3], [4,0,1])

-- Partial function application and 
-- all functions being curried
mod 5 12 == (mod 5)(12)
mod5 = mod 5 
mod5 12 == 7

-- Passing functions as arguments
filter even [1,2,3,4,5] == [2,4]
map (^2) [1,2,3] == [1,4,9]

-- Order of operations and reading right to left
addInQuadrature :: [Float] -> Float
addInQuadrature arr = sqrt . sum $ map (^2) arr

-- Anonymous (a.k.a. lambda) functions
myAnonymousFunc = \x y -> x * (y+2)

-- Pattern matching
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

listMatching :: [Int] -> String
listMatching [] = "0 elements"
listMatching [x] = "1 element"
listMatching [x,y] = "2 elements"
listMatching (x:xs) = "1+ elements"


