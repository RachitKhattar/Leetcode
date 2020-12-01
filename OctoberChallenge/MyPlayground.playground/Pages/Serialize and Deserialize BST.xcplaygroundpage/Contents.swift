//: [Previous](@previous)

import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Codec {
    // Encodes a tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var str = ""
        
        guard let root = root else {
            return str
        }
        
        str += "\(root.val)$$"
        
        if let left = root.left {
            str += "\(serialize(left))$$"
        }
        
        if let right = root.right {
            str += "\(serialize(right))$$"
        }
        
        return str
    }
    
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
    
//     Decodes your encoded data to tree.
    func deserialize(_ data: String) -> TreeNode? {
        var strComps = data.components(separatedBy: "$$")
                
        guard let intVal =  Int(strComps.first ?? "") else {
            return nil
        }
        
        
        
        strComps.remove(at: 0)

        let node = TreeNode(intVal)
        
        let intComps = strComps.compactMap{ Int( $0 ) }
        
        for intComp in intComps {
            insertIntoBST(node, intComp)
        }
        
//        if let subNode = deserialize(strComps.joined(separator: "$$")) {
//            if subNode.val < node.val {
//                node.left = subNode
//            } else  {
//                node.right = subNode
//            }
//        }
        return node
    }
}


let three = TreeNode(3)
let two = TreeNode(2)
let four = TreeNode(4)
let one = TreeNode(1)
three.left = one
three.right = four
one.right = two

let str = Codec().serialize(three)
Codec().deserialize(str)?.val

/**
 * Your Codec object will be instantiated and called as such:
 * let ser = Codec()
 * let deser = Codec()
 * let tree: String = ser.serialize(root)
 * let ans = deser.deserialize(tree)
 * return ans
 */

//: [Next](@next)
