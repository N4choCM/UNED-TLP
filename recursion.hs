{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Redundant bracket" #-}
-- Get the maximum element from a list of elements.
getMax :: (Ord a) => [a] -> a
getMax [] = error "Provided list is empty."
getMax [x] = x
getMax (x : xs)
  | x > maxTail = x
  | otherwise = maxTail
  where
    maxTail = getMax xs

-- Another approach for the same function using `max`.
getMax' :: (Ord a) => [a] -> a
getMax' [] = error "Provided list is empty."
getMax' [x] = x
getMax' (x : xs) = x `max` (getMax' xs)

-- Replicate a given element n times.
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
  | n <= 0 = []
  | otherwise = x : replicate' (n - 1) x

-- Take n elements from the beginning of a list.
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x : xs) = x : take' (n - 1) xs

-- Reverse a list.
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x : xs) = reverse' xs ++ [x]

-- Repeat an element infinitely.
-- Extremely important to call it with a condition like take 5 (repeat' 3).
repeat' :: a -> [a]
repeat' x = x : repeat' x

-- Zip two lists.
zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x : xs) (y : ys) = (x, y) : zip' xs ys

-- Check if an element is present in a list.
findElem :: (Eq a) => a -> [a] -> Bool
findElem a [] = False
findElem a (x : xs)
  | a == x = True
  | otherwise = a `findElem` xs

-- Quicksort
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x : xs) =
  let smallerSorted = quicksort [a | a <- xs, a <= x]
      biggerSorted = quicksort [a | a <- xs, a > x]
  in smallerSorted ++ [x] ++ biggerSorted