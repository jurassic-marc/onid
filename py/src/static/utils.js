var mouseEntry = true;
var keyboardEntry = false;
var eraserSelected = false;
var inputNum = 1;

isKeyboardEntry = function(enable) {
  $(document)[0].onkeydown = function() {
    return enable;
  }
  return enable;
}

isBoardComplete = function(boardSize) {
  for (i = 0; i < boardSize; i++) {
    for (j = 0; j < boardSize; j++) {
      var elementId = "\(" + i + "\," + j + "\)";
      if (getCellVal(elementId) == 0) {
        return false;
      }
    }
  }
  return true;
}

getDiffChoosen = function() {
  diffElements = document.getElementsByName("puzzle_difficulty");
  for (i = 0; i < diffElements.length; i++) {
    if (diffElements[i].checked) {
      return i + 1;
    }
  }
}

isSolution = function(boardReturned) {
  return "1" == boardReturned[175]
}

isOverwriteValDiff = function(originalVal, overwriteVal) {
  return originalVal != overwriteVal;
}

setEntry = function(boardSize) {
  this.eraserSelected = false;
  if (this.mouseEntry) {
    this.keyboardEntry = true;
    this.mouseEntry = false;
  } else {
    this.keyboardEntry = false;
    this.mouseEntry = true;
  }
  drawInputMode();
}

setInputVal = function(elementId, boardSize, val) {
  this.eraserSelected = false;
  this.inputNum = val;
  drawSelectedVals(9);
}

setEraser = function() {
  this.eraserSelected = true;
  drawEraser();
}

getCell = function(elementId) {
  return angular.element(document.getElementById(elementId));
}

getCellVal = function(elementId) {
  return getCell(elementId).prop("value");
}

setCellVal = function(cell, val) {
  cell.attr("value", val);
}

updCellVal = function(cell, val) {
  cell.prop("value", val);
}

getValsCount = function(boardSize) {
  var valsCountDict = {
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

  for (i = 0; i < boardSize; i++) {
    for (j = 0; j < boardSize; j++) {
      var elementId = "\(" + i + "\," + j + "\)"
      valsCountDict[getCellVal(elementId)] += 1;
    }
  }
  return valsCountDict;
}

getExhaustedVals = function(boardSize) {
  var valsCountDict = getValsCount(boardSize);
  exhaustedValArr = [];
  for (val in valsCountDict) {
    if (valsCountDict[val] >= boardSize) {
      exhaustedValArr.push(val);
    }
  }
  return exhaustedValArr;
}

drawExhaustedVals = function(exhaustedValsArr, boardSize) {
  for (i = 1; i <= boardSize; i++) {
    var numCell = getCell("val-" + i);
    if (-1 != exhaustedValsArr.indexOf(String(i))) {
      numCell.prop("class", "exhausted");
    } else if (this.inputNum != i) {
      numCell.prop("class", "unselected");
    }
  }
}

drawInputMode = function() {
  if (this.mouseEntry) {
    getCell("mouse/keyboard").prop("src", "../static/img/mouse.svg");
  } else {
    getCell("mouse/keyboard").prop("src", "../static/img/keyboard.svg");
  }
  getCell("mouse/keyboard").prop("class", "selected");
  getCell("pencil").prop("class", "unselected");
  getCell("eraser").prop("class", "unselected");
}

drawEraser = function() {
  if (this.eraserSelected) {
    getCell("eraser").prop("class", "selected");
    getCell("pencil").prop("class", "unselected");
    getCell("mouse/keyboard").prop("class", "unselected");
  } else {
    getCell("eraser").prop("class", "unselected");
  }
}

drawSelectedVals = function(boardSize) {
  var elementId = "val-" + this.inputNum;
  if (getCell(elementId).prop("class") != "exhausted") {
    getCell(elementId).prop("class", "selected");
  };
  for (i = 1; i <= boardSize; i++) {
    numCellId = "val-" + i;
    if (numCellId != elementId && getCell(numCellId).prop("class") != "exhausted") {
      getCell(numCellId).prop("class", "unselected");
    }
  }
}

displayDiffDialogue = function(elementId) {
  var element = $(document.getElementById(elementId));
  element.prop({
    hidden: false
  });
  element.dialog();
}

goToPage = function(uri_ext, base_uri = "http://localhost:5000/") {
  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: base_uri + uri_ext,
      success: function() {
        location.href = base_uri + uri_ext;
      },
      error: function() {
        alert("Sorry, there is a problem changing to " + base_uri + uri_ext + ".");
      }
    });
  });
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
  cells = document.querySelector('#board').querySelectorAll('input');
  for (i = 0; i < cells.length; i++) {
    cellVal = cells[i].value;
    if (cellVal == "") {
      b.push("0");
    } else {
      b.push(cellVal);
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
    var elementId = "\(" + boardObj[i].row + "\," + boardObj[i].col + "\)";
    setCellVal(getCell(elementId), boardObj[i].val);
  }
}

makeCluesImmutable = function(board, boardSize) {
  for (i = 1; i <= boardSize; i++) {
    for (j = 1; j <= boardSize; j++) {
      elementId = "(" + i + "," + j + ")";
      if ("" != getCellVal(elementId)) {
        getCell(elementId).attr("disabled", true);
      }
    }
  }
}

isInputValid = function(elementId, boardSize) {
  var cellVal = getCellVal(elementId);
  return "" == cellVal || cellVal in [...Array(boardSize + 1).keys()].map(i => i + 1) && cellVal != 0;
}

checkInput = function(elementId, boardSize) {
  if (isInputValid(elementId, boardSize)) {
    updCellVal(getCell(elementId), getCellVal(elementId));
  } else {
    eraseValAndCount(elementId);
    alert("Please enter a number between 1 and " + boardSize + ".");
  }
  drawExhaustedVals(getExhaustedVals(boardSize), boardSize);
}

eraseValAndCount = function(elementId) {
  updCellVal(getCell(elementId), "")
}

clickAction = function(elementId) {
  if (this.eraserSelected) {
    eraserActionOnClick(elementId);
  } else if (!isKeyboardEntry(this.keyboardEntry)) {
    mouseActionOnClick(elementId);
  }
}

mouseActionOnClick = function(elementId) {
  if (isOverwriteValDiff(getCellVal(elementId), this.inputNum)) {
    updCellVal(getCell(elementId), this.inputNum);
  }
}

eraserActionOnClick = function(elementId) {
  eraseValAndCount(elementId);
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
