//
//  两数相加.swift
//  Leetcode
//
//  Created by yiche on 2025/7/14.
//

import Testing

struct 两数相加 {
    
    class Solution {
        
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            
            let rNode = ListNode()
            var cNode = rNode
            
            var carry = 0
            
            var lNext = l1
            var rNext = l2
            
            while !(lNext == nil && rNext == nil) {
                
                var sum = (lNext?.val ?? 0) + (rNext?.val ?? 0) + carry
                carry = 0
                if sum >= 10 {
                    sum -= 10
                    carry += 1
                }
                
                let sumNode = ListNode()
                sumNode.val = sum
                cNode.next = sumNode
                
                lNext = lNext?.next
                rNext = rNext?.next
                cNode = sumNode
            }
            
            if carry > 0 {
                let sumNode = ListNode()
                sumNode.val = 1
                cNode.next = sumNode
            }
            
            return rNode.next
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
        
        print(node2)
        print(node5)
        
        let ret = Solution().addTwoNumbers(node2, node5) // 预期 "7 0 8"
        
        #expect(ret != nil)
    }
    
    @Test
    func testUnit1() {
        
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
        
        let ret = Solution().addTwoNumbers(node9, node19) // 预期 "7 0 8"
        
        #expect(ret != nil)
    }
    
    @Test
    func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
