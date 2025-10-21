//
//  有效的括号.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/21.
//

import Foundation
import Testing

@Suite(.tags(.栈))
struct 有效的括号 {
    /// 利用栈实现
    /// 时间复杂度：O(n)，每个元素最多入栈和出栈各一次
    /// 空间复杂度：O(n)，栈的大小
    /// Note:
    /// 遇到左括号：直接压入栈
    /// 遇到右括号：
    ///  - 如果不匹配或栈为空，立即返回 false
    ///  - 出栈
    /// 遍历结束后：检查栈是否为空
    class Solution0 {
        func isValid(_ s: String) -> Bool {
            let pairs: [Character: Character] = [
                "]": "[",
                ")": "(",
                "}": "{"
            ]
            
            var stack: [Character] = []

            for c in s {
                if pairs[c] != nil {
                    if stack.isEmpty || stack.last != pairs[c] {
                        return false
                    }
                    let _ = stack.popLast()
                } else {
                    stack.append(c)
                }
            }
            return stack.isEmpty
        }
    }
    
    @Test func testUnit0() async throws {
        let paramater = "()[]{}"
        let ret = measureLogger(parameters: [paramater]) {
            Solution0().isValid(paramater)
        }
        #expect(ret == true)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
