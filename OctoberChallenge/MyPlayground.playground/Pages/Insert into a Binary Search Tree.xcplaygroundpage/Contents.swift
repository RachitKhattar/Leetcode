//: [Previous](@previous)

import Foundation

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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return TreeNode(val)
        }
        
        if val < root.val {
            guard let leftNode = root.left else {
                root.left = TreeNode(val)
                return root
            }
            
            insertIntoBST(leftNode, val)
        } else {
            guard let rightNode = root.right else {
                root.right = TreeNode(val)
                return root
            }
            
            insertIntoBST(rightNode, val)
        }
        
        return root
    }
}

[4,2,7,1,3]
5

let three = TreeNode(3)
let one = TreeNode(1)
let two = TreeNode(2, one, three)
let seven = TreeNode(7)

let treeNode = TreeNode(4, two, seven)

Solution().insertIntoBST(treeNode, 5)


//: [Next](@next)
