//
//  无重复字符的最长子串.swift
//  Leetcode
//
//  Created by 任成 on 2025/7/15.
//

import Testing


struct 无重复字符的最长子串 {
    // 设置一个map标识每个字符最新出现的位置
    // xd
    
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
        let ret = Solution().lengthOfLongestSubstring(s)
        logger(resolveName: String(describing: type(of: self)), parameters: [s], ret: ret)
        #expect(ret == 3)
    }
    
    @Test func testUnit1() async throws {
        let s = "abcadbcbb"
        let ret = Solution1().lengthOfLongestSubstring(s)
        logger(resolveName: String(describing: type(of: self)), parameters: [s], ret: ret)
        #expect(ret == 3)
    }
    
    @Test
    func showProblem() async throws {
        showMarkdown(#filePath)
    }
}

