//
//  最长公共前缀.swift
//  Leetcode
//
//  Created by yiche on 2025/7/14.
//

import Foundation

class 最长公共前缀: Common {
    
    class Solution1 {
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
    
    /// 利用标准库方法
    class Solution {
        func longestCommonPrefix(_ strs: [String]) -> String {
            guard let first = strs.min(), let last = strs.max() else { return "" }
            return first.commonPrefix(with: last, options: .literal)
        }
    }
    
    override func test() -> Any {
        let strs = ["flower","flow","flight"]
//        let strs = ["ab", "a"]
//        let strs = ["a", "ab"]
        return Solution().longestCommonPrefix(strs) // 预期 "fl"
    }
    
}
