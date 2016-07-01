### create an iterator class that initializes with the root node of
### a binary search tree. Write a method called '#next' that will
### 1. on first method call, return the smallest (left-most) node
### 2. on each subsquent calls, return the next smallest node

## This solution is constant space and constant amortized time complexity
## another way to do this would be do do an in order traversal,
## and store the order in an array, then just keep an index as you call
## next. That is O(n) space and O(1) amortized time complexity.

class Iterator
  def initialize(root)
    @root = root
    @current = nil
  end

  def next
    if @current.nil?
      @current = Iterator.find_leftmost(@root)
      return @current
    end

    if @current.right
      @current = Iterator.find_leftmost(@current.right)
    else
      @current = Iterator.find_bigger_parent(@current)
    end
    @current
  end

  private
  def self.find_leftmost(node)
    cur = node
    until cur.left.nil?
      cur = cur.left
    end
    cur
  end

  def self.find_bigger_parent(node)
    cur = node.parent
    unless cur.val > node.val
      cur = cur.parent
    end
    cur
  end
end


class Node
  attr_reader :left, :right, :val, :parent
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
    @parent = nil
  end

  def set_children(left = nil, right = nil)
    @left, @right = left, right
  end

  def set_parent(parent)
    @parent = parent
  end

  def inspect
    @val
  end
end
