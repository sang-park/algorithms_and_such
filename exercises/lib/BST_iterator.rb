### create an iterator class that initializes with the root node of
### a binary search tree. Write a method called '#next' that will
### 1. on first method call, return the smallest (left-most) node
### 2. on each subsquent calls, return the next smallest node
### Each BST node has access to the following: left, right, parent, val

class Iterator
  attr_reader :root
  def initialize(root)
  end
end
