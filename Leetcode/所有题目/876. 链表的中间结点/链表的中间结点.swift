//
//  链表的中间结点.swift
//  LeetcodeTest
//
//  Created by rencheng on 2025/10/27.
//

import Foundation
import Testing

//  ```
//  输入：head = [1,2,3,4,5]
//  输出：[3,4,5]
//  解释：链表只有一个中间结点，值为 3 。
//  ```

@Suite(.tags(.链表))
struct 链表的中间结点 {
    
    // TODO: 实现你的解决方案
    class Solution {
        func middleNode(_ head: ListNode?) -> ListNode? {
            var fast = head
            var slow = head
            
            while fast?.next != nil {
                fast = fast?.next?.next
                slow = slow?.next
            }
            
            return slow
        }
    }

    @Test func testUnit0() {
        let head = ListNode.makeList([1, 2, 3, 4, 5])
        let ret = measureLogger(parameters: [[1, 2, 3, 4, 5]]) {
            Solution().middleNode(head)
        }
        #expect(ret?.val == 3)
    }
    
    @Test func testUnit1() {
        let head = ListNode.makeList([1, 2, 3, 4, 5, 6])
        let ret = measureLogger(parameters: [[1, 2, 3, 4, 5, 6]]) {
            Solution().middleNode(head)
        }
        #expect(ret?.val == 4)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

