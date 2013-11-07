==========
Groupmates
==========

A small piece of code to which help deviding people into groups with members they formerly didn't meet, while optimizing the groups to have roughly the same average score.

How to use it
=============

In order to run "Groupmate", you need to set up Haskell environment. The usage is self-explained in ``Demo.hs``. The function ``groupNoScore`` gives all possible group devisions with bright new members, while ``groupScore`` gives a group division with an optimization based on the scores.

Algorithm
=========

"Groupmate" first find out the list of people s/he never met for every particular person. Then it uses Apriori algorithm to find out all the groups with bright new members. After that, it orders the groups by whether their performances are near the average score, and try to find a good combination of groups which includes everybody once.

The optimizated group (based on the average score) it can currently give is not the best one, but it normally is one which is good enough.

Copyright and License
=====================

This piece of code has been written by Cong-Xin Qiu. It is protected by the `"GNU Lesser General Public License"`_. 

.. _"GNU Lesser General Public License": http://www.gnu.org/copyleft/lesser.html
