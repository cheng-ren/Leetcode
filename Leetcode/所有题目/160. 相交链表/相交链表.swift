//
//  相交链表.swift
//  LeetcodeTest
//
//  Created by 任成 on 2025/10/19.
//

import Foundation
import Testing

@Suite(.tags(.链表))
struct 相交链表 {
    ///
    class Solution0 {
        func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
            var pA: ListNode? = headA
            while pA != nil {
                var pB: ListNode? = headB
                while pB != nil {
                    if pA === pB {
                        return pA
                    }
                    pB = pB?.next
                }
                pA = pA?.next
            }
            return nil
        }
    }
    
    /// 哈希集合
    class Solution1 {
        func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
            var pA: ListNode? = headA
            var set: Set<ListNode> = Set()
            while pA != nil {
                set.insert(pA!)
                pA = pA?.next
            }
            var pB: ListNode? = headB
            while pB != nil {
                if set.contains(pB!) {
                    return pB
                }
                pB = pB?.next
            }
            return nil
        }
    }
    
    /// 双指针
    class Solution2 {
        func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
            var pA: ListNode? = headA
            var pB: ListNode? = headB
            while pA !== pB {
                pA = pA == nil ? headB : pA?.next
                pB = pB == nil ? headA : pB?.next
            }
            return pA
        }
    }
    
    @Test func testUnit0() async throws {
        // 2, 4, 3
        let node2 = ListNode()
        node2.val = 2
        let node4 = ListNode()
        node4.val = 4
        let node3 = ListNode()
        node3.val = 3
        node2.next = node4
        node4.next = node3
        
        // 5, 6, 4
        let node5 = ListNode()
        node5.val = 5
        let node6 = ListNode()
        node6.val = 6
        node5.next = node6
        node6.next = node4
        
        let ret = measureLogger(parameters: [node2, node5]) {
            Solution2().getIntersectionNode(node2, node5)
        }
        #expect(ret?.toList() == [4, 3])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
