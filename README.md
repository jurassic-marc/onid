# Ulster University, Jordanstown BSc Computing Science final year project.

=== PROPOSAL ====================================================== 28/09/2018 =

DRAFT PROJECT PROPOSAL DOCUMENT

Student: Marc Templeton	
ID: B00687477	
Mentor:	Simon Fraser

Project Title: Sudoku solver using a breadth-first backtracking algorithm

Project Description:

Sudoku is a number combinational puzzle with extensive interest in the mathematical community and globally; with yearly World Sudoku Championships[1].

Sudoku’s unique and partly given solutions means solving them is difficult.
	Therefore, creating an algorithm to do so is challenging, however, using a basic brute force search will uncover the unique solution but in an inefficient manner for both: time and hardware & software resources.
Therefore, a more efficient algorithm is desired.

The primary target audience for this product are Sudoku players with the application also appealing to other puzzle enthusiasts as well as mathematicians in the number combinational field.

The application will consist of 2 parts:
    a. The front-end user interface
    b. The back-end program engine

Front-end:

The JavaScript webpage will enable the user to select a Sudoku board to be solved along with options such as puzzle difficulty. The on-screen Sudoku board will show the algorithm solving it.

Back-end:

The solving engine will be written in a combination of Python and q and utilise the KX plug-in: pyq to run code from one language to the other.

----- Additional features I could potentially implement (ordered) --------------
    • user created Sudoku ability
    • use Sudoku API to read-in online boards (https://github.com/codegoalie/sudoku-api)
    • solve 4x4 and 16x16 boards
    • saving user attempt progress
    • recording user times
    • user profile
    • multi-users
    • optimisation:
        ◦ selective search
    • other algorithm implementations:
        ◦ general algorithm
        ◦ neural networks and machine learning
    • read-in pictured Sudoku puzzles

Project Aim:

The product will be able to solve a standard 9x9 Sudoku puzzle in a more efficient way than by brute-force.

Copyright / IPR / Commercial Sensitivity:

The project does not raise issues relating to copyright, intellectual property rights or commercial sensitivity.

Hardware and Software Resources to be used within the project:

Hardware:
    • I do not believe that the standard program (solving 9x9 boards) will be CPU or RAM intensive, however if the application is extended to solve 16x16 boards and upwards, then it may become so
Software:
    • Python
    • kdb+

    • pyq
    • JavaScript


References (Use Harvard Style):

[1]: World Puzzle Federation (2018). World Sudoku Championships. World Puzzle Federation. Available from: http://www.worldpuzzle.org/championships/wsc/ [Accessed 21 Sep 2018].
