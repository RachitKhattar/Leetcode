//: [Previous](@previous)

import Foundation

let a = "0"
let b = "0adsad"

a.first == "0"
b.first == "0"

let abv = [1, 2, 3, 4]
print(abv.endIndex)
for i in 0..<abv.endIndex {
    print(abv[i])
}


class Solution {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        
        var differenceMatrix = Array(repeating: Array(repeating: 0, count: prices.count), count: prices.count)
        
        var sortedMaxItems = Array(repeating: 0, count: k)
        var min = sortedMaxItems.last
        
        var rangeAndVal = [(Range<Int>, Int)]()
        
        for buyIndex in 0..<(prices.count - 1) {
            var maxForSell = 0
            var maxForSellRange: Range<Int>? = nil
            for sellIndex in (buyIndex + 1)..<prices.count {
                differenceMatrix[buyIndex][sellIndex] = prices[sellIndex] - prices[buyIndex]
                if prices[sellIndex] - prices[buyIndex] > maxForSell {
                    maxForSell = prices[sellIndex] - prices[buyIndex]
                    maxForSellRange = Range(NSRange(location: buyIndex, length: sellIndex - buyIndex))
                }
            }
            if maxForSellRange != nil {
                rangeAndVal.append((maxForSellRange!, maxForSell))
            }
        }
        print(rangeAndVal)
        
        rangeAndVal.sort { (rangeOne, rangeTwo) -> Bool in
            return rangeOne.0.startIndex < rangeTwo.0.startIndex && rangeOne.0.endIndex < rangeTwo.0.endIndex
        }
        
        print(rangeAndVal)
        
        
        
        for r in rangeAndVal {
            let overlappingRanges = rangeAndVal.filter{ r.0.overlaps($0.0) && r.0 != $0.0 }
            
            var checkAgain = false
            
            while checkAgain {
                
            }
        }
        
        for i in 0..<prices.count {
            print(differenceMatrix[i])
        }
        
        
        return 0
    }
}

//Solution().maxProfit(2, [2,4,1])
Solution().maxProfit(2, [3,2,6,5,0,3])

//: [Next](@next)
