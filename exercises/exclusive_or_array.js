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
