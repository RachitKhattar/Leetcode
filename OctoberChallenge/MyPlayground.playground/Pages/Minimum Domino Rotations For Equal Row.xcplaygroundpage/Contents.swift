//: [Previous](@previous)

import Foundation

class Solution {
    func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
                
        var valToMake = A[0]
        var movesWithAFirst = 0
        for i in 0..<A.count {
            if A[i] != valToMake && B[i] != valToMake {
                movesWithAFirst = -1
                break
            }
            if A[i] == valToMake {
                continue
            } else if B[i] == valToMake {
                movesWithAFirst += 1
            }
        }
        
        valToMake = B[0]
        var movesWithBFirst = 0
        for i in 0..<A.count {
            if A[i] != valToMake && B[i] != valToMake {
                movesWithBFirst = -1
                break
            }
            if A[i] == valToMake {
                continue
            } else if B[i] == valToMake {
                movesWithBFirst += 1
            }
        }
        
        valToMake = B[0]
        var movesWithBFirstB = 0
        for i in 0..<B.count {
            if A[i] != valToMake && B[i] != valToMake {
                movesWithBFirstB = -1
                break
            }
            if B[i] == valToMake {
                continue
            } else if A[i] == valToMake {
                movesWithBFirstB += 1
            }
        }
        
        valToMake = A[0]
        var movesWithAFirstB = 0
        for i in 0..<B.count {
            if A[i] != valToMake && B[i] != valToMake {
                movesWithAFirstB = -1
                break
            }
            if B[i] == valToMake {
                continue
            } else if A[i] == valToMake {
                movesWithAFirstB += 1
            }
        }
        
        
        let a = [movesWithAFirst, movesWithBFirst, movesWithBFirstB, movesWithAFirstB].filter{ $0 >= 0 }
        if a.count > 0 {
            return a.min() ?? -1
        }
        
        return -1
    }
}

Solution().minDominoRotations([2,1,2,4,2,2], [5,2,6,2,3,2])
Solution().minDominoRotations([3,5,1,2,3], [3,6,3,3,4])
//: [Next](@next)
