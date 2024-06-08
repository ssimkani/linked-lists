# frozen_string_literal: true

class LinkedList
  attr_accessor :size, :list

  def initialize
    @list = []
    @head = @list[0]
    @tail = @list[-1]
    @size = 0
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
    return nil if index >= @size || @size.zero?

    list[index].value
  end

  def to_s
    arr = ['nil']
    list.reverse_each { |node| arr.prepend("( #{node.value} )") }
    arr.join(' -> ')
  end

  def pop
    previous_tail = @tail
    @tail = previous_tail.next_node
    @list.delete(previous_tail)
    @size -= 1
    previous_tail.value
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

  def insert_at(value, index)
    return unless index <= @size

    node = Node.new(value, list[index + 1])
    list.insert(index, node)
    list[index - 1].next_node = list[index]
    @size += 1
  end

  def remove_at(index)
    return if index >= @size || @size.zero?

    list.delete_at(index)
    list[index - 1].next_node = list[index]
    @size -= 1
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)
list.append(4)
list.append(5)
list.prepend(6)
list.insert_at(78, 6)
list.remove_at(5)
list.remove_at(0)
puts list
