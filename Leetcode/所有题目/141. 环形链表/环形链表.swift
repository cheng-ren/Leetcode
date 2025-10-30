//
//  环形链表.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/28.
//

import Foundation
import Testing

struct 环形链表 {
    
    class Solution {
        func hasCycle(_ head: ListNode?) -> Bool {
            var slow = head
            var fast = head
            
            while fast != nil && fast?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next
                
                if slow == fast { return true }
            }
            return false
        }
    }
    
    class SolutionTrain {
        func hasCycle(_ head: ListNode?) -> Bool {
            var slow = head?.next
            var fast = head?.next?.next
            while slow?.next != nil && fast?.next?.next != nil {
                if slow == fast { return true }
                slow = slow?.next
                fast = fast?.next?.next
            }
            return false
        }
    }
    
    
    @Test("测试用例1：空链表") 
    func testEmptyList() async throws {
        let solution = Solution()
        let head = ListNode.makeListWithCycle([], pos: -1)
        #expect(solution.hasCycle(head) == false)
    }
    
    @Test("测试用例2：单节点无环")
    func testSingleNodeNoCycle() async throws {
        let solution = Solution()
        let head = ListNode.makeListWithCycle([1], pos: -1)
        #expect(solution.hasCycle(head) == false)
    }
    
    @Test("测试用例3：多节点无环")
    func testMultipleNodesNoCycle() async throws {
        let solution = Solution()
        let head = ListNode.makeListWithCycle([3, 2, 0, -4], pos: -1)
        #expect(solution.hasCycle(head) == false)
    }
    
    @Test("测试用例4：尾部连接到头部（环从位置0开始）")
    func testCycleAtHead() async throws {
        let solution = Solution()
        // 链表: 1 -> 2 -> 3 -> 4 -> (回到1)
        let head = ListNode.makeListWithCycle([1, 2, 3, 4], pos: 0)
        #expect(solution.hasCycle(head) == true)
    }
    
    @Test("测试用例5：尾部连接到中间节点（环从位置1开始）")
    func testCycleAtMiddle() async throws {
        let solution = Solution()
        // 链表: 3 -> 2 -> 0 -> -4 -> (回到2)
        let head = ListNode.makeListWithCycle([3, 2, 0, -4], pos: 1)
        #expect(solution.hasCycle(head) == true)
    }
    
    @Test("测试用例6：单节点自环")
    func testSingleNodeSelfCycle() async throws {
        let solution = Solution()
        // 链表: 1 -> (回到1)
        let head = ListNode.makeListWithCycle([1], pos: 0)
        #expect(solution.hasCycle(head) == true)
    }
    
    @Test("测试用例7：两个节点成环")
    func testTwoNodesCycle() async throws {
        let solution = Solution()
        // 链表: 1 -> 2 -> (回到1)
        let head = ListNode.makeListWithCycle([1, 2], pos: 0)
        #expect(solution.hasCycle(head) == true)
    }
    
    @Test("测试用例8：较长链表，环在尾部")
    func testLongListCycleAtEnd() async throws {
        let solution = Solution()
        // 链表: 1 -> 2 -> 3 -> 4 -> 5 -> (回到5)
        let head = ListNode.makeListWithCycle([1, 2, 3, 4, 5], pos: 4)
        #expect(solution.hasCycle(head) == true)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
