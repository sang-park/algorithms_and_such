var Heap = require('./heap');

function heapsort (arr) {
  var len = arr.length;
  for (var i = 2; i <= len; i++) {
    Heap.heapifyUp(arr, i -1, i);
  }
  for (i = len; i > 1; i--) {
    var temp = arr[0];
    arr[0] = arr[i-1];
    arr[i-1] = temp;
    Heap.heapifyDown(arr, 0, i-1);
  }

  return arr.reverse();
}

// var a = [63,3,4,5,8,1,2,10,32];
// console.log(heapsort(a));
