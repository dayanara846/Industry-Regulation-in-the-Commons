# Industry-Regulation-in-the-Commons
For my ECON 7710 (Microeconomic Theory 2) I co-authored a short paper that tackled The Tragedy of the Commons game, from the firm's point of view, with a new approach.

In this game, there is an external regulator (government) that opens up an online portal that lets all firms interested in extracting from a natural resource ("the Commons") to submit a form to request a permit. The firms must pay $0.5 to submit their forms. All firms are instructed to submit their forms simultaneously and without cooperation. If they are interested in this, they can request a permit to extract 1 or 2 units from the Commons; if not, then we can interpret this as them extracting 0 units and not filing the form. The Commons consist of K units. Yet, there is a caveat. If the sum of the amounts that all firms request to extract is equal or more than K, then the government eliminates half of all firms and only grants the permit to the remaining ones. 

This is the setup:
K = number of firms in the industry + 1
Set of Strategies: {0,1,2}

Assumptions: All firms are homogeneous and have the same probability of getting eliminated.


To see the theoretical outcome of this game for different industry sizes, I wrote a code ("Game_output.R") that estimates the payoffs, best responses and equilibriums of each firm. The results of this code are in the file "Game-Output.pdf".

To see the empirical outcome of this game for different industry sizes, my research team and I will do an experiment with 10-15 students at our university. Each of the students will be tasked with the role of a firm in this game, were all of them will be asked to provide their responses simulatenously and without cooperation. 
