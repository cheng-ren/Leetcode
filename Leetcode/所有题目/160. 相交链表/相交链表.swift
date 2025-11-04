//
//  相交链表.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/30.
//

import Foundation
import Testing

//  给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。
//  如果两个链表不存在相交节点，返回 null 。
//
//  示例 1：
//  ```
//  输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
//  输出：Intersected at '8'
//  解释：相交节点的值为 8 （注意，如果两个链表相交则不能为 0）。
//  从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,6,1,8,4,5]。
//  在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。
//  ```
//  A:      a1 → a2
//                  ↘
//                      c1 → c2 → c3
//                  ↗
//  B: b1 → b2 → b3
//  LA = LA1 + LA2
//  LB = LB1 + LB2

@Suite(.tags(.链表, .哈希表))
struct 相交链表 {
    
    // MARK: 哈希表
    class Solution {
        func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
            var set: Set<ListNode> = Set()
            var curNode = headA
            while curNode != nil {
                set.insert(curNode!)
                curNode = curNode?.next
            }
            
            curNode = headB
            while curNode != nil {
                if set.contains(curNode!) {
                    return curNode
                }
                curNode = curNode?.next
            }
            
            return nil
        }
    }
    
    // MARK: 双指针
    class Solution1 {
        func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
            nil
        }
    }

    class SolutionTrain {
        func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
            nil
        }
    }
    
    @Test func testUnit0() {
        // 创建相交链表：listA = [4,1,8,4,5], listB = [5,6,1,8,4,5]
        // 相交节点值为 8
        let node8 = ListNode(8)
        let node4_2 = ListNode(4)
        let node5_2 = ListNode(5)
        node8.next = node4_2
        node4_2.next = node5_2
        
        // listA: 4 -> 1 -> 8 -> 4 -> 5
        let node4_1 = ListNode(4)
        let node1_1 = ListNode(1)
        node4_1.next = node1_1
        node1_1.next = node8
        
        // listB: 5 -> 6 -> 1 -> 8 -> 4 -> 5
        let node5_1 = ListNode(5)
        let node6 = ListNode(6)
        let node1_2 = ListNode(1)
        node5_1.next = node6
        node6.next = node1_2
        node1_2.next = node8
        
        let ret = measureLogger(parameters: [node4_1, node5_1]) {
            SolutionTrain().getIntersectionNode(node4_1, node5_1)
        }
        #expect(ret?.val == 8)
    }
    
    @Test func testUnit1() {
        // 创建相交链表：listA = [1,9,1,2,4], listB = [3,2,4]
        // 相交节点值为 2
        let node2 = ListNode(2)
        let node4 = ListNode(4)
        node2.next = node4
        
        // listA: 1 -> 9 -> 1 -> 2 -> 4
        let node1_1 = ListNode(1)
        let node9 = ListNode(9)
        let node1_2 = ListNode(1)
        node1_1.next = node9
        node9.next = node1_2
        node1_2.next = node2
        
        // listB: 3 -> 2 -> 4
        let node3 = ListNode(3)
        node3.next = node2
        
        let ret = measureLogger(parameters: [node1_1, node3]) {
            SolutionTrain().getIntersectionNode(node1_1, node3)
        }
        #expect(ret?.val == 2)
    }
    
    @Test func testUnit2() {
        // 创建不相交链表：listA = [2,6,4], listB = [1,5]
        let node2 = ListNode(2)
        let node6 = ListNode(6)
        let node4 = ListNode(4)
        node2.next = node6
        node6.next = node4
        
        let node1 = ListNode(1)
        let node5 = ListNode(5)
        node1.next = node5
        
        let ret = measureLogger(parameters: [node2, node1]) {
            SolutionTrain().getIntersectionNode(node2, node1)
        }
        #expect(ret == nil)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
