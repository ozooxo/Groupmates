module ListOperations where

import Data.List

mean xs = realToFrac (sum xs) / genericLength xs

sublist :: Eq a => [a] -> [a] -> Bool
sublist [] _ = True
sublist _ [] = False
sublist (x:xs) (y:ys)
	| x == y = sublist xs ys
	| otherwise = sublist (x:xs) ys

deleteAll :: Eq a => [a] -> [a] -> [a]
deleteAll [] ys = ys
deleteAll (x:xs) ys = deleteAll xs (delete x ys)

mergeUnique :: Ord a => [a] -> [a] -> [a]
mergeUnique xs [] = xs
mergeUnique [] xs = xs
mergeUnique (x:xs) (y:ys)
	| x < y = x : mergeUnique xs (y:ys)
	| x == y = x : mergeUnique xs ys
	| otherwise = y : mergeUnique (x:xs) ys

sortNested :: Ord a => [[a]] -> [[a]]
sortNested lsts = map (\x -> sort x) lsts
