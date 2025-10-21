//
//  回文链表.swift
//  LeetcodeTest
//
//  Created by 任成 on 2025/10/20.
//

import Foundation
import Testing

struct 回文链表 {
    
    // 遍历
    // 时间复杂度O(n)
    // 空间复杂度O(n)
    class Solution0 {
        func isPalindrome(_ head: ListNode?) -> Bool {
            var p = head
            var list: [Int] = []
            while p != nil {
                list.append(p!.val)
                p = p?.next
            }

            for i in 0..<(list.count / 2) {
                let j = list.count - i - 1
                if list[i] != list[j] {
                    return false
                }
            }
            return true
        }
    }

    class Solution1 {
        func isPalindrome(_ head: ListNode?) -> Bool {
            // 快慢指针找链表中点
            var slow = head
            var fast = head
            while fast?.next != nil && fast?.next?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next
            }
            
            var reverseNode = reverseList(slow?.next)
            var pHead = head
            while reverseNode != nil {
                if reverseNode?.val != pHead?.val {
                    return false
                }
                pHead = pHead?.next
                reverseNode = reverseNode?.next
            }
            return true
        }
        
        private func reverseList(_ root: ListNode?) -> ListNode? {
            // 反转链表
            if root == nil || root?.next == nil { return root }
            let newNode = reverseList(root?.next)
            root?.next?.next = root
            root?.next = nil
            return newNode
        }
    }


    @Test func testUnit0() async throws {
        let head = ListNode(1, ListNode(2, ListNode(2, ListNode(1))))
        let ret = measureLogger(parameters: [head]) {
            Solution0().isPalindrome(head)
        }
        #expect(ret == true)
    }
    
    @Test func testUnit1() async throws {
        let head = ListNode(1, ListNode(2, ListNode(2, ListNode(1))))
        let ret = measureLogger(parameters: [head]) {
            Solution1().isPalindrome(head)
        }
        #expect(ret == true)
    }

    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}
