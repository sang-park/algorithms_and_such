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
