//: [Previous](@previous)

import Foundation


// Definition for a Node.
public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

class Solution {
    func cloneGraph(_ node: Node?, cloned: inout [Node]) -> Node? {
        guard let node = node else {
            return nil
        }
        
        let clone = Node(node.val)
        cloned.append(clone)
        
        for neighbour in node.neighbors {
            if let neighbour = neighbour {
                if let neighbourClone = cloned.first(where: { (node) -> Bool in
                    node.val == neighbour.val
                }) {
                    clone.neighbors.append(neighbourClone)
                } else {
                    let neighbourClone = cloneGraph(neighbour, cloned: &cloned)
                    clone.neighbors.append(neighbourClone)
                }
            }
        }
        
        return clone
    }
    
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        
        var cloned = [Node]()
        
        return cloneGraph(node, cloned: &cloned)
    }
}

//: [Next](@next)
