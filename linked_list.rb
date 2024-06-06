# frozen_string_literal: true

class LinkedList
  attr_accessor :head, :tail, :size

  def initialize(head = nil, tail = nil, size = 0)
    @head = head
    @tail = tail
    @size = size
  end

  def prepend(value)
    previous_head = @head
    node = Node.new(value, previous_head)
    @head = node
    @tail = node if @tail.nil?
    @size += 1
  end

  def append(value)
    previous_tail = @tail
    node = Node.new(value)
    @tail = node
    @head = node if @head.nil?
    previous_tail.next_node = @tail unless previous_tail.nil?
    @size += 1
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
