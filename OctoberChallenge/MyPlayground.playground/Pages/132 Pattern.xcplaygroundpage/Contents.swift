//: [Previous](@previous)

import Foundation
class Solution {
    func find132pattern(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else {
            return false
        }
        
        var j = nums.count - 1
        
        while j >= 2 {
            
            var min: Int?
            
            for i in 0..<j {
                if nums[i] < nums[j] {
                    if min != nil {
                        if min! > nums[i] {
                            min = nums[i]
                        }
                    } else {
                        min = nums[i]
                    }
                } else if nums[i] > nums[j] {
                    if let _ = min {
                        return true
                    }
                }
            }
            j -= 1
        }
        return false
    }
}

Solution().find132pattern([1,2,3,4])
Solution().find132pattern([3,1,4,2])
Solution().find132pattern([-1,3,2,0])
Solution().find132pattern([0, -10000, 20000, -30000])

//: [Next](@next)
