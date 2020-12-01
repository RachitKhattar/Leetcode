//: [Previous](@previous)

import Foundation

class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        if s.count <= 10 {
            return [String]()
        }
        
        var setRange = Set<Substring>()
        var setAns = Set<Substring>()
        
        for i in 0...(s.count - 10) {
            let str = s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i+10)]
            
            if setRange.contains(str) {
                setAns.insert(str)
            } else {
                setRange.insert(str)
            }
        }
        
        return setAns.map{ String($0) }
    }
}
//
Solution().findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT")
Solution().findRepeatedDnaSequences("AAAAAAAAAAAAA")
Solution().findRepeatedDnaSequences("AAAAAAAAAAA")
Solution().findRepeatedDnaSequences("GAGAGAGAGAGAG")
//Solution().findRepeatedDnaSequences("CAAAAAAAAAC")

//: [Next](@next)

/*
 Solution1:
 
 for i in 0...(s.count - 10) {
     let str = String(s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i+10)])

     if var val = keysAndCount[str] {
         val += 1
         keysAndCount[str] = val
     } else {
         keysAndCount[str] = 1
     }
 }
 
 */


/*
 Solution 2:
 var i = 0
 
 var maxI = (s.count - 10) / 2
 if s.count % 2 != 0 {
     maxI += 1
 }
 
 while i < maxI {
     
     let str = s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i+10)]
     
     if setRange.contains(str) {
         setAns.insert(str)
     } else {
         setRange.insert(str)
     }
     
     if !(i == maxI && s.count % 2 == 0) {
         let str2 = s[s.index(s.endIndex, offsetBy: ((i + 10) * -1))..<s.index(s.endIndex, offsetBy: (i) * -1 )]
         
         if setRange.contains(str2) {
             setAns.insert(str2)
         } else {
             setRange.insert(str2)
         }
     }
     
     i += 1
     
 }
 */

