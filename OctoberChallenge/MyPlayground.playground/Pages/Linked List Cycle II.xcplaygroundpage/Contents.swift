//: [Previous](@previous)

import Foundation

//* Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slowPointer = head
        var fastPointr = head
        
        var foundLoop = false
        
        while slowPointer != nil && fastPointr != nil && fastPointr?.next != nil {
            slowPointer = slowPointer?.next
            fastPointr = fastPointr?.next?.next
            if (slowPointer?.val == fastPointr?.val) && (slowPointer?.next?.val == fastPointr?.next?.val)  {
                foundLoop = true
                break
            }
        }
        
        if foundLoop {
            slowPointer = head
            
            while (slowPointer?.val != fastPointr!.val) || (slowPointer?.next?.val != fastPointr?.next?.val) { 
                slowPointer = slowPointer?.next
                fastPointr = fastPointr?.next
            }
            
            return slowPointer
        }
        
        return nil
    }
}

[3,2,0,-4]

var pointMinFour = ListNode(-4)
var zero = ListNode(0)
zero.next = pointMinFour
var two = ListNode(2)
two.next = zero
pointMinFour.next = two
var three = ListNode(3)
three.next = two

Solution().detectCycle(three)?.val

//: [Next](@next)
