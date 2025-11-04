//
//  反转链表II.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/30.
//

import Foundation
import Testing

//  ```
//  输入：head = [1,2,3,4,5], left = 2, right = 4
//  输出：[1,4,3,2,5]
//  ```

@Suite(.tags(.链表))
struct 反转链表II {
    
    // MARK: - 头插法（推荐）
    // 思路：使用头插法，将 left 到 right 区间的节点依次插到 pre 节点后面
    // 时间复杂度：O(n)，只需遍历一次
    // 空间复杂度：O(1)，只用常数个指针
    class Solution {
        func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
            let dummy = ListNode(0)
            dummy.next = head
            
            var pre: ListNode? = dummy
            for _ in 0..<left - 1 {
                pre = pre?.next
            }
            
            let cur = pre?.next
            // 1 -> 2 -> 3 -> 4 -> 5
            for _ in 0..<(right - left) {
                let nextNode = cur?.next
                // 1. 拆成相交链表
                //       3
                //        \
                // 1 - 2 - 4 - 5
                cur?.next = nextNode?.next
                // 2. 将分支的链表 nextNode 调整指向
                //       3
                //      /
                // 1 - 2 - 4 - 5
                nextNode?.next = pre?.next
                //          1
                //         /
                //       3
                //      /
                //     2 - 4 - 5
                // 1 - 3 - 2 - 4 - 5
                pre?.next = nextNode
            }
            
            
            return dummy.next
        }
    }
    
    class SolutionTrain {
        func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
            nil
        }
    }

    @Test func testUnit0() {
        let head = ListNode.makeList([1, 2, 3, 4, 5])
        let ret = measureLogger(parameters: [head, 2, 4]) {
            SolutionTrain().reverseBetween(head, 2, 4)
        }
        #expect(ret?.toList() == [1, 4, 3, 2, 5])
    }
    
    @Test func testUnit1() {
        let head = ListNode.makeList([5])
        let ret = measureLogger(parameters: [head, 1, 1]) {
            SolutionTrain().reverseBetween(head, 1, 1)
        }
        #expect(ret?.toList() == [5])
    }
    
    @Test func testUnit2() {
        let head = ListNode.makeList([3, 5])
        let ret = measureLogger(parameters: [head, 1, 2]) {
            SolutionTrain().reverseBetween(head, 1, 2)
        }
        #expect(ret?.toList() == [5, 3])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

