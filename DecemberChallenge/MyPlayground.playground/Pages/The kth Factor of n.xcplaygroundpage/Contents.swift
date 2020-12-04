import Foundation

class Solution {
    func kthFactor(_ n: Int, _ k: Int) -> Int {
        if n == 0 {
            return -1
        }
        
        if k == 1 {
            return 1
        }
        
        var factors = [1]
        
        for i in 2...n {
            if n % i == 0 {
                factors.append(i)
            }
            
            if factors.count == k {
                return factors.last!
            }
        }
        
        return -1
    }
}


Solution().kthFactor(12, 3)
Solution().kthFactor(7, 2)
Solution().kthFactor(4, 4)
Solution().kthFactor(1, 1)
Solution().kthFactor(1000, 3)
