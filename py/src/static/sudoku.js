//https://stackoverflow.com/questions/950087/how-do-i-include-a-javascript-file-in-another-javascript-file
$.getScript("../static/utils.js");

var app = angular.module('sudoku', ['ngSanitize']);
app.controller('sudokuCtrl', function($scope, $http) {
  $scope.solveBoard = function() {
    if (!isBoardComplete(9)) {
      board = cutBoard(extractBoard(), 9).map(i => {
        return "(".concat(i, ")");
      });
      $http.get("/solve/" + "(" + board + ")")
        .then(function(response) {
            var board = parseBoard(response.data);
            if (isSolution(response.data)) {
              overwriteBoard(objectifyBoard(cutBoard(board, 9), 9));
              alert("Solution found.");
              screenshotBoard();
            } else {
              alert("Solution not found.");
            }
          },
          function onError(response) {
            alert("Sorry, there was a problem with your request.");
          }
        );
    } else {
        screenshotBoard();
      }
  }

  $scope.fetchPuzzle = function(diff) {
    $http.get("/puzzle/" + String(diff))
      .then(function(response) {
          var board = cutBoard(response.data, 9);
          overwriteBoard(objectifyBoard(board, 9));
          makeCluesImmutable(board, 9);
        },
        function onError(response) {
          alert("Sorry, there was a problem with your request.");
        }
      );
  }
}); //controller end
