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

// var a = [1,5,2,4,7,2,4,7,9,10,3,5];
// console.log(quickSort(a));
