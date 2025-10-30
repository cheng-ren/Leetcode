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
    
    class SolutionTrain {
        func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
            var prevLeftNode: ListNode? = nil
            var nextLeftNode: ListNode? = nil
            var prevRightNode: ListNode? = nil
            var nextRightNode: ListNode? = nil
            var vHead: ListNode? = ListNode(0)
            vHead?.next = head
            
            var idx = 0
            var curNode = head
            while curNode != nil {
                
                curNode = curNode!.next
                idx += 1
            }
            
            return nil
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
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

