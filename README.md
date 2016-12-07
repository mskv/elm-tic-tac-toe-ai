# 5x5 Tic tac toe in Elm with simple minimax AI

Visit [Github Pages](https://mskv.github.io/elm-tic-tac-toe-ai/) to play.

A simple school project, decided to use Elm for practice. It could use some refactoring.

It could also use alpha beta pruning, currently it's only possible to foresee 3 moves ahead in acceptable time which makes it easy to trick the AI. Even one move more would be a huge improvement.

The messy board scoring heuristic takes all the columns, rows and diagonals that have a potential of winning (have at least 4 fields that are empty or marked with our own sign) and sums the already existing marks in them. It does the opposite for opponent's marks.

When moves have the same score, the last one is picked. That's why when a game is considered to be lost, the moves don't make sense anymore.
