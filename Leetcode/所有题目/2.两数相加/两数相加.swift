//
//  两数相加.swift
//  Leetcode
//
//  Created by yiche on 2025/7/14.
//

import Testing

@Suite(.serialized, .tags(.链表))
struct 两数相加 {
    
    class Solution {
        
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            // 需要注意的点
            // 1. 进位(下一个元素进位,最后一个进位)
            // 2. 两个链表长度不一致
            // 3. 虚拟头结点用于处理链表长度不一致的情况,方便返回结果
            
            let vHead = ListNode(0)
            var cNode = vHead
            
            var carry = 0

            var p1 = l1
            var p2 = l2
    
            while p1 != nil || p2 != nil || carry > 0 {
                let lVal = p1?.val ?? 0
                let rVal = p2?.val ?? 0
                var nVal = lVal + rVal + carry

                carry = nVal / 10
                nVal = nVal % 10
                
                cNode.next = ListNode(nVal)
                cNode = cNode.next!
                
                p1 = p1?.next
                p2 = p2?.next
            }

            return vHead.next
        }
        
        
    }
    
    class SolutionTrain {
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            nil
        }
    }
    
    @Test func testUnit0() {
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
        let node44 = ListNode()
        node44.val = 4
        node5.next = node6
        node6.next = node44
        
        let ret = measureLogger(parameters: [node2, node5]) {
            SolutionTrain().addTwoNumbers(node2, node5) // 预期 "7 0 8"
        }
        
        #expect(ret?.toList() == [7, 0, 8])
    }
    
    @Test func testUnit1() {
        
        // 2, 4, 3
        let node9 = ListNode()
        node9.val = 9
        let node99 = ListNode()
        node99.val = 9
        let node999 = ListNode()
        node999.val = 9
        let node9999 = ListNode()
        node9999.val = 9
        let node99999 = ListNode()
        node99999.val = 9
        let node999999 = ListNode()
        node999999.val = 9
        let node9999999 = ListNode()
        node9999999.val = 9
        node9.next = node99
        node99.next = node999
        node999.next = node9999
        node9999.next = node99999
        node99999.next = node999999
        node999999.next = node9999999
        
        // 5, 6, 4
        let node19 = ListNode()
        node19.val = 9
        let node199 = ListNode()
        node199.val = 9
        let node1999 = ListNode()
        node1999.val = 9
        let node19999 = ListNode()
        node19999.val = 9
        
        node19.next = node199
        node199.next = node1999
        node1999.next = node19999
        
        let ret = measureLogger(parameters: [node9, node19]) {
            SolutionTrain().addTwoNumbers(node9, node19)
        }
        
        #expect(ret?.toList() == [8,9,9,9,0,0,0,1])
    }
    
    @Test(.disabled(if: canPrintProblem))
    func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
