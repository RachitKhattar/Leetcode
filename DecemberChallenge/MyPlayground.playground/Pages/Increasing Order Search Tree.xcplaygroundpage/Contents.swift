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
    func inorder(node: TreeNode, new: inout TreeNode?, initial: inout TreeNode?) {
        
        if node.left == nil && node.right == nil && new == nil {
            new = node
            initial = node
        } else {
            new?.right = node
        }
        
        if let left = node.left {
            inorder(node: left, new: &new, initial: &initial)
        }
        
        if let right = node.right {
            inorder(node: right, new: &new, initial: &initial)
        }
    }
    
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
    
        var newNode: TreeNode? = nil
        var initial: TreeNode? = nil
        
        inorder(node: root, new: &newNode, initial: &initial)
        
        return initial
    }
}
