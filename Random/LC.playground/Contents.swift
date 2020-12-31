import UIKit

class Solution {
    // https://leetcode.com/problems/shuffle-the-array/
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        var finalArray = [Int]()
        var indexLeft = 0
        var indexRight = n
        
        while indexLeft < n {
            finalArray.append(nums[indexLeft])
            finalArray.append(nums[indexRight])
            indexLeft += 1
            indexRight += 1
        }
        
        return finalArray
    }
    
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        let totalWealthArray = accounts.map{ $0.reduce(0) { $0 + $1 } }
        return totalWealthArray.max()!
    }
}

Solution().maximumWealth([[1,5],[7,3],[3,5]])
