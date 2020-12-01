//: [Previous](@previous)

import Foundation

class Solution {
    func winnerSquareGame(_ n: Int) -> Bool {
        
        var dp = Array(repeating: false, count: n + 1)
        
        for i in 0..<n {
            if dp[i] {
                continue
            }
             
            var k = 1
            while i + k * k  <= n {
                dp[i+k*k] = true
                k += 1
            }
        }
        return dp[n]
    }
}

//Solution().winnerSquareGame(1)
//Solution().winnerSquareGame(2)
//Solution().winnerSquareGame(4)
Solution().winnerSquareGame(7)
//Solution().winnerSquareGame(17)
