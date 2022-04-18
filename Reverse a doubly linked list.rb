#!/bin/ruby

require 'json'
require 'stringio'

class DoublyLinkedListNode
    attr_accessor :data, :next, :prev

    def initialize node_data
        @data = node_data
        @next = nil
        @prev = nil
    end
end

class DoublyLinkedList
    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def insert_node node_data
        node = DoublyLinkedListNode.new node_data

        if not self.head
            self.head = node
        else
            self.tail.next = node
            node.prev = self.tail
        end

        self.tail = node
    end
end

def print_doubly_linked_list node, sep, fptr
    while node != nil
        fptr.write node.data

        node = node.next

        fptr.write sep if node != nil
    end
end

#
# Complete the 'reverse' function below.
#
# The function is expected to return an INTEGER_DOUBLY_LINKED_LIST.
# The function accepts INTEGER_DOUBLY_LINKED_LIST llist as parameter.
#

#
# For your reference:
#
# DoublyLinkedListNode
#     int data
#     DoublyLinkedListNode next
#     DoublyLinkedListNode prev
#
#

def reverse(listt) 
    # Write your code here
    
    curr = nil 
    while listt 
        
        nxt = listt.next
        curr = listt
        listt.next = listt.prev
        listt.prev = nxt
        listt = nxt
    end
    return curr
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

t = gets.to_i

t.times do |t_itr|
    llist = DoublyLinkedList.new

    gets.to_i.times do
        llist_item = gets.to_i
        llist.insert_node llist_item
    end

    llist1 = reverse llist.head

    print_doubly_linked_list llist1, " ", fptr
    fptr.write "\n"
end

fptr.close()
