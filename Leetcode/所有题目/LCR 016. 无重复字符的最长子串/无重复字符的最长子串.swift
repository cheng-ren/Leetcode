//
//  无重复字符的最长子串.swift
//  Leetcode
//
//  Created by 任成 on 2025/7/15.
//

import Testing

@Suite(.tags(.字符串))
struct 无重复字符的最长子串 {
    // 设置一个map标识每个字符最新出现的位置
    // xd

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
    
    /// 方案一: Map 里面存某个字符上一个位置的下标
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
    
    /// 滑动窗口
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
    
    @Test func testUnit0() async throws {
        let s = "abcadbcbb"
        let ret = measureLogger(parameters: [s]) {
            Solution0().lengthOfLongestSubstring(s)
        }
        #expect(ret == 4)
    }
    
    @Test func testUnit1() async throws {
        let s = "abcabcbb"
        let ret = measureLogger(parameters: [s]) {
            Solution1().lengthOfLongestSubstring(s)
        }
        #expect(ret == 3)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}

