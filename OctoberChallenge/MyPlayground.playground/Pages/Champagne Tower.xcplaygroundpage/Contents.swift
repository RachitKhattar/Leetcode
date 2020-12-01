//: [Previous](@previous)

import Foundation

class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var dp = Array(repeating: Array(repeating: 0.0, count: 101), count: 101)
        
        dp[0][0] = Double(poured)
        
        for i in 0..<query_row {
            
            for j in 0..<query_row {
                let remain = (dp[i][j] - 1.0) / 2.0
                if remain > 0 {
                    dp[i + 1][j] += remain
                    dp[i + 1][j + 1] += remain
                }
            }
            
        }
        
        
        if dp[query_row][query_glass] > 1.0 {
            return 1.0
        } else {
            return dp[query_row][query_glass]
        }
    }
}

Solution().champagneTower(1, 1, 1)
Solution().champagneTower(2, 1, 1)
Solution().champagneTower(100000009, 33, 17)
Solution().champagneTower(25, 6, 1)
//: [Next](@next)
