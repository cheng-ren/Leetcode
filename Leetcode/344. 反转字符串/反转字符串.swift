//
//  字符串反转.swift
//  Leetcode
//
//  Created by yiche on 2025/7/14.
//

import Testing

struct 反转字符串 {
    
    class Solution1 {
        func reverseString(_ s: inout [Character]) {
            for i in 0..<(s.count / 2) {
                let t = s[i]
                s[i] = s[s.count-i-1]
                s[s.count-i-1] = t
            }
        }
    }
    
    class Solution {
        func reverseString(_ s: inout [Character]) {
            for i in 0..<(s.count / 2) {
                s.swapAt(i, s.count-i-1)
            }
        }
    }
    
    @Test func testUnit0() async throws {
        var s: [Character] = ["h","e","l","l","o"]
        Solution().reverseString(&s) // 预期 "olleh"
        logger(resolveName: String(describing: type(of: self)), parameters: [s], ret: s)
        #expect(s == ["o","l","l","e","h"])
    }
    
    @Test func testUnit1() async throws {
        var s: [Character] = ["h","e","l","l","o"]
        Solution1().reverseString(&s) // 预期 "olleh"
        logger(resolveName: String(describing: type(of: self)), parameters: [s], ret: s)
        #expect(s == ["o","l","l","e","h"])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}
