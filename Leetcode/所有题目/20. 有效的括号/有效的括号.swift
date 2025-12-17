//
//  有效的括号.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/21.
//

import Foundation
import Testing

@Suite(.serialized, .tags(.简单, .栈))
struct 有效的括号 {
    // MARK: - 栈
    // 时间复杂度：O(n)，每个元素最多入栈和出栈各一次
    // 空间复杂度：O(n)，栈的大小
    class Solution {
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
    
    /// ()[]{}
    /// true
    
    class SolutionTrain {
        func isValid(_ s: String) -> Bool {
            false
        }
    }
    
    @Test func testUnit0() async throws {
        let paramater = "()[]{}"
        let ret = measureLogger(parameters: [paramater]) {
            SolutionTrain().isValid(paramater)
        }
        #expect(ret == true)
    }
    
    @Test func testUnit1() async throws {
        let paramater = "([])"
        let ret = measureLogger(parameters: [paramater]) {
            SolutionTrain().isValid(paramater)
        }
        #expect(ret == true)
    }
    
    @Test func testUnit2() async throws {
        let paramater = "([)]"
        let ret = measureLogger(parameters: [paramater]) {
            SolutionTrain().isValid(paramater)
        }
        #expect(ret == false)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
