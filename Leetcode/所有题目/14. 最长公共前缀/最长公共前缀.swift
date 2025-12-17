//
//  最长公共前缀.swift
//  Leetcode
//
//  Created by yiche on 2025/7/14.
//

import Foundation
import Testing

@Suite(.serialized, .tags(.简单, .字符串))
class 最长公共前缀 {
    // MARK: - 逐字符比较
    // 时间复杂度：O(m × n)，m 是字符串平均长度，n 是字符串数量
    // 空间复杂度：O(1)，只使用了常数级别的额外空间
    class Solution {
        /// 自己写的
        func longestCommonPrefix(_ strs: [String]) -> String {
            guard strs.count > 0 else { return "" }
            guard strs.count > 1 else { return strs[0] }
            guard let first = strs.first, first.count > 0 else { return "" }
            for i in 0..<first.count {
                let subString = first.prefix(i+1)
                let pub = strs.filter { $0.hasPrefix(subString) }
                if pub.count != strs.count {
                    return String(first.prefix(i))
                }
            }
            return first
        }
    }
    
    // MARK: - 利用标准库方法
    // 时间复杂度：O(m × n)，m 是字符串平均长度，n 是字符串数量
    // 空间复杂度：O(1)，只使用了常数级别的额外空间
    class Solution1 {
        func longestCommonPrefix(_ strs: [String]) -> String {
            guard let first = strs.min(), let last = strs.max() else { return "" }
            return first.commonPrefix(with: last, options: .literal)
        }
    }
    
    class SolutionTrain {
        func longestCommonPrefix(_ strs: [String]) -> String {
            ""
        }
    }
    
    @Test func testUnit0() {
        let strs = ["flower","flow","flight"]
//        let strs = ["ab", "a"]
//        let strs = ["a", "ab"]
        let ret = measureLogger(parameters: [strs]) {
            SolutionTrain().longestCommonPrefix(strs)
        }
        #expect(ret == "fl")
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}
