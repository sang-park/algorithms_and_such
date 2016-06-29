require_relative("./node")
require_relative("../lib/BST_iterator")

describe "Iterator" do
  ########################
  ## set up BST ##########
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
  #######################
  let (:iterator) {Iterator.new(ten)}

  describe "#initialize" do
    it 'initializes with a root' do
      expect(iterator.root).to eq(ten)
    end
  end

  describe '#next' do
    it 'first next returns smallest node' do
      expect(iterator.next).to eq(three)
    end

    it 'calls next node' do

      iterator.next ## 3
      expect(iterator.next).to eq(five)
      expect(iterator.next).to eq(six)
    end

    it 'looks for parents when no children' do
      iterator.next # 3
      iterator.next # 5
      iterator.next # 6
      iterator.next # 7
      expect(iterator.next).to eq(eight)
    end

    it 'looks on the other side of root' do
      iterator.next # 3
      iterator.next # 5
      iterator.next # 6
      iterator.next # 7
      iterator.next # 8
      iterator.next # 10
      expect(iterator.next).to eq(twenty)
    end

  end
end
