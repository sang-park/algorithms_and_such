var Heap = function (){
  this.store = [];
};

Heap.childIndices = function(len, parentIndex) {
  var final = [];

  [2 * parentIndex + 1, 2 * parentIndex + 2].forEach(function(idx){
    if (idx < len) {final.push(idx);}
  });

  return final;
};

Heap.parentIndex = function(childIndex) {
  if (childIndex < 1) {throw "root has no parents";}
  return Math.floor((childIndex - 1) / 2);
};

Heap.heapifyDown = function(arr, parentIndex, len){
  len = len || arr.length;

  var childIndices = Heap.childIndices(len, parentIndex),
      leftChild = childIndices[0],
      rightChild = childIndices[1],
      parentVal = arr[parentIndex];

  var children = [];
  childIndices.forEach(function(child){
    children.push(arr[child]);
  });

  if (children.every(function(child){return parentVal < child;})){
    return arr;
  }

  var swapIdx;
  if (children.length === 1){
    swapIdx = leftChild;
  } else {
    if (children[0] < children[1]) {
      swapIdx = leftChild;
    } else {
      swapIdx = rightChild;
    }
  }

  arr[parentIndex] = arr[swapIdx];
  arr[swapIdx] = parentVal;
  Heap.heapifyDown(arr,swapIdx, len);
};

Heap.heapifyUp = function(arr, childIdx, len){
  len = len || arr.length;

  if (childIdx === 0) {return arr;}

  var parentIndex =Heap.parentIndex(childIdx),
      childVal = arr[childIdx],
      parentVal = arr[parentIndex];

  if (childVal > parentVal) {
    return arr;
  } else {
    arr[childIdx] = parentVal;
    arr[parentIndex] = childVal;
    Heap.heapifyUp(arr, parentIndex, len);
  }
};

Heap.prototype = {
  count: function() {
    return this.store.length;
  },

  extract: function(){
    if (this.count() === 0) {throw "no elements to extract";}
    var val = this.store[0];

    if (this.count() > 1) {
      this.store[0] = this.store.pop();
      Heap.heapifyDown(this.store, 0);
    } else {
      this.store.pop();
    }
    return val;
  },

  push: function(val) {
    this.store.push(val);
    Heap.heapifyUp(this.store,this.count() - 1);
  }
};

module.exports = Heap;
