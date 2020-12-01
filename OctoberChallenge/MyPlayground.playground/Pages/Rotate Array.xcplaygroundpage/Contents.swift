//: [Previous](@previous)

import Foundation

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.count == 0 || nums.count == 1 || k == 0 {
             return
        }
        
        let rotationsRequired = k % nums.count
        
        if rotationsRequired > 0 {
            if (nums.count - rotationsRequired) < rotationsRequired {
                let diff = nums.count - rotationsRequired
                
                for _ in 1...diff {
                    let first = nums.removeFirst()
                    nums.append(first)
                }
                
            } else {
                for _ in 1...rotationsRequired {
                    let toPop = nums.popLast()!
                    nums.insert(toPop, at: 0)
                }
            }
        }
    }
}

var arrOne = [1,2,3,4,5,6,7]
Solution().rotate(&arrOne, 3)
arrOne

var arrTwo = [-1,-100,3,99]
Solution().rotate(&arrTwo, 3)
arrTwo

//: [Next](@next)
