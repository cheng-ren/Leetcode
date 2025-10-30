//
//  ListNode.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/20.
//

import Foundation

class ListNode {
    
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    // 辅助函数：将链表转为数组（支持环形链表检测）
    func toList() -> [Int] {
        var result: [Int] = []
        var current: ListNode? = self
        var visited: Set<ObjectIdentifier> = []
        
        while current != nil {
            let nodeId = ObjectIdentifier(current!)
            
            // 检测到环，停止遍历
            if visited.contains(nodeId) {
                break
            }
            
            visited.insert(nodeId)
            result.append(current!.val)
            current = current?.next
            
            // 防止无限循环的安全措施
            if result.count > 10000 {
                break
            }
        }
        return result
    }
    
    static func makeList(_ values: [Int]) -> ListNode? {
        guard !values.isEmpty else { return nil }
        let dummy = ListNode(0)
        var curr = dummy
        for val in values {
            curr.next = ListNode(val)
            curr = curr.next!
        }
        return dummy.next
    }
    
    // 辅助函数：创建环形链表
    // pos: 表示尾节点连接到链表中第几个节点（从0开始），-1表示无环
    static func makeListWithCycle(_ values: [Int], pos: Int) -> ListNode? {
        guard !values.isEmpty else { return nil }
        
        let dummy = ListNode(0)
        var curr = dummy
        var nodes: [ListNode] = []
        
        // 创建链表并保存所有节点
        for val in values {
            let node = ListNode(val)
            curr.next = node
            curr = node
            nodes.append(node)
        }
        
        // 如果pos有效，创建环
        if pos >= 0 && pos < nodes.count {
            curr.next = nodes[pos]
        }
        
        return dummy.next
    }
    
}

extension ListNode: CustomStringConvertible {
    var description: String {
        var visited: [ObjectIdentifier: Int] = [:]  // 记录节点的位置
        var current: ListNode? = self
        var ret = ""
        var position = 0
        
        while current != nil {
            let nodeId = ObjectIdentifier(current!)
            
            // 检测到环
            if let cyclePos = visited[nodeId] {
                ret += "(cycle back to position \(cyclePos))"
                break
            }
            
            visited[nodeId] = position
            ret += "\(current!.val)"
            
            current = current!.next
            if current != nil {
                ret += " -> "
            }
            position += 1
            
            // 防止无限循环的安全措施
            if position > 10000 {
                ret += "... (超过10000个节点，停止打印)"
                break
            }
        }
        
        return ret
    }
}

extension ListNode: Equatable {
    
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
    
}

extension ListNode: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }

}
