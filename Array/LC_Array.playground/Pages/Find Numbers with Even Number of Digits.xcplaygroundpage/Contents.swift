//: [Previous](@previous)

import Foundation

class Solution {
    func findNumbers(_ nums: [Int]) -> Int {
        
        var evenDigitNumberCount = 0
        
        for num in nums {
            
            var digitCount = 0
            
            var number = num
            
            while number > 0 {
                digitCount += 1
                number = number / 10
            }
            
            if digitCount % 2 == 0 {
                evenDigitNumberCount += 1
            }
            
            // #Approach 2
//            let str = String(num)
//            if str.count % 2 == 0 {
//                evenDigitNumberCount += 1
//            }
        }
        
        return evenDigitNumberCount
    }
}

Solution().findNumbers([12,345,2,6,7896])

//: [Next](@next)
