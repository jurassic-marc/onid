
//https://stackoverflow.com/questions/950087/how-do-i-include-a-javascript-file-in-another-javascript-file
$.getScript("../static/utils.js");

var app = angular.module('sudoku', ['ngSanitize']);
test=[];
app.controller('sudokuCtrl', function($scope, $http) {
  $scope.solveBoard = function() {
    board = cutBoard(extractBoard(), 9).map(i => {
      return "(".concat(i, ")");
    });
    $http.get("/solve/" + "(" + board + ")")
      .then(function(response) {
          var board = parseBoard(response.data);
          if (isSolution(response.data)) {
            overwriteBoard(objectifyBoard(cutBoard(board, 9),9));
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
  }

  $scope.fetchPuzzle = function() {
    diff = document.getElementById("puzzle_difficulty").value;
    console.log(diff);
    $http.get("/puzzle/" + String(diff))
      .then(function(response) {
          var board = response.data;
          overwriteBoard(objectifyBoard(cutBoard(board, 9),9));
        },
        function onError(response) {
          alert("problem with your request.");
        }
      );
}

});//controller end
