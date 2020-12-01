/*:
# Remove Covered Intervals

* Given a list of intervals, remove all intervals that are covered by another interval in the list.

* Interval [a,b) is covered by interval [c,d) if and only if c <= a and b <= d.

* After doing so, return the number of remaining intervals.
 */

import Foundation


let range = NSRange(location: 0, length: 8)
let rangeTwo = NSRange(location: 1, length: 5)

range.intersection(rangeTwo)


class Solution {
    
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        
        let sortedIntervals = intervals.sorted { (firstInterval, secondInterval) -> Bool in
            
            if firstInterval.first! < secondInterval.first! {
                return true
            } else if firstInterval.first! == secondInterval.first! {
                return firstInterval.last! > secondInterval.last!
            } else {
                return false
            }
        }
        
        var indecesCovered = [Int]()
                
        var end = 0
        
        for i in 0..<(sortedIntervals.count) {
            
            if sortedIntervals[i].last! <= end {
                indecesCovered.append(i)
            } else {
                end = sortedIntervals[i].last!
            }
        }
                
        return sortedIntervals.count - indecesCovered.count
    }
    
}

Solution().removeCoveredIntervals([[1,4],[3,6],[2,8]])
Solution().removeCoveredIntervals([[1,4],[2,3]])
Solution().removeCoveredIntervals([[0,10],[5,12]])
Solution().removeCoveredIntervals([[3,10],[4,10],[5,11]])
Solution().removeCoveredIntervals([[1,2],[1,4],[3,4]])

Solution().removeCoveredIntervals([[66672,75156],[59890,65654],[92950,95965],[9103,31953],[54869,69855],[33272,92693],[52631,65356],[43332,89722],[4218,57729],[20993,92876]])
