//: [Previous](@previous)

import Foundation


var str = "rachit"

let a = str.index(str.startIndex, offsetBy: 0)..<str.index(str.startIndex, offsetBy: 1)
a

str.replaceSubrange(a, with: "rac")


for i in 0..<str.count {
    
    print(str[str.index(str.startIndex, offsetBy: i)])
    
//    str.replaceSubrange(str.range, with: <#T##Collection#>)
}

class Solution {
    func bitwiseComplement(_ N: Int) -> Int {
                
        let bitRep = String(N, radix: 2)
        
        var updatedBitRep = ""
        
        for char in bitRep {
            updatedBitRep += String( 1 - Int(String(char))! )
        }
        
        return Int(updatedBitRep, radix: 2)!
    }
}

Solution().bitwiseComplement(5)
Solution().bitwiseComplement(7)
Solution().bitwiseComplement(10)

//: [Next](@next)
