var mouseEntry = true;
var keyboardEntry = false;
var eraserSelected = false;
var inputNum = 1;
var cacheValue;
var valuesCountDict = {
  1: 0,
  2: 0,
  3: 0,
  4: 0,
  5: 0,
  6: 0,
  7: 0,
  8: 0,
  9: 0
};

isSolution = function(boardReturned) {
  if ("1" == boardReturned[175]) {
    return true;
  } else {
    return false;
  }
}

isDiffNumOverwrite = function(originalValue, value) {
  if (originalValue != value) {
    return true;
  } else {
    return false;
  }
}

setEntry = function() {
  if (this.mouseEntry) {
    this.keyboardEntry = true;
    this.mouseEntry = false;
  } else {
    this.keyboardEntry = false;
    this.mouseEntry = true;
  }
  this.eraserSelected = false;
}

setInputNumber = function(val) {
  this.eraserSelected = false;
  this.inputNum = val;
}

setEraser = function() {
  this.eraserSelected = true;
}

cacheOriginalValue = function(element_id) {
  var cell = angular.element(document.getElementById(element_id));
  this.cacheValue = cell.prop("value");
}

updCellValue = function(element_id, value) {
  var cell = angular.element(document.getElementById(element_id));
  cell.prop("value", value);
}

updValuesCount = function(value, amount) {
  if (0 <= this.valuesCountDict[value] + amount) {
    this.valuesCountDict[value] += amount;
  };
}

getExhaustedValues = function(boardSize) {
  var exhaustedValueArr = [];
  for (val in valuesCountDict) {
    if (valuesCountDict[val] >= boardSize) {
      exhaustedValueArr.push(val);
    }
  }
  return exhaustedValueArr;
}

updExhaustedValues = function(exhaustedArr, boardSize) {
  for (i = 1; i <= boardSize; i++) {
    var numberCell = angular.element(document.getElementById("val-" + i));
    if (i in exhaustedArr || i == exhaustedArr) {
      numberCell.css("color", "red");
    } else {
      numberCell.css("color", "black");
    }
  }
}

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

objectifyBoard = function(boardCut, boardSize) {
  var b = [];
  for (i = 0; i < boardSize; i++) {
    for (j = 0; j < boardSize; j++) {
      b.push({
        row: i + 1,
        col: j + 1,
        val: (0 == boardCut[i][j]) ? "" : boardCut[i][j]
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

makeCluesImmutable = function(board, boardSize) {
  for (i = 0; i < boardSize; i++) {
    for (j = 0; j < boardSize; j++) {
      element_id = "(" + String(i + 1) + "," + String(j + 1) + ")";
      var cell = angular.element(document.getElementById(element_id));
      if ("" != cell.attr("value")) {
        cell.attr("disabled", true);
      }
    }
  }
}

checkInput = function(element_id, boardSize) {
  var cell = angular.element(document.getElementById(element_id));
  var val = cell.prop("value");
  if ("" == val || val in [...Array(boardSize + 1).keys()].map(i => i + 1) && val != 0) {
    return [true, val];
  } else {
    alert("Please enter a number between 1 and " + String(boardSize) + ".");
    return [false, "0"];
  }
}

keyPressAction = function(element_id, boardSize) {
  if (this.keyboardEntry) {
    var inp = checkInput(element_id, boardSize);
    if (inp[0]) {
      if (isDiffNumOverwrite(this.cacheValue, inp[1])) {
        updValuesCount(this.cacheValue, -1);
        updCellValue(element_id, inp[1]);
        updValuesCount(inp[1], 1);
      }
    }
  }
}

eraseNumber = function(element_id) {
  var cell = angular.element(document.getElementById(element_id));
  cell.prop("value", "");
}

clickAction = function(element_id) {
  if (this.mouseEntry) {
    mouseActionOnClick(element_id);
  } else if (this.keyboardEntry) {
    keyboardActionOnClick(element_id, 9);
  }
  if (this.eraserSelected) {
    eraserActionOnClick(element_id);
  }
  updExhaustedValues(getExhaustedValues(9), 9);
}

mouseActionOnClick = function(element_id) {
  var cell = angular.element(document.getElementById(element_id));
  var val = cell.prop("value");
  if (isDiffNumOverwrite(val, this.inputNum)) {
    updValuesCount(val, -1);
    updCellValue(element_id, this.inputNum);
    updValuesCount(this.inputNum, 1);
  }
}

keyboardActionOnClick = function(element_id, boardSize) {
  cacheOriginalValue(element_id);
  keyPressAction(element_id, boardSize);
}

eraserActionOnClick = function(element_id) {
  var cell = angular.element(document.getElementById(element_id));
  var val = cell.prop("value")
  updValuesCount(val, -1);
  eraseNumber(element_id);
}

//https://github.com/niklasvh/html2canvas/issues/1443
screenshotBoard = function() {
  var element = $("#board");
  html2canvas(element, {
    onrendered: function(canvas) {
      window.open().document.write('<img src="' + canvas.toDataURL() + '"/>');
    }
  });
}