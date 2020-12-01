//: [Previous](@previous)

import Foundation

var arr = [1]
arr.startIndex
arr.index(after: arr.startIndex)

arr.endIndex

var str = "Hello, playground"

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 1 {
            if target == nums[0] {
                return 0
            } else {
                return -1
            }
        }  else {
            let mid = nums.count / 2
            
            if target < nums[mid] {
                                
                let index = search(Array(nums[0...(mid - 1)]), target)
                
                if index == -1 && target != -1 {
                    return -1
                } else {
                    return index
                }
                
            } else if target > nums[mid] {
                
                if mid + 1 > (nums.count - 1) {
                    return -1
                }
                
                let index = search(Array(nums[(mid + 1)...(nums.count - 1)]), target)
                
                if index == -1 && target != -1 {
                    return -1
                } else {
                    return (mid + 1) + index
                }
                
            } else {
                return mid
            }
        }
    }
}

Solution().search([-1,0,3,5,9,12], 9)
Solution().search([-1,0,3,5,9,12], 2)
Solution().search([-1,0,3,5,9,12], 13)


Solution().search([-1,0,3,5,9,12], 3)

Solution().search([1, 2, 3, 4, 5], 2)
//
Solution().search([-1,0,5], -1)

//: [Next](@next)
