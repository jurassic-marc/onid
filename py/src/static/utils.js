
var mouseEntry = true;
var inputNum = 1;
var eraserSelected = false;

//https://stackoverflow.com/questions/8495687/split-array-into-chunks?page=1&tab=votes#tab-top
cutBoard = function(boardList, boardSize) {
  var b = [];
  for (i = 0, j = boardList.length; i < j; i += boardSize) {
    b.push(boardList.slice(i, i + boardSize))
  }
  return b;
}

extractBoard = function() {
  b = [];
  c = document.querySelector('#board').querySelectorAll('input');
  for (i = 0; i < c.length; i++) {
    v = c[i].value;
    if (v == "") {
      b.push("0");
    } else {
      b.push(v);
    };
  }
  return b;
}

parseBoard = function(boardReturned) {
  b = [];
  for (i = 179; i < boardReturned.length - 22; i += 2) {
    b.push(boardReturned[i]);
  }
  return b;
}

isSolution = function(boardReturned) {
  if ("1" == boardReturned[175]) {
    return true;
  } else {
    return false;
  }
}

objectifyBoard = function(boardCut, boardSize) {
  var b = [];
  for (i = 0; i < boardSize; i++) {
    for (j = 0; j < boardSize; j++) {
      b.push({
        row: i + 1,
        col: j + 1,
        val: (0==boardCut[i][j]) ? "" : boardCut[i][j]
      });
    }
  }
  return b;
}

overwriteBoard = function(boardObj) {
  for (i = 0; i < boardObj.length; i++) {
    var cell = angular.element(document.getElementById("\(" + String(boardObj[i].row) +
      "\," + String(boardObj[i].col) +
      "\)"));
    cell.attr("value", boardObj[i].val);
  }
}

//https://github.com/niklasvh/html2canvas/issues/1443
screenshotBoard = function() {
  var element = $("#board");
  html2canvas(element, {
    onrendered: function(canvas) {
      window.open().document.write('<img src="'+canvas.toDataURL()+'"/>'); 
    }
  });
}

checkInput = function(element_id, boardSize) {
  if("" != String(document.getElementById(element_id).value)){
    val = parseInt(String(document.getElementById(element_id).value));
    if (val in [...Array(boardSize+1).keys()].map(i => i+1) && val!=0) {
      document.getElementById(element_id).value = val;
    } else {
      document.getElementById(element_id).value = "";
      alert("Please enter a number between 1 and " + String(boardSize) + ".");
      }
  }
}

clickAction = function(element_id) {
  if (this.eraserSelected == true) {
    return eraseNumber(element_id);
  } else {
    this.eraserSelected = false;
  }
  if (this.mouseEntry == true) {
    return inputNumber(element_id);
  }
}

setEntry = function() {
  if (this.mouseEntry == true) {
    this.mouseEntry = false;
  } else this.mouseEntry = true;
}

setInputNumber = function(val) {
  this.inputNum = val;
}

inputNumber = function(element_id) {
  var cell = angular.element(document.getElementById(element_id));
  cell.prop("value", this.inputNum);
}

setEarser = function() {
  this.eraserSelected = true;
}

eraseNumber = function(element_id) {
  var cell = angular.element(document.getElementById(element_id));
  cell.prop("value", "");
}
