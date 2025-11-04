//
//  合并两个有序链表.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/28.
//

import Foundation
import Testing

//  ```
//  输入：l1 = [1,2,4], l2 = [1,3,4]
//  输出：[1,1,2,3,4,4]
//  ```

@Suite(.tags(.链表, .双指针))
struct 合并两个有序链表 {
    
    // MARK: - 方案一：迭代法（推荐）
    // 使用虚拟头节点，当一个链表遍历完后直接连接另一个链表的剩余部分
    // 时间复杂度：O(m + n)，每个节点最多被访问一次
    // 空间复杂度：O(1)，只使用了常数级别的额外空间
    class Solution {
        func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
            let dummy = ListNode(0)
            var curr = dummy
            var p1 = list1
            var p2 = list2
            
            // 当两个链表都不为空时，比较并选择较小的节点
            while p1 != nil && p2 != nil {
                if p1!.val < p2!.val {
                    curr.next = p1
                    p1 = p1?.next
                } else {
                    curr.next = p2
                    p2 = p2?.next
                }
                curr = curr.next!
            }
            
            // 连接剩余的链表（只有一个不为空）
            curr.next = p1 ?? p2
            
            return dummy.next
        }
    }
    
    class SolutionTrain {
        func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
            nil
        }
    }

    @Test func testUnit0() {
        let l1 = ListNode.makeList([1, 2, 4])
        let l2 = ListNode.makeList([1, 3, 4])
        let ret = measureLogger(parameters: [[1, 2, 4], [1, 3, 4]]) {
            SolutionTrain().mergeTwoLists(l1, l2)
        }
        #expect(ret?.toList() == [1, 1, 2, 3, 4, 4])
    }
    
    @Test func testUnit2() {
        let l1 = ListNode.makeList([])
        let l2 = ListNode.makeList([0])
        let ret = measureLogger(parameters: [[], [0]]) {
            SolutionTrain().mergeTwoLists(l1, l2)
        }
        #expect(ret?.toList() == [0])
    }
    
    @Test func testSolution2_0() {
        let l1 = ListNode.makeList([1, 2, 4])
        let l2 = ListNode.makeList([1, 3, 4])
        let ret = SolutionTrain().mergeTwoLists(l1, l2)
        #expect(ret?.toList() == [1, 1, 2, 3, 4, 4])
    }
    
    @Test func testSolution3_0() {
        let l1 = ListNode.makeList([1, 2, 4])
        let l2 = ListNode.makeList([1, 3, 4])
        let ret = SolutionTrain().mergeTwoLists(l1, l2)
        #expect(ret?.toList() == [1, 1, 2, 3, 4, 4])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}
