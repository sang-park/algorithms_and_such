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

ten = Node.new(10)
five = Node.new(5)
three = Node.new(3)
eight = Node.new(8)
six = Node.new(6)
seven = Node.new(7)
twenty = Node.new(20)

ten.set_children(five, twenty)
five.set_children(three,eight)
eight.set_children(six, nil)
six.set_children(nil, seven)
five.set_parent(ten)
twenty.set_parent(ten)
three.set_parent(five)
eight.set_parent(five)
six.set_parent(eight)
seven.set_parent(six)

a = Iterator.new(ten)
p a.next
p a.next
p a.next
p a.next
p a.next
p a.next
p a.next
