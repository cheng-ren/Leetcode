//
//  环形链表II.swift
//  LeetcodeTest
//
//  Created by rencheng on 2025/10/29.
//

import Foundation
import Testing

//  ```
//  输入：head = [3,2,0,-4], pos = 1
//  输出：返回索引为 1 的链表节点
//  解释：链表中有一个环，其尾部连接到第二个节点。
//  ```

@Suite(.serialized, .tags(.链表, .快慢指针, .哈希表))
struct 环形链表II {
    
    // MARK: - 哈希表
    class Solution {
        func detectCycle(_ head: ListNode?) -> ListNode? {
            guard head != nil else { return nil }
            var set: Set<ListNode> = Set()
            var cur = head
            while cur != nil {
                if set.contains(cur!) {
                    return cur
                }
                set.insert(cur!)
                cur = cur?.next
            }
            return nil
        }
    }
    
    // MARK: - 双指针
    
    class SolutionTrain {
        func detectCycle(_ head: ListNode?) -> ListNode? {
            guard head != nil && head?.next != nil else { return nil }
            var slow = head
            var fast = head

            repeat {
                slow = slow?.next
                fast = fast?.next?.next
            } while fast != nil && fast?.next != nil && fast !== slow
            
            if fast == nil || fast?.next == nil { return nil }
            
            fast = head
            while fast !== slow {
                fast = fast?.next
                slow = slow?.next
            }
            
            return slow
        }
    }

    @Test func testUnit0() {
        let node3 = ListNode(3)
        let node2 = ListNode(2)
        let node0 = ListNode(0)
        let node4 = ListNode(-4)
        node3.next = node2
        node2.next = node0
        node0.next = node4
        node4.next = node2  // 形成环
        
        let ret = measureLogger(parameters: [[3, 2, 0, -4], 1]) {
            SolutionTrain().detectCycle(node3)
        }
        #expect(ret === node2)
    }
    
    @Test func testUnit1() {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        node1.next = node2
        node2.next = node1  // 形成环
        
        let ret = measureLogger(parameters: [[1, 2], 0]) {
            SolutionTrain().detectCycle(node1)
        }
        #expect(ret === node1)
    }
    
    @Test func testUnit2() {
        let node1 = ListNode(1)
        
        let ret = measureLogger(parameters: [[1], -1]) {
            SolutionTrain().detectCycle(node1)
        }
        #expect(ret == nil)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}


