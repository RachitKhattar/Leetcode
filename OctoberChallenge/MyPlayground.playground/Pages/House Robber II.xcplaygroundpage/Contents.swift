//: [Previous](@previous)

import Foundation

class Solution {
    func rob(_ nums: [Int]) -> Int {
        if (nums.count == 1) {
            return nums[0]
        }
        
        return max(rob(nums: nums, start: 0, end: nums.count - 2), rob(nums: nums, start: 1, end: nums.count - 1))
    }
    
    private func rob(nums: [Int], start: Int, end: Int) -> Int {
        var a = 0
        var b = 0
        
        for i in start...end {
            let temp = b
            if nums[i] + a > b {
                b = nums[i] + a
            }
            a = temp
        }
        return b
    }
}

Solution().rob([2,3,2])
Solution().rob([1,2,3,1])
Solution().rob([0])
Solution().rob([1,3,1,3,100])

//: [Next](@next)
