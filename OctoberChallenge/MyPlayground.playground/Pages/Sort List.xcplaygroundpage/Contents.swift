
import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    func printList() {
        var values = [val]
        
        var nextNode = next
        while nextNode != nil {
            values.append(nextNode!.val)
            nextNode = nextNode?.next
        }
        
        print("\(values)")
    }
}

class Solution {
    
//    func merge(listOne: ListNode, listTwo: ListNode) -> ListNode? {
//
//        var head: ListNode?
//
//        var listOnePtr: ListNode? = listOne
//        var listTwoPtr: ListNode? = listTwo
//
//        if listOne.val < listTwo.val {
//            head = listOne
//            listOnePtr = listOnePtr?.next
//        } else {
//            head = listTwo
//            listTwoPtr = listTwoPtr?.next
//        }
//
//        var next = head
//
//        while listOnePtr != nil && listTwoPtr != nil {
//            if listOnePtr == nil {
//
//            }
//        }
//
//    }
//
//    func sortList(_ head: ListNode?) -> ListNode? {
//        if head?.next == nil {
//            return head
//        }
//
//
//    }
}

// [-1,5,3,4,0]

// Expected: [-1,0,3,4,5]

let zero = ListNode(0)
let four = ListNode(4, zero)
let three = ListNode(3, four)
let five = ListNode(5, three)
let minusOne = ListNode(-1, five)

//let a = Solution().sortList(minusOne)
print("\n\n***************")
//a?.printList()


/* My Approach
 
 func sortList(_ head: ListNode?) -> ListNode? {
     guard var next = head?.next else {
         return head
     }
     
     var nextSorted: ListNode? = sortList(next)!
     next = nextSorted!
     
     
     if head!.val <= nextSorted!.val {
         head?.next = nextSorted
         return head
     } else {
         
         while nextSorted?.next != nil, head!.val > nextSorted!.next!.val {
             nextSorted = nextSorted!.next
         }
         
         let temp = nextSorted?.next
         nextSorted?.next = head
         head?.next = temp
         return next
     }
 }
 
 */
