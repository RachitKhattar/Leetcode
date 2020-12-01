//: [Previous](@previous)

import Foundation

let cst = "Rachit"

cst.contains("R")

struct Stack {
    private var myArray: [Character] = []
    
    var isEmpty: Bool {
        return myArray.isEmpty
    }
    
    mutating func push(_ element: Character) {
        myArray.append(element)
    }
    
    mutating func pop() -> Character? {
        return myArray.popLast()
    }
    
    
    func peek() -> Character? {
        return myArray.last
    }
}


class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        
        var charAndCount = [Character: Int]()
        
        for char in s {
            if var count = charAndCount[char] {
                count += 1
                charAndCount[char] = count
            } else {
                charAndCount[char] = 1
            }
        }
        
        var stack = Stack()
        
        var input = ""
        
        for char in s {
            
            charAndCount[char]! = (charAndCount[char]! - 1)
            
            if let _ = input.firstIndex(of: char) {
                continue
            }
            
            while !stack.isEmpty && char < stack.peek()! && charAndCount[stack.peek()!]! > 0 {
                
                if let index = input.firstIndex(of: stack.peek()!) {
                    input.remove(at: index)
                }
                stack.pop()
            }
            
            if !input.contains(char) {
                
                input.append(char)
                
                stack.push(char)
                
            }
        }
        
        var finalString = ""
        while !stack.isEmpty {
            finalString.append(stack.peek()!)
            stack.pop()
        }
        
        
        return String(finalString.reversed())
    }
    
    
}


/*
 int[] count = new int[26];
       for(int i = 0; i < s.length(); i++){
           count[s.charAt(i) - 'a'] ++;
       }

       boolean[] visited = new boolean[26];
       Stack<Character> stack = new Stack();

       for(int i = 0; i < s.length(); i ++){

           count[s.charAt(i) - 'a'] --;

           if(visited[s.charAt(i) - 'a'])
               continue;



           while(!stack.isEmpty() && s.charAt(i) < stack.peek() && count[stack.peek()-'a'] > 0){
               visited[stack.pop()- 'a'] = false;
           }

           stack.push(s.charAt(i));
           visited[s.charAt(i) - 'a'] = true;
       }

       StringBuilder result = new StringBuilder();
       while(!stack.isEmpty())
          result.append(stack.pop());

       return result.reverse().toString();
 }
 */



Solution().removeDuplicateLetters("edebbed") // bed

Solution().removeDuplicateLetters("ecbacba") // eacb
//
Solution().removeDuplicateLetters("bcabc")

Solution().removeDuplicateLetters("cbacdcbc")
//
Solution().removeDuplicateLetters("beeaddbeb")
Solution().removeDuplicateLetters("abacb")

//: [Next](@next)


//func removeDuplicateLetters2(_ s: String) -> String {
//
//    var chars = [Character]()
//
//    for i in 0..<s.count {
//
//        let char = s[s.index(s.startIndex, offsetBy: i)]
//
//        if let index = chars.firstIndex(of: char) {
//            print("char: \(char)")
//
//            if index < chars.count - 1 {
//                let charNext = chars[index + 1]
//                print("charnext: \(charNext)")
//                if charNext < char {
//                    chars.remove(at: index)
//                    chars.append(char)
//                } else if let charNextLastIndex = s.lastIndex(of: charNext) {
//                    if let charLastIndex = s.lastIndex(of: char), s.distance(from: s.startIndex, to: charNextLastIndex) > i {
//                        chars.remove(at: index)
//                        chars.append(char)
//                    }
//                }
//            }
//        } else {
//            chars.append(char)
//        }
//        print("charsEnd: \(chars) \n\n")
//    }
//
//    return chars.map{ String($0) }.joined(separator: "")
//}


/*
 func removeDuplicateLetters(_ s: String) -> String {
 
 var charAndIndeces = [Character: [Int]]()
 
 for (index, char) in s.enumerated() {
 if let indeces = charAndIndeces[char] {
 var newIndeces = indeces
 newIndeces.append(index)
 charAndIndeces[char] = newIndeces
 } else {
 charAndIndeces[char] = [index]
 }
 }
 
 let sortedKeys: [Character] = charAndIndeces.keys.sorted()
 
 var finalOrderedChars = [Character]()
 
 for outerKey in sortedKeys {
 
 var finalArray: [Character?] = Array(repeating: nil, count: s.count)
 
 let lowestIndex = charAndIndeces[outerKey]!.min()!
 
 finalArray[lowestIndex] = outerKey
 
 var innerLowestIndex = lowestIndex
 
 for innerKey in sortedKeys {
 
 if innerKey != outerKey {
 
 let trueEli = charAndIndeces[innerKey]!.filter { $0 > innerLowestIndex }
 
 let eligibleVals = charAndIndeces[innerKey]!.filter { $0 > lowestIndex && $0 < innerLowestIndex }
 
 if trueEli.count > 0 {
 let innerLowerIndex = trueEli.min()!
 
 finalArray[innerLowerIndex] = innerKey
 
 innerLowestIndex = innerLowerIndex
 } else if eligibleVals.count > 0 {
 let innerLowerIndex = eligibleVals.max()!
 
 finalArray[innerLowerIndex] = innerKey
 
 } else {
 break
 }
 }
 }
 
 let a = finalArray.compactMap{ $0 }
 
 if a.count == sortedKeys.count {
 finalOrderedChars = a
 break
 }
 }
 
 return finalOrderedChars.map{ String($0) }.joined(separator: "")
 }
 */
