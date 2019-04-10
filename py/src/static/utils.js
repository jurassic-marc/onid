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

setEntry = function() {
  this.eraserSelected = false;
  if (this.mouseEntry) {
    this.keyboardEntry = true;
    this.mouseEntry = false;
  } else {
    this.keyboardEntry = false;
    this.mouseEntry = true;
  }
}

setInputVal = function(val) {
  this.eraserSelected = false;
  this.inputNum = val;
}

setEraser = function() {
  this.eraserSelected = true;
}

getCell = function(element_id) {
  return angular.element(document.getElementById(element_id));
}

getCellVal = function(element_id) {
  return getCell(element_id).prop("value");
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
      var element_id = "\(" + i + "\," + j + "\)"
      valsCountDict[getCellVal(element_id)] += 1;
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

updExhaustedVals = function(exhaustedValsArr, boardSize) {
  for (i = 1; i <= boardSize; i++) {
    var numCell = getCell("val-" + i);
    if (i in exhaustedValsArr || i == exhaustedValsArr) {
      numCell.css("color", "red");
    } else {
      numCell.css("color", "black");
    }
  }
}

displayDiffDialogue = function(element_id) {
  var element = $(document.getElementById(element_id));
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
    var element_id = "\(" + boardObj[i].row + "\," + boardObj[i].col + "\)";
    setCellVal(getCell(element_id), boardObj[i].val);
  }
}

makeCluesImmutable = function(board, boardSize) {
  for (i = 1; i <= boardSize; i++) {
    for (j = 1; j <= boardSize; j++) {
      element_id = "(" + i + "," + j + ")";
      if ("" != getCellVal(element_id)) {
        getCell(element_id).attr("disabled", true);
      }
    }
  }
}

isInputValid = function(element_id, boardSize) {
  var cellVal = getCellVal(element_id);
  return "" == cellVal || cellVal in [...Array(boardSize + 1).keys()].map(i => i + 1) && cellVal != 0;
}

checkInput = function(element_id, boardSize) {
  if (isInputValid(element_id, boardSize)) {
    updCellVal(getCell(element_id), getCellVal(element_id));
  } else {
    eraseValAndCount(element_id);
    alert("Please enter a number between 1 and " + boardSize + ".");
  }
  updExhaustedVals(getExhaustedVals(9), 9);
}

eraseValAndCount = function(element_id) {
  updCellVal(getCell(element_id), "")
}

clickAction = function(element_id) {
  if (this.eraserSelected) {
    eraserActionOnClick(element_id);
  } else if (!isKeyboardEntry(this.keyboardEntry)) {
    mouseActionOnClick(element_id);
  }
}

mouseActionOnClick = function(element_id) {
  if (isOverwriteValDiff(getCellVal(element_id), this.inputNum)) {
    updCellVal(getCell(element_id), this.inputNum);
  }
}

eraserActionOnClick = function(element_id) {
  eraseValAndCount(element_id);
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