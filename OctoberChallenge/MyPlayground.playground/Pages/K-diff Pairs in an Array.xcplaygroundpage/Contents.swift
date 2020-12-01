//: [Previous](@previous)

import Foundation

class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var pairCount = 0
                        
        let dict = Dictionary(grouping: nums, by: { $0 })
        
        let allKeys = Array<Int>(dict.keys)
        
        for i in 0..<allKeys.count {
            if i < (allKeys.count - 1) {
                for j in (i + 1)..<allKeys.count {
                    if (allKeys[i] - allKeys[j] == k) || (allKeys[j] - allKeys[i] == k) {
                        pairCount += 1
                    }
                }
            }
            if (k == 0) && (dict[allKeys[i]]?.count ?? 0) > 1 {
                pairCount += 1
            }
        }
        return pairCount
    }
}

Solution().findPairs([1, 1, 1], 0)
Solution().findPairs([1,1,1,2,2], 0)

//Solution().findPairs([3,1,4,1,5], 2)
//Solution().findPairs([1,2,3,4,5], 1)
//Solution().findPairs([1,3,1,5,4], 0)
//Solution().findPairs([1,2,4,4,3,3,0,9,2,3], 3)
//Solution().findPairs([-1,-2,-3], 1)

