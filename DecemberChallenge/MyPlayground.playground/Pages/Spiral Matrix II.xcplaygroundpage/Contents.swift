import Foundation

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        if n == 1 {
            return [[1]]
        }
        
        var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        var top = 0
        var left = 0
        var bottom = n - 1
        var right = n - 1
        
        var dir = 0
        
        var val = 1
        
        while (top <= bottom) && (left <= right) {
            switch dir {
            case 0:
                // move right
                for col in left...right {
                    matrix[top][col] = val
                    val += 1
                }
                top += 1
            case 1:
                // move down
                for row in top...bottom {
                    matrix[row][right] = val
                    val += 1
                }
                right -= 1
            case 2:
                // move left
                for col in stride(from: right, to: (left - 1), by: -1) {
                    matrix[bottom][col] = val
                    val += 1
                }
                bottom -= 1
            case 3:
                // move up
                for row in stride(from: bottom, to: (top - 1), by: -1) {
                    matrix[row][left] = val
                    val += 1
                }
                left += 1
            default:
                break
            }
            dir = (dir + 1) % 4
        }
        
        return matrix
    }
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var ordered = [Int]()
        
        guard matrix.count > 0, let n = matrix.first?.count, n > 0 else {
            return ordered
        }
        
        let m = matrix.count
        
        var top = 0
        var left = 0
        var bottom = m - 1
        var right = n - 1
        
        var dir = 0
        
        while (top <= bottom) && (left <= right) {
            switch dir {
            case 0:
                // move right
                for col in left...right {
                    ordered.append(matrix[top][col])
                }
                top += 1
            case 1:
                // move down
                for row in top...bottom {
                    ordered.append(matrix[row][right])
                }
                right -= 1
            case 2:
                // move left
                for col in stride(from: right, to: (left - 1), by: -1) {
                    ordered.append(matrix[bottom][col])
                }
                bottom -= 1
            case 3:
                // move up
                for row in stride(from: bottom, to: (top - 1), by: -1) {
                    ordered.append(matrix[row][left])
                }
                left += 1
            default:
                break
            }
            dir = (dir + 1) % 4
        }
        
        return ordered
    }
    
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var modArr = Array(repeating: 0, count: 60)
        
        var pairs = 0
        
        for i in time {
            let modI = i % 60
            
            let difference = (modI == 0) ? 0 : 60 - modI
            
            let countAtDiff = modArr[difference]
            
            pairs += countAtDiff
            
            modArr[modI] = modArr[modI] + 1
        }
        
        return pairs
    }
}

Solution().numPairsDivisibleBy60([30,20,150,100,40])
Solution().numPairsDivisibleBy60([60,60,60])

Solution().spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
Solution().generateMatrix(3)
