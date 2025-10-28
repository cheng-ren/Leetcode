//
//  字母异位词分组.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/27.
//

import Foundation
import Testing

//  ```
//  输入: strs = ["eat","tea","tan","ate","nat","bat"]
//  输出: [["bat"],["nat","tan"],["ate","eat","tea"]]
//  ```

@Suite(.tags(.哈希表))
struct 字母异位词分组 {
    
    // MARK: - 方法1：排序法
    // 时间复杂度：O(n × k log k)，n是字符串数量，k是字符串最大长度
    // 空间复杂度：O(n × k)
    class Solution {
        func groupAnagrams(_ strs: [String]) -> [[String]] {
            var map: [String: [String]] = [:]
            for str in strs {
                let sortedStr = String(str.sorted())
                map[sortedStr, default: []].append(str)
            }
            return Array(map.values)  // 去掉了不必要的强制转换
        }
    }
    
    // MARK: - 方法2：字符计数法（优化版）
    // 时间复杂度：O(n × k)，避免了排序的 log k
    // 空间复杂度：O(n × k)
    class Solution2 {
        func groupAnagrams(_ strs: [String]) -> [[String]] {
            var map: [String: [String]] = [:]
            for str in strs {
                // 使用字符计数作为 key
                var count = Array(repeating: 0, count: 26)
                for char in str {
                    let index = Int(char.asciiValue! - Character("a").asciiValue!)
                    count[index] += 1
                }
                // 将计数数组转换为字符串作为 key
                let key = count.map { String($0) }.joined(separator: ",")
                map[key, default: []].append(str)
            }
            return Array(map.values)
        }
    }
    
    class SolutionTrain {
        func groupAnagrams(_ strs: [String]) -> [[String]] {
            var map: [String: [String]] = [:]
            for str in strs {
                let strBySorted = String(str.sorted())
                map[strBySorted, default: []].append(str)
            }
            return Array(map.values)
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: [["eat","tea","tan","ate","nat","bat"]]) {
            SolutionTrain().groupAnagrams(["eat","tea","tan","ate","nat","bat"])
        }
        // 注意：输出顺序可能不同
        #expect(ret.count == 3)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [[""]]) {
            SolutionTrain().groupAnagrams([""])
        }
        #expect(ret == [[""]])
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: [["a"]]) {
            SolutionTrain().groupAnagrams(["a"])
        }
        #expect(ret == [["a"]])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}


