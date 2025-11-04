//
//  反转链表.swift
//  LeetcodeTest
//
//  Created on 2025/10/20.
//

import Foundation
import Testing

@Suite(.tags(.链表, .递归))
struct 反转链表 {
    
    /// 递归方法（重点学习）
    class Solution0 {
        func reverseList(_ head: ListNode?) -> ListNode? {
            if (head == nil || head?.next == nil) {
                return head;
            }
            let newHead = reverseList(head?.next);
            head?.next?.next = head;
            head?.next = nil;
            return newHead;
            
        }
    }
    
    /// 迭代方法（对比学习）
    class Solution1 {
        func reverseList(_ head: ListNode?) -> ListNode? {
            // TODO: 实现迭代反转
            // 提示：使用三个指针 prev, curr, next
            
            var curNode = head
            var preNode: ListNode? = nil
            while curNode != nil {
                let nextNode = curNode?.next
                curNode?.next = preNode
                preNode = curNode
                curNode = nextNode
            }
            
            return preNode
        }
    }
    
    class SolutionTrain {
        func reverseList(_ head: ListNode?) -> ListNode? {
            nil
        }
    }
    
    @Test func testUnit0() {
        let list = ListNode.makeList([1, 2, 3, 4, 5])
        let ret = measureLogger(parameters: [[1,2,3,4,5]]) {
            SolutionTrain().reverseList(list)
        }
        #expect(ret?.toList() == [5, 4, 3, 2, 1])
    }
    
    @Test func testUnit1() {
        let list = ListNode.makeList([1, 2])
        let ret = measureLogger(parameters: list?.toList()) {
            SolutionTrain().reverseList(list)
        }
        #expect(ret?.toList() == [2, 1])
    }
    
    @Test func testUnit2() {
        let list = ListNode.makeList([1, 2, 3])
        let ret = measureLogger(parameters: [[1,2,3]]) {
            SolutionTrain().reverseList(list)
        }
        #expect(ret?.toList() == [3, 2, 1])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}
