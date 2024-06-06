# frozen_string_literal: true

class LinkedList
  attr_accessor :head

  def initialize(head, tail)
    @head = head
    @tail = tail
  end

  def prepend(value)
    current_head = @head
    node = Node.new(value, current_head)
    @head = node
  end


end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
