# frozen_string_literal: true

require_relative 'lib/linked_list'

# linked_list object

linked_list = LinkedList.new
linked_list.append(1)
linked_list.append(2)
linked_list.append(3)
linked_list.append(4)
linked_list.append(5)
linked_list.prepend(0)
linked_list.insert_at(6, 3)
linked_list.remove_at(3)
linked_list.to_s
