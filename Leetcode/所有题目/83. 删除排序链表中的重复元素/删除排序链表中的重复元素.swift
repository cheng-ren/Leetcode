//
//  删除排序链表中的重复元素.swift
//  LeetcodeTest
//
//  Created by rencheng on 2025/10/29.
//

import Foundation
import Testing

//  ```
//  输入: head = [1,1,2]
//  输出: [1,2]
//  ```

@Suite(.tags(.链表))
struct 删除排序链表中的重复元素 {
    
    // MARK: - 待实现
    class Solution {
        func deleteDuplicates(_ head: ListNode?) -> ListNode? {
            guard head != nil else { return nil }
            var curNode = head
            while curNode?.next != nil {
                if curNode!.val == curNode!.next!.val {
                    curNode?.next = curNode?.next?.next
                } else {
                    curNode = curNode?.next
                }
            }
            return head
        }
    }
    
    class SolutionTrain {
        func deleteDuplicates(_ head: ListNode?) -> ListNode? {
            // TODO: 实现你的解决方案
            return nil
        }
    }

    @Test func testUnit0() {
        let head = ListNode.makeList([1, 1, 2])
        let ret = measureLogger(parameters: [[1, 1, 2]]) {
            SolutionTrain().deleteDuplicates(head)
        }
        #expect(ret?.toList() == [1, 2])
    }
    
    @Test func testUnit1() {
        let head = ListNode.makeList([1, 1, 2, 3, 3])
        let ret = measureLogger(parameters: [[1, 1, 2, 3, 3]]) {
            SolutionTrain().deleteDuplicates(head)
        }
        #expect(ret?.toList() == [1, 2, 3])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

