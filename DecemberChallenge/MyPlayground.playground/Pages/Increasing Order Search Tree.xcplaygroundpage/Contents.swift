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

public struct TreeNodeStack {
    var array = [TreeNode]()
    
    mutating func push(_ element: TreeNode) {
        array.append(element)
    }
    
    mutating func pop() -> TreeNode? {
        return array.popLast()
    }
}

class BSTIterator {
    
    var stack = TreeNodeStack()

    init(_ root: TreeNode?) {
        pushAll(root)
    }
    
    func pushAll(_ root: TreeNode?) {
        var toPush = root
        
        while toPush != nil {
            stack.push(toPush!)
            toPush = toPush?.left
        }
    }
    
    func next() -> Int {
        let popped = stack.pop()!
        
        if let right = popped.right {
            
            if right.left != nil {
                pushAll(right)
            } else {
                stack.push(right)
            }
        }
        return popped.val
    }
    
    func hasNext() -> Bool {
        !stack.array.isEmpty
    }
}


class Solution {
    
    var stack = TreeNodeStack()
    var head: TreeNode? = nil
    var tail: TreeNode? = nil
    
    func updateStack(_ root: TreeNode) {
        
        print(root.val)
        
        if root.left == nil && root.right == nil {
            stack.push(root)
            if let popped = stack.pop() {
                if head == nil {
                    head = TreeNode(popped.val)
                    tail = head
                } else {
                    let new = TreeNode(popped.val)
                    tail?.right = new
                    tail = new
                }
            }
        } else {
            if let left = root.left {
                stack.push(root)
                updateStack(left)
            } else {
                if let popped = stack.pop() {
                    if head == nil {
                        head = TreeNode(popped.val)
                        tail = head
                    } else {
                        let new = TreeNode(popped.val)
                        tail?.right = new
                        tail = new
                    }
                }
            }
            
            if let right = root.right {
                stack.push(right)
                updateStack(right)
            } else {
                if let popped = stack.pop() {
                    if head == nil {
                        head = TreeNode(popped.val)
                        tail = head
                    } else {
                        let new = TreeNode(popped.val)
                        tail?.right = new
                        tail = new
                    }
                }
            }
        }
    }
    
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        
        updateStack(root)
        
        return head
    }
}
