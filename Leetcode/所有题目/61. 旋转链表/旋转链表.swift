//
//  旋转链表.swift
//  LeetcodeTest
//
//  Created by rencheng on 2025/01/XX.
//

import Foundation
import Testing

//  ```
//  输入：head = [1, 2, 3, 4, 5], k = 2
//  输出：[4,5,1,2,3]
//  ```

@Suite(.serialized, .tags(.链表))
struct 旋转链表 {
    
    // MARK: - 数组辅助解法（空间换时间）
    // 时间复杂度：O(n)，每个节点最多被访问一次
    // 空间复杂度：O(n)，需要一个数组存储链表节点
    // 思路：将链表节点存入数组，通过索引直接定位需要断开的位置，避免多次遍历
    class Solution0 {
        func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
            guard head != nil && head?.next != nil else { return head }
            var cur = head
            var buckets: [ListNode] = []
            while cur != nil {
                buckets.append(cur!)
                cur = cur?.next
            }
            
            if k % buckets.count == 0 { return head }
            
            buckets[buckets.count - 1].next = head
            
            buckets[buckets.count - (k % buckets.count) - 1].next = nil
            
            return buckets[buckets.count - (k % buckets.count)]
        }
    }
    
    // MARK: - 最优解法（成环后断开）
    // 时间复杂度：O(n)，需要遍历链表一次计算长度，再移动指针
    // 空间复杂度：O(1)，只使用常数额外空间
    class Solution1 {
        func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
            guard head != nil && head?.next != nil else { return head }
            
            // 第一次遍历：计算链表长度，同时找到尾节点
            var count = 1
            var tail = head
            while tail?.next != nil {
                count += 1
                tail = tail?.next
            }
            
            // 计算实际需要旋转的步数
            let newK = k % count
            if newK == 0 { return head }
            
            // 将尾节点连接到头节点，形成环
            tail?.next = head
            
            // 找到新头节点的前一个节点（从尾节点向前走 count - newK 步）
            var newTail = head
            for _ in 0..<(count - newK - 1) {
                newTail = newTail?.next
            }
            
            // 断开环，返回新头节点
            let newHead = newTail?.next
            newTail?.next = nil
            
            return newHead
        }
    }
    
    class SolutionTrain {
        func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
            nil
        }
    }

    @Test func testUnit0() {
        let head = ListNode.makeList([1, 2, 3, 4, 5])
        let ret = measureLogger(parameters: [[1, 2, 3, 4, 5], 2]) {
            SolutionTrain().rotateRight(head, 2)
        }
        #expect(ret?.toList() == [4, 5, 1, 2, 3])
    }
    
    @Test func testUnit1() {
        let head = ListNode.makeList([0, 1, 2])
        let ret = measureLogger(parameters: [[0, 1, 2], 4]) {
            SolutionTrain().rotateRight(head, 4)
        }
        #expect(ret?.toList() == [2, 0, 1])
    }
    
    @Test func testUnit2() {
        let head = ListNode.makeList([1, 2])
        let ret = measureLogger(parameters: [[1, 2], 1]) {
            SolutionTrain().rotateRight(head, 1)
        }
        #expect(ret?.toList() == [2, 1])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

