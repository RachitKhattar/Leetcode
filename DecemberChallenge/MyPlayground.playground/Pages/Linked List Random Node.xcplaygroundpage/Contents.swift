import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    var head: ListNode
    
    /** @param head The linked list's head.
     Note that the head is guaranteed to be not null, so it contains at least one node. */
    init(_ head: ListNode?) {
        self.head = head!
    }
    
    /** Returns a random node's value. */
    func getRandom() -> Int {
        var index = 0
        var returnVal = head.val
        
        var currentNode = head
        
        while currentNode.next != nil {
            index += 1
            let rand = Int.random(in: 0...index)
            currentNode = currentNode.next!
            if rand == index {
                returnVal = currentNode.val
            }
        }
        
        return returnVal
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(head)
 * let ret_1: Int = obj.getRandom()
 */
