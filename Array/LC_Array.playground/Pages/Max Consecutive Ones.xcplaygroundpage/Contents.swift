//: [Previous](@previous)

import Foundation

class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        
        var max = 0
        
        var length = 0
        
        for (i, num) in nums.enumerated() {
            if num == 1 {
                length += 1
                if i == nums.count - 1 {
                    if length > max {
                        max = length
                    }
                }
                
            } else {
                if length > max {
                    max = length
                }
                length = 0
            }
        }
        
        return max
    }
    
    func sortedSquares(_ A: [Int]) -> [Int] {
        
        if A.count == 1 {
            return [A.first! * A.first!]
        }
        
        if A.first! < 0 {
            var squareArr = [Int]()
            
            var left = 0
            var right = A.count - 1
            
            while left <= right {
                if abs(A[right]) > abs(A[left]) {
                    squareArr.insert(A[right] * A[right], at: 0)
                    right -= 1
                } else {
                    squareArr.insert(A[left] * A[left], at: 0)
                    left += 1
                }
            }
            
            return squareArr
        } else {
            return A.map{ $0 * $0 }
        }
    }
    
    func duplicateZeros(_ arr: inout [Int]) {
        guard arr.count > 1 else {
            return
        }
        
        var index = 0
        
        while index < (arr.count - 1) {
            if arr[index] == 0 {
                arr.insert(0, at: index + 1)
                arr.removeLast()
                index += 2
            } else {
                index += 1
            }
        }
    }
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        for i in 0..<n {
            var indexAt = -1
            for (index, greaterNum) in nums1.enumerated() {
                if greaterNum >= nums2[i] {
                    indexAt = index
                    break
                }
            }
            if indexAt == -1 {
                nums1.insert(nums2[i], at: m + i)
                nums1.removeLast()
            } else {
                nums1.insert(nums2[i], at: indexAt)
                nums1.removeLast()
            }
        }
        
        print(nums1)
    }
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var length = nums.count
        
        if length == 0 {
            return 0
        } else if length == 1 {
            if nums[0] == val {
                return 0
            } else {
                return 1
            }
        }
        
        var i = 0
        while i < length {
            if i == length - 1 {
                if val == nums[i] {
                    length -= 1
                } else {
                    i += 1
                }
            } else {
                if val == nums[i] {
                    for j in (i+1)..<length {
                        nums[j - 1] = nums[j]
                    }
                    length -= 1
                } else {
                    i += 1
                }
            }
        }
        
        return length
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var length = nums.count
        
        if length == 0 || length == 1 {
            return length
        }
        
        var i = 0
        var numChain = nums[0] - 1
        
        var toRemove = 0
        
        while i < length {
            if nums[i] == numChain {
                toRemove += 1
                if i == (length - 1) {
                    length -= toRemove
                    toRemove = 0
                }
                i += 1
                
            } else {
                if toRemove > 0 {
                    
                    var j = i - toRemove
                    
                    while j < length - toRemove {
                        nums[j] = nums[j + toRemove]
                        j += 1
                    }
                    i -= toRemove
                    length -= toRemove
                    toRemove = 0
                    
                } else {
                    numChain = nums[i]
                    i += 1
                }
            }
        }
        
        return length
    }
    
    
    // for N and M , where N = 2 * M
    func checkIfExist(_ arr: [Int]) -> Bool {
        
        var map = [Int: Int]()
        
        
        for i in arr {
            if i % 2 == 0 {
                if let _ = map[i / 2] {
                    return true
                }
            }
            if let _ = map[i * 2] {
                return true
            }
            
            map[i] = 1
        }
        
        return false
    }
    
    enum Direction {
        case up
        case down
    }
    
    func validMountainArray(_ A: [Int]) -> Bool {
        
        guard A.count >= 3, A[0] < A[1] else {
            return false
        }
        
        var direction = Direction.up
        var last = A[1]
        
        for i in 2..<A.count {
            if A[i] < last {
                if direction == .down {
                    last = A[i]
                } else {
                    last = A[i]
                    direction = .down
                }
            } else if A[i] > last {
                if direction == .up {
                    last = A[i]
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        
        return direction == .down
    }
    
    func replaceElements(_ arr: [Int]) -> [Int] {
        
        var maxRight: Int? = nil
        
        for j in stride(from: arr.count - 1, to: -1, by: -1) {
            if let maxRight = maxRight {
                if maxRight < arr[j] {
                    let temp = maxRight
                    
                }
            }
        }
        
        return arr
    }
}

Solution().replaceElements([17,18,5,4,6,1])

//Solution().validMountainArray([2,1])
//Solution().validMountainArray([3,5,5])
//Solution().validMountainArray([0,3,2,1])
//Solution().validMountainArray([0,1,2,3,4,5,6,7,8,9])
Solution().validMountainArray([3,7,20,14,15,14,10,8,2,1])

//Solution().checkIfExist([10,2,5,3])
//Solution().checkIfExist([7,1,14,11])
//Solution().checkIfExist([3,1,7,11])

//Solution().findMaxConsecutiveOnes([1,1,0,1,1,1])
//
//
//Solution().sortedSquares([-1, 1])
//Solution().sortedSquares([-4,-1,0,3,10])
//Solution().sortedSquares([-7,-3,2,3,11])
//Solution().sortedSquares([-1])
//
//
//var arr1 = [1,0,2,3,0,4,5,0]
//Solution().duplicateZeros(&arr1)
//
//var arr2 = [1,2,3]
//Solution().duplicateZeros(&arr2)
//
//var nums1 = [1,2,3,0,0,0]
//Solution().merge(&nums1, 3, [2,5,6], 3)
//
//
//var toDel = [3,2,2,3]
//Solution().removeElement(&toDel, 3)
//var toDel2 = [0,1,2,2,3,0,4,2]
//Solution().removeElement(&toDel2, 2)

var dup = [1, 1, 1]
Solution().removeDuplicates(&dup)
//var dup1 = [0,0,1,1,1,2,2,3,3,4]
//Solution().removeDuplicates(&dup1)

//: [Next](@next)
