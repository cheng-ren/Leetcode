//
//  字符串反转.swift
//  Leetcode
//
//  Created by yiche on 2025/7/14.
//

import Testing

@Suite(.tags(.字符串))
struct 反转字符串 {
    
    // 交换0
    class Solution0 {
        func reverseString(_ s: inout [Character]) {
            for i in 0..<(s.count / 2) {
                let t = s[i]
                s[i] = s[s.count-i-1]
                s[s.count-i-1] = t
            }
        }
    }
    
    // 交换1
    class Solution1 {
        func reverseString(_ s: inout [Character]) {
            for i in 0..<(s.count / 2) {
                s.swapAt(i, s.count-i-1)
            }
        }
    }

    // 标准库反转
    class Solution2 {
        func reverseString(_ s: inout [Character]) {
            s.reverse()
        }
    }
    
    @Test func testUnit0() async throws {
        var s: [Character] = ["h","e","l","l","o"]
        let _ = measureLogger(parameters: [s]) {
            Solution0().reverseString(&s)
        }
        #expect(s == ["o","l","l","e","h"])
    }
    
    @Test func testUnit1() async throws {
        var s: [Character] = ["h","e","l","l","o"]
        let _ = measureLogger(parameters: [s]) {
            Solution1().reverseString(&s)
        }
        #expect(s == ["o","l","l","e","h"])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}
