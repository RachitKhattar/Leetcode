//: [Previous](@previous)

import Foundation

class Solution {
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var combinations = [[Int]]()
        
        let candidatesToUse = candidates.sorted()
                
        for candidate in candidatesToUse {
            let remainder = target % candidate
            
            if remainder == 0 {
                combinations.append(Array(repeating: candidate, count: target / candidate))
                
                var remainingCandidates = candidatesToUse
                
                if let index = remainingCandidates.firstIndex(of: candidate) {
                    remainingCandidates.removeFirst(index + 1)
                }
                
                let maxCount = (target / candidate) - 2
                                
                if maxCount >= 1 {
                    for i in 1...maxCount {
                        
                        let subCombinations = combinationSum(remainingCandidates, target - (candidate * i))
                                                
                        for subCombination in subCombinations {
                            var arr = Array(repeating: candidate, count: i)
                            arr.append(contentsOf: subCombination)
                            combinations.append(arr)
                        }
                    }
                }
            } else if remainder < target {
                
                var remainingCandidates = candidatesToUse
                
                if let index = remainingCandidates.firstIndex(of: candidate) {
                    remainingCandidates.removeFirst(index + 1)
                }
                
                let maxCount = (target - remainder) / candidate
                
                for i in 0..<maxCount {
                    let subCombinations = combinationSum(remainingCandidates, remainder + candidate * i)
                    
                    for subCombination in subCombinations {
                        var arr = Array(repeating: candidate, count: maxCount - i)
                        arr.append(contentsOf: subCombination)
                        combinations.append(arr)
                    }
                }
                
                
            } else {
                // do nothing
            }
        }
        
        return combinations
    }
    
}

//Solution().combinationSum([2,3,6,7], 7)
//Solution().combinationSum([2,3,5], 8)
//Solution().combinationSum([1, 2], 3)
Solution().combinationSum([4, 2, 8], 8)


