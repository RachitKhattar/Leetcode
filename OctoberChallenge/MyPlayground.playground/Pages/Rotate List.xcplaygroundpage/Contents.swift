//: [Previous](@previous)

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        if k < 0 {
            return head
        }
        
        guard let next = head?.next else {
            return head
        }
        
        if var later = next.next {
            
            var secondLast = next
            
            var listLength = 3
            
            while later.next != nil {
                secondLast = later
                later = later.next!
                
                listLength += 1
            }
            
            print(listLength)
            
            let finalCount = k % listLength
            
            print(finalCount)
            
            if finalCount > 0 {
                later.next = head
                secondLast.next = nil
                
                return rotateRight(later, k - 1)
            } else {
                return head
            }
            
        } else {
            
            let finalCount = k % 2
            
            if finalCount > 0 {
                head?.next = nil
                next.next = head
                
                return next
            }
            
            return head
        }
    }
}

let three = ListNode(3)
let two = ListNode(2, three)
let one = ListNode(1, two)

Solution().rotateRight(one, 10)?.val

//: [Next](@next)
