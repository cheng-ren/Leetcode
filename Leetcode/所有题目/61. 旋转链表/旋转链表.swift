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

@Suite(.tags(.链表))
struct 旋转链表 {
    
    // MARK: - 待实现
    class Solution {
        func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
            nil
        }
    }
    
    class SolutionTrain {
        func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
            guard head != nil else { return nil }
            guard k > 0 && head?.next != nil else { return head }
            var cur = head
            var buckets: [ListNode] = []
            while cur != nil {
                buckets.append(cur!)
                cur = cur?.next
            }
            let cnt = k % buckets.count
            if cnt == 0 { return head }
            
            if cnt != 0 {
                buckets[buckets.count - 1].next = buckets[0]
            }
            
            buckets[buckets.count - cnt - 1].next = nil
            return buckets[buckets.count - cnt]
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

