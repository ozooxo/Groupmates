module Apriori (apriori) where

import Data.List
import ListOperations

countInfixOf :: Eq a => [a] -> [[a]] -> Int
countInfixOf lst [] = 0
countInfixOf lst (x:xs)
	| sublist lst x = 1 + (countInfixOf lst xs)
	| otherwise = (countInfixOf lst xs)

apriori :: Ord a => [[a]] -> Int -> Int -> [[a]]
apriori lsts 1 freq = [[x] | x <- (sort . nub . concat) lsts, countInfixOf [x] lsts >= freq]
apriori lsts n freq = [(head x):y | x <- commonLess, y <- commonLess, (tail x) == (init y), countInfixOf ((head x):y) lsts >= freq]
	where commonLess = apriori lsts (n-1) freq
