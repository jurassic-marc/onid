
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


