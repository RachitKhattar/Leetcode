//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

class Solution {
    func buddyStrings(_ A: String, _ B: String) -> Bool {
        
        if A.count != B.count {
            return false
        }
        
        if A.count < 2 {
            return false
        }
        
        var diffArr = [Int]()
        
        let isSameString = (A == B)
        
        if !isSameString {
            for i in 0..<A.count {
                
                let charA = A[A.index(A.startIndex, offsetBy: i)]
                let charB = B[B.index(B.startIndex, offsetBy: i)]
                
                let diff = Int(charA.asciiValue!) - Int(charB.asciiValue!)
                
                if diff != 0 {
                    diffArr.append(diff)
                }
                
                if diffArr.count > 2 {
                    return false
                }
            }
        }
        
        if diffArr.count == 0 {
            var charAndCount = [Character: Int]()
            
            for char in A {
                if let _ = charAndCount[char] {
                    return true
                } else {
                    charAndCount[char] = 1
                }
            }
        } else if diffArr.count == 2 {
            if (diffArr[0] * -1) == diffArr[1] {
                return true
            }
        }
        
        return false
    }
}

Solution().buddyStrings("ab", "ba")

Solution().buddyStrings("aa", "aa")

Solution().buddyStrings("aaaaaaabc", "aaaaaaacb")

//: [Next](@next)
