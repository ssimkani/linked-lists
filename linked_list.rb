# frozen_string_literal: true

class LinkedList
  attr_accessor :size

  def initialize
    @head = nil
    @size = 0
  end

  def prepend(value)
    @head = Node.new(value, @head)
    @size += 1
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = node
    else
      node = @head
      node = node.next_node while node.next_node
      node.next_node = new_node
    end
    @size += 1
  end

  def at(index)
    return nil if index >= @size || @size.zero?

    current = @head
    index.times { current = current.next_node }
    current
  end

  def pop
    node = @head
    (size - 2).times { node = node.next_node }
    node.value = nil
    @size -= 1
    node.next_node
  end

  def contains?(value)
    current_node = @head
    until current_node.nil?
    end
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
list.to_s
