//: [Previous](@previous)

import Foundation

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        
        guard matrix.count != 0 else {
            return false
        }
        
        guard let rowLength = matrix.first?.count, rowLength != 0 else {
            return false
        }
        
        for row in matrix {
            if row[0] == target {
                return true
            } else if row[0] < target {
                if row[rowLength - 1] >= target {
                    for col in row {
                        if col == target {
                            return true
                        }
                    }
                }
            } else {
                break
            }
        }
        
        return false
    }
}

Solution().searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,50]], 3)

//: [Next](@next)
