//
//  无重复字符的最长子串.swift
//  Leetcode
//
//  Created by 任成 on 2025/7/15.
//

import Testing

@Suite(.serialized, .tags(.中等, .字符串))
struct 无重复字符的最长子串 {
    
    // MARK: - 哈希表
    // 时间复杂度：O(n)，每个字符最多被访问一次
    // 空间复杂度：O(min(m, n))，m 是字符集大小，n 是字符串长度
    class Solution0 {
        
        func lengthOfLongestSubstring(_ s: String) -> Int {
            var dict: [String.Element: Int] = [:]
            let strArr = Array(s)
            var delta = 0
            for (index, cha) in strArr.enumerated() {
                if let idx = dict[cha] {
                    delta = max(delta, index - idx)
                }
                dict[cha] = index
            }
            return delta
        }
        
    }
    
    // MARK: - 滑动窗口（优化版本）
    // 时间复杂度：O(n)，每个字符最多被访问一次
    // 空间复杂度：O(min(m, n))，m 是字符集大小，n 是字符串长度
    class Solution1 {
        
        func lengthOfLongestSubstring(_ s: String) -> Int {
            let strArr = Array(s)
            var startIndex = 0
            var maxLegth = 0
            var map:[Character: Int] = [:]
            for (index, str) in strArr.enumerated() {
                let preIndex = map[str] ?? -1
                if preIndex >= startIndex {
                    startIndex = preIndex + 1
                }
                
                let curLength = index - startIndex + 1
                maxLegth = max(curLength, maxLegth)
                map[str] = index
            }
            return maxLegth
        }
    }
    
    // MARK: - 滑动窗口
    // 时间复杂度：O(n)，每个字符最多被访问一次
    // 空间复杂度：O(min(m, n))，m 是字符集大小，n 是字符串长度
    class Solution {
        func lengthOfLongestSubstring(_ s: String) -> Int {
            var charSet = Set<Character>()
            let strArr = Array(s)
            var maxLength = 0
            var left = 0
            
            for (right, str) in strArr.enumerated() {
                while charSet.contains(str) {
                    charSet.remove(strArr[left])
                    left += 1
                }
                
                charSet.insert(str)
                maxLength = max(maxLength, right - left + 1)
            }
            return maxLength
        }
    }
    
    class SolutionTrain {
        func lengthOfLongestSubstring(_ s: String) -> Int {
            0
        }
    }
    
    @Test func testUnit0() async throws {
        let s = "abcadbcbb"
        let ret = measureLogger(parameters: [s]) {
            SolutionTrain().lengthOfLongestSubstring(s)
        }
        #expect(ret == 4)
    }
    
    @Test func testUnit1() async throws {
        let s = "abcabcbb"
        let ret = measureLogger(parameters: [s]) {
            SolutionTrain().lengthOfLongestSubstring(s)
        }
        #expect(ret == 3)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}

