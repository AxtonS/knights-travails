# knights-travails  
Function to determine the shortest path a knight can move to any given space on the chess board.  

## to-do  
-Create a script that makes a chess board and a knight  
-Treat all possible moves for the knight as children in a tree  
-Implement a search algorithm to find and display the shortest path between the knight and a given space  

## progress  
-Created a board class and a knight class, the knight class creates an instance of the board class during it's own initialize  
-The board is created using a array of 8 nested arrays  
-The knight uses coordinates 0-7, 0-7 to interact with the board  
-Added an available moves method to the knight class that returns an array of possible moves from current position  
-Added an index method to the knight class that will return the array coordinates of the given position  
-Refactored the available moves method to store an array of knight instances for each position  
-Added a parent variable to the knight class so that the lineage can be traced as program builds out move paths  
-Finished method that builds the data structure for the tree that holds each subsequent move as a knight object linked to its previous move and returns the knight object occupying target space  
-Moved valid_move? method to knight class  
-Removed inconsequential Board class, and moved the coordinates array into board variable within Knight class  
