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
      @head = new_node
    else
      node = @head
      node = node.next_node while node.next_node
      node.next_node = new_node
    end
    @size += 1
  end

  def at(index)
    index += size if index.negative?
    return nil if index >= @size || @size.zero?

    current = @head
    index.times { current = current.next_node }
    current.value
  end

  def pop
    node = @head
    (size - 2).times { node = node.next_node }
    popped_node = node.next_node
    node.next_node = nil
    @size -= 1
    popped_node
  end

  def contains?(value)
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    index = 0
    size.times do
      return index if current_node.value == value

      current_node = current_node.next_node
      index += 1
    end
    nil
  end

  def insert_at(value, index)
    index += size + 1 if index.negative?
    return unless index <= @size && index >= 0

    if index.zero?
      prepend(value)
    elsif index == @size
      append(value)
    else
      node = Node.new(value)
      current_node = @head
      (index - 1).times { current_node = current_node.next_node }
      node.next_node = current_node.next_node
      current_node.next_node = node
    end

    @size += 1
  end

  def remove_at(index)
    index += size if index.negative?
    return if index >= @size || @size.zero?

    if index.zero?
      @head = @head.next_node
    else
      current_node = @head
      (index - 1).times { current_node = current_node.next_node }
      current_node.next_node = current_node.next_node.next_node
    end
    @size -= 1
  end

  def to_s
    current = @head
    until current.nil?
      print "( #{current.value} ) -> "
      current = current.next_node
    end
    puts 'nil'
  end

  def head
    @head.value
  end

  def tail
    current = @head
    current = current.next_node until current.next_node.nil?
    current.value
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
list.prepend(0)
list.append(4)
list.append(50)
list.to_s
p list.at(3)
