// given two arrays, write a function that returns
// elements that are in one of the arrays, but not both
// i.e.
// fn([1,2,3] [2,3,4]) => [2,3]


// O(n^2) time  O(1) space
var exclusiveOrArrays = function (arr1, arr2) {
  var final = [];

  arr1.forEach(function(el){
    if (arr2.indexOf(el) === -1 && final.indexOf(el) === -1){
      final.push(el);
    }
  });

  arr2.forEach(function(el){
    if (arr1.indexOf(el) === -1 && final.indexOf(el) === -1){
      final.push(el);
    }
  });
  return final;
};


// O(nlogn) time O(1) space
var exclusiveOrArraysSorted = function (arr1, arr2) {
  var sortedArr1 = arr1.slice(0).sort(),
      sortedArr2 = arr2.slice(0).sort(),
      exclusives = [];

  while (sortedArr1.length > 0 && sortedArr2.length > 0) {
    if (sortedArr1[0] > sortedArr2[0]) {
      exclusives.push(sortedArr2.shift());
    } else if (sortedArr1[0] < sortedArr2[0]) {
      exclusives.push(sortedArr1.shift());
    } else {
      var temp = sortedArr1[0];
      while (sortedArr1[0] === temp) {sortedArr1.shift();} // remove duplicates
      while (sortedArr2[0] === temp) {sortedArr2.shift();}
    }
  }
  return exclusives.concat(sortedArr1).concat(sortedArr2);
};

// O(n) space O(n) time
var exclusiveOrArraysLinearTime = function (arr1, arr2) {
  var keys = {};

  arr1.forEach(function(el){
    keys[el] = 1;
  });

  arr2.forEach(function(el){
    var k = String(el);
    if (keys[k] === 1) {
      keys[k] = 0;
    } else {
      keys[k] = 1;
    }
  });

  var final = [];
  Object.keys(keys).forEach(function(el){
    if (keys[el] === 1) {
      final.push(parseInt(el));
    }
  });
  return final;
};
