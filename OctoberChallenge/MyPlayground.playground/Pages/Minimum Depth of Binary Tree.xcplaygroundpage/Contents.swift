//: [Previous](@previous)

import Foundation


// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        if root.left == nil && root.right == nil {
            return 1
        }
        
        var minLeft = -1
        if let left = root.left {
            minLeft = minDepth(left)
        }
        
        var minRight = -1
        if let right = root.right {
            minRight = minDepth(right)
        }
         
        if minLeft == -1 {
            return minRight + 1
        } else if minRight == -1 {
            return minLeft + 1
        } else {
            return min(minLeft, minRight) + 1
        }
        
    }
}

//: [Next](@next)
