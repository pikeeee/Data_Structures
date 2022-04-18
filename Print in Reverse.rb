#!/bin/ruby

require 'json'
require 'stringio'

class SinglyLinkedListNode
    attr_accessor :data, :next

    def initialize node_data
        @data = node_data
        @next = nil
    end
end

class SinglyLinkedList
    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def insert_node node_data
        node = SinglyLinkedListNode.new node_data

        if not self.head
            self.head = node
        else
            self.tail.next = node
        end

        self.tail = node
    end
end

def print_singly_linked_list node, sep
    while node != nil
        print node.data

        node = node.next

        print sep if node != nil
    end
end

#
# Complete the 'reversePrint' function below.
#
# The function accepts INTEGER_SINGLY_LINKED_LIST llist as parameter.
#

#
# For your reference:
#
# SinglyLinkedListNode
#     int data
#     SinglyLinkedListNode next
#
#
def reversePrint(llist) 
    # Write your code here
    
    curr = llist
    prev = nil
    nxt = nil
    while curr 
        nxt = curr.next
        curr.next = prev
        prev = curr
        curr = nxt
    end
    while prev 
        p(prev.data)
        prev = prev.next
    end
end

tests = gets.to_i