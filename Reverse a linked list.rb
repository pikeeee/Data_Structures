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

def print_singly_linked_list node, sep, fptr
    while node != nil
        fptr.write node.data

        node = node.next

        fptr.write sep if node != nil
    end
end

#
# Complete the 'reverse' function below.
#
# The function is expected to return an INTEGER_SINGLY_LINKED_LIST.
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


def reverse(llist) 
    # Write your code here
    nxt = nil
    while llist 
        llist.next, nxt, llist = nxt, llist, llist.next        
    end
    return nxt
end


fptr = File.open(ENV['OUTPUT_PATH'], 'w')