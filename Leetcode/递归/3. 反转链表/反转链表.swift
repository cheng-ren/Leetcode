//
//  反转链表.swift
//  LeetcodeTest
//
//  Created on 2025/10/20.
//

import Foundation
import Testing

@Suite(.tags(.递归))
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
    
    /// 递归方法（辅助函数版本）
    class Solution2 {
        func reverseList(_ head: ListNode?) -> ListNode? {
            return reverseHelper(head, nil)
        }
        
        private func reverseHelper(_ curr: ListNode?, _ prev: ListNode?) -> ListNode? {
            // TODO: 实现递归辅助函数
            // 提示：将前一个节点作为参数传递
            return nil
        }
    }
    
    @Test func testUnit0() {
        let list = ListNode.makeList([1, 2, 3, 4, 5])
        let ret = measureLogger(parameters: [[1,2,3,4,5]]) {
            Solution0().reverseList(list)
        }
        #expect(ret?.toList() == [5, 4, 3, 2, 1])
    }
    
    @Test func testUnit1() {
        let list = ListNode.makeList([1, 2])
        let ret = measureLogger(parameters: list?.toList()) {
            Solution1().reverseList(list)
        }
        #expect(ret?.toList() == [2, 1])
    }
    
    @Test func testUnit2() {
        let list = ListNode.makeList([1, 2, 3])
        let ret = measureLogger(parameters: [[1,2,3]]) {
            Solution2().reverseList(list)
        }
        #expect(ret?.toList() == [3, 2, 1])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

/*
学习提示：

1. 递归思路：
   - 假设后面的链表已经反转好了
   - 只需要反转当前节点和下一个节点的指针
   - head.next.next = head（关键操作）

2. 递归过程（1->2->3->4->5）：
   - 递归到最后：5 成为新头
   - 回溯时逐步反转指针

3. 注意事项：
   - head.next = nil 防止形成环
   - 返回值始终是新头节点（原链表最后一个节点）

4. 递归 vs 迭代：
   - 递归：代码简洁，但有栈空间开销
   - 迭代：空间 O(1)，但需要维护多个指针
*/
