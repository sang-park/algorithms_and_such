// class quick sort, not in place
// O(n) space O(nlogn) average time

var quickSort = function(arr) {
  if (arr.length === 0){
    return arr;
  }

  var pivotIdx = Math.floor(Math.random() * arr.length),
      temp = arr[0],
      pivot = arr[pivotIdx],
      left = [], right = [], middle = [];

  arr[0] = pivot;
  arr[pivotIdx] = temp;

  arr.forEach(function(el) {
    if (el === pivot) {
      middle.push(el);
    } else if (el > pivot) {
      right.push(el);
    } else {
      left.push(el);
    }
  });

  return quickSort(left).concat(middle).concat(quickSort(right));
};

// console.log(quickSort(a));

//uses O(logn) space for recursion
var qsInPlace = function(arr, start, len) {
  if (len < 2) return arr;

  start = start || 0;
  len = len || arr.length;

  var pivotIdx = partition(arr, start, len),
      leftLen = pivotIdx - start,
      rightLen = len - leftLen - 1;

  qsInPlace(arr,start,leftLen);
  qsInPlace(arr,pivotIdx+1, rightLen);
};

var partition = function(arr, start, length) {
  var pivotVal = arr[start],
      pivotIdx = start;

  for (var i = pivotIdx + 1; i < start+length; i++) {
    if (arr[i] < pivotVal) {
      pivotIdx++;
      var temp = arr[i];
      arr[i] = arr[pivotIdx];
      arr[pivotIdx] = temp;
    }
  }

  temp = arr[start];
  arr[start] = arr[pivotIdx];
  arr[pivotIdx] = temp;
  console.log(arr);
  console.log(pivotIdx);
  return pivotIdx;
};

var a = [6,5,2,4,9,2,4,7,7,10,3,5];
qsInPlace(a);
console.log(a);
