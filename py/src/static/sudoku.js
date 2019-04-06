
//https://stackoverflow.com/questions/950087/how-do-i-include-a-javascript-file-in-another-javascript-file
$.getScript("../static/utils.js");

var app = angular.module('sudoku', ['ngSanitize']);

app.controller('sudokuCtrl', function($scope, $http) {
  $scope.solveBoard = function() {
    board = cutBoard(extractBoard(), 9).map(i => {
      return "(".concat(i, ")");
    });
    $http.get("/solve/" + "(" + board + ")")
      .then(function(response) {
          var board = response.data;
          console.log(board); 
      },
      function onError(response) {
        alert("Sorry, there was a problem with your request.");
      }
   );
  }
});//controller end
