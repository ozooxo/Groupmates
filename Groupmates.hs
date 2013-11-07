module Groupmates where -- (groupNoScore, groupScore) where

import Data.List
import Data.Map
import Apriori
import ListOperations

scoreAvg :: (Ord a, Fractional b, Real b) => Map a b -> [a] -> b
scoreAvg scores group = mean [scores ! x | x <- group]

scoreDiff :: (Ord a, Fractional b, Real b) => Map a b -> [a] -> b
scoreDiff scores group = abs (scoreAvg scores group - avg)
	where avg = scoreAvg scores (keys scores)

oldMember :: Ord a => a -> [[a]] -> [a]
oldMember _ [] = []
oldMember x (y:ys)
	| elem x y = mergeUnique y (oldMember x ys)
	| otherwise = (oldMember x ys)

neverMeetBefore :: Ord a => [a] -> [[a]] -> Bool
neverMeetBefore gp [] = True
neverMeetBefore gp (x:xs)
	| length (intersect gp x) >= 2 = False
	| otherwise = neverMeetBefore gp xs

neverList :: Ord a => [a] -> [[a]] -> [[a]]
neverList students groups = [sort(x:(deleteAll (oldMember x sortedGroups) students)) | x <- students]
	where sortedGroups = sortNested groups

possibleGroups :: Ord a => [a] -> [[a]] -> Int -> [[a]]
possibleGroups students groups n = [x | x <- (groupn ++ groupnpp), neverMeetBefore x groups]
	where neverLists = (neverList students groups)
	      groupn = apriori neverLists n n
	      groupnpp = apriori neverLists (n-1) (n-1)

groupFit :: Ord a => [a] -> [[a]] -> [[[a]]]
groupFit _ [] = []
groupFit students (gp:gps)
	| students == gp = [[gp]]
	| sublist gp students = [(gp:x) | x <- (groupFit (deleteAll gp students) gps)] ++ (groupFit students gps)
	| otherwise = groupFit students gps

groupNoScore :: Ord a => [a] -> [[a]] -> Int -> [[[a]]]
groupNoScore students groups n = groupFit students (possibleGroups students groups n)

-----------------------------------

groupScore :: Map String Double -> [[String]] -> Int -> [[String]]
groupScore scores groups n = head (groupFit students sortedGroups)
	where sortGT :: [String] -> [String] -> Ordering
	      sortGT gp1 gp2
		| (scoreDiff scores gp1) < (scoreDiff scores gp2) = LT
		| otherwise = GT
	      students = (keys scores)
	      sortedGroups = sortBy sortGT (possibleGroups students groups n)

--ANOTHER ALGORITHM, WHICH SEEMS TOO SLOW
--groupScore scores groups n = groupScore' [] sortedGroups
--	where groupScore' :: [[String]] -> [[String]] -> [[String]]
--	      groupScore' passedGps remainGps
--		| fitLess /= [] = (head remainGps):(head fitLess)
--		| otherwise = groupScore' ((head remainGps):passedGps) (tail remainGps)
--		where fitLess = groupFit (deleteAll (head remainGps) students) passedGps
--	      students = (keys scores)
--	      sortedGroups = sortBy sortGT (possibleGroups students groups n)
