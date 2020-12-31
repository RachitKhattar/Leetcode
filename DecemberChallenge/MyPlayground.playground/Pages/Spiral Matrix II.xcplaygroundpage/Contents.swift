import Foundation

var first = "ra******@ad.com"
var second = "ra****@ad.com"

let emailRegEx = "[A-Z0-9a-z._%+-]{2}[*]{6}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
emailTest.evaluate(with: first)
emailTest.evaluate(with: second)






















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
    
    func validMountainArray(_ arr: [Int]) -> Bool {
        if arr.count == 0 || arr.count == 1 || arr.count == 2 {
            return false
        }
        
        if arr[1] <= arr[0] {
            return false
        }
        
        var dir = 0
        
        var lastEl = arr[1]
        
        for i in 2..<arr.count {
            
            if arr[i] == lastEl {
                return false
            }
            
            switch dir {
            case 0:
                if arr[i] > lastEl {
                    lastEl = arr[i]
                } else {
                    lastEl = arr[i]
                    dir = 1
                }
            case 1:
                if arr[i] > lastEl {
                    return false
                } else {
                    lastEl = arr[i]
                }
            default:
                break
            }
        }
        
        return dir == 1
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 || nums.count == 1 || nums.count == 2 {
            return nums.count
        }
        
        var count = 1
        var lastElement = nums[0]
        
        
        var totalCount = nums.count
        var i = 1
        
        while i < totalCount {
            if nums[i] == lastElement {
                if count == 2 {
                    nums.remove(at: i)
                    totalCount -= 1
                } else {
                    count += 1
                    i += 1
                }
            } else {
                count = 1
                lastElement = nums[i]
                i += 1
            }
        }
        
        return nums.count
    }
}

var a = [1,1,1,2,2,3]
Solution().removeDuplicates(&a)
var b = [0,0,1,1,1,1,2,3,3]
Solution().removeDuplicates(&b)

Solution().numPairsDivisibleBy60([30,20,150,100,40])
Solution().numPairsDivisibleBy60([60,60,60])

Solution().spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
Solution().generateMatrix(3)

Solution().validMountainArray([0,3,2,1])
Solution().validMountainArray([3,5,5])
