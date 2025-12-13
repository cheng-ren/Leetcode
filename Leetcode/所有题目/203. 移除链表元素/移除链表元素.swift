//
//  移除链表元素.swift
//  LeetcodeTest
//
//  Created by rencheng on 2025/01/XX.
//

import Foundation
import Testing

//  ```
//  输入：head = [1,2,6,3,4,5,6], val = 6
//  输出：[1,2,3,4,5]
//  ```

@Suite(.serialized, .tags(.链表))
struct 移除链表元素 {
    
    // MARK: - 待实现
    class Solution {
        func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
            // 创建虚拟头节点，简化删除操作（特别是删除头节点的情况）
            let dummy = ListNode(0, head)
            var pre = dummy
            var cur = head
            
            while cur != nil {
                if cur!.val == val {
                    pre.next = cur?.next
                } else {
                    pre = cur!
                }
                cur = cur?.next
            }
            return dummy.next
        }
    }
    
    class SolutionTrain {
        func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
            nil
        }
    }

    @Test func testUnit0() {
        let head = ListNode.makeList([1, 2, 6, 3, 4, 5, 6])
        let ret = measureLogger(parameters: [[1, 2, 6, 3, 4, 5, 6], 6]) {
            SolutionTrain().removeElements(head, 6)
        }
        #expect(ret?.toList() == [1, 2, 3, 4, 5])
    }
    
    @Test func testUnit1() {
        let head = ListNode.makeList([])
        let ret = measureLogger(parameters: [[], 1]) {
            SolutionTrain().removeElements(head, 1)
        }
        #expect(ret?.toList() == nil)
    }
    
    @Test func testUnit2() {
        let head = ListNode.makeList([7, 7, 7, 7])
        let ret = measureLogger(parameters: [[7, 7, 7, 7], 7]) {
            SolutionTrain().removeElements(head, 7)
        }
        #expect(ret?.toList() == nil)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

