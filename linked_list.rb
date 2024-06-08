# frozen_string_literal: true

class LinkedList
  attr_accessor :head, :tail, :size, :list

  def initialize(head = nil, tail = nil, size = 0)
    @head = head
    @tail = tail
    @size = size
    @list = []
  end

  def prepend(value)
    previous_head = @head
    node = Node.new(value, previous_head)
    @head = node
    @tail = node if @tail.nil?
    @list.prepend(node)
    @size += 1
  end

  def append(value)
    previous_tail = @tail
    node = Node.new(value)
    @tail = node
    @head = node if @head.nil?
    previous_tail.next_node = @tail unless previous_tail.nil?
    @list.append(node)
    @size += 1
  end

  def at(index)
    nil if index >= @size || index.negative? || @size.zero?
    node = Node.new(list[index], list[index + 1])
    node.value
  end

  def to_s
    list.each { |node| print "( #{node.value} ) -> " }
    print 'nil'
  end

  def pop
    previous_tail = @tail
    @tail = previous_tail.next_node
    @list.delete(previous_tail)
    @size -= 1
    previous_tail
  end

  def contains?(value)
    included = list.select do |node|
      node == value
    end
    !included.empty?
  end

  def find(value)
    element = list.select { |node| node.value == value }.first
    list.index(element)
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
