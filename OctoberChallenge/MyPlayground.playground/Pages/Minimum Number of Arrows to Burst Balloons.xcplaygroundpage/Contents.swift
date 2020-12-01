//: [Previous](@previous)

import Foundation

class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        
        if points.count == 0 {
            return 0
        }
        
        let finalSorted = points.sorted { (first, second) -> Bool in
            return first.last! < second.last!
        }
        
        var end = finalSorted[0][1]
        
        var res = 1
        
        for point in finalSorted {
            
            if point[0]...point[1] ~= end {
                continue
            } else {
                res += 1
                end = point[1]
            }
        }
        
        return res
    }
}

//Solution().findMinArrowShots([[10,16],[2,8],[1,6],[7,12]])

Solution().findMinArrowShots([[3,9],[7,12],[3,8],[6,8],[9,10],[2,9],[0,9],[3,9],[0,6],[2,8]])

//: [Next](@next)
