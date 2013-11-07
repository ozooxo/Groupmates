import Data.Map
import Groupmates

-- Note: at least one score need to be double.
-- The code doesn't work if all of them are integers.
scores = fromList $
	[("Maggie A", 99.0)
	,("Jeff B", 99.0)
	,("Evan B", 99.0)
	,("Sean B", 99.0)
	,("Patrick D", 99.0)
	,("Peter D", 99.0)
	,("Keenen F", 99.0)
	,("Matt H", 99.0)
	,("Austin H", 99.0)
	,("Matt K", 99.0)
	,("Victor O", 99.0)
	,("Claire R", 99.0)
	,("Azira R", 99.0)
	,("Bailey R", 99.0)
	,("Matt S", 99.0)
	,("Danning T", 99.0)
	,("Clayton T", 99.0)]

students = keys scores

group1 =
	[["Peter D", "Sean B", "Claire R", "Maggie A"]
	,["Evan B", "Victor O", "Matt S", "Matt H"]
	,["Matt K", "Ethan L", "Danning T", "Keenen F"]
	,["Bailey R", "Jeff B", "Patrick D"]
	,["Austin H", "Cyayton T", "Azira R"]]

group2 = 
	[["Peter D", "Clayton T", "Patrick D", "Keenen F"]
	,["Evan B", "Sean B", "Azira R"]
	,["Matt K", "Victor O", "Claire R"]
	,["Bailey R", "Matt S", "Maggie A"]
	,["Austin H", "Jeff B", "Danning T", "Matt H"]]

group3 = 
	[["Peter D", "Jeff B", "Matt S"]
	,["Evan B", "Clayton T", "Danning T", "Maggie A"]
	,["Matt K", "Sean B", "Patrick D", "Matt H"]
	,["Bailey R", "Victor O", "Azira R"]
	,["Austin H", "Claire R", "Keenen F"]]

groups = group1++group2++group3

--groupNoScore students groups 4 --It gives you are list of all possible group combinations
--groupScore scores groups 4 --It gives you the best group combination
