//
//  删除字符串中的所有相邻重复项.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/25.
//

import Foundation
import Testing

//  ```
//  输入："abbaca"
//  输出："ca"
//  解释：
//  例如，在 "abbaca" 中，我们可以删除 "bb" 由于两字母相邻且相同，
//  这是此时唯一可以执行删除操作的重复项。
//  之后我们得到字符串 "aaca"，其中又只有 "aa" 可以执行重复项删除操作，
//  所以最后的字符串为 "ca"。
//  ```

@Suite(.tags(.栈))
struct 删除字符串中的所有相邻重复项 {
    
    // MARK: - 栈
    // 遍历字符串，如果栈顶元素与当前字符相同则弹出，否则入栈
    // 时间复杂度：O(n)
    // 空间复杂度：O(n)
    class Solution {
        func removeDuplicates(_ s: String) -> String {
            var stack: [Character] = []
            for char in s {
                if !stack.isEmpty && stack.last == char {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            }
            return String(stack)
        }
    }
    
    class SolutionTrain {
        func removeDuplicates(_ s: String) -> String {
            var stack: [Character] = []
            for char in s {
                if !stack.isEmpty && stack.last! == char {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            }
            return String(stack)
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: ["abbaca"]) {
            SolutionTrain().removeDuplicates("abbaca")
        }
        #expect(ret == "ca")
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: ["azxxzy"]) {
            SolutionTrain().removeDuplicates("azxxzy")
        }
        #expect(ret == "ay")
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: ["aaaaaa"]) {
            SolutionTrain().removeDuplicates("aaaaaa")
        }
        #expect(ret == "")
    }
    
    @Test func testUnit3() {
        let ret = measureLogger(parameters: ["aaaaaaa"]) {
            Solution().removeDuplicates("aaaaaaa")
        }
        #expect(ret == "a")
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

