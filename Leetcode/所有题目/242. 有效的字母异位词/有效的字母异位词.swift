//
//  有效的字母异位词.swift
//  LeetcodeTest
//
//  Created by rencheng on 2025/10/26.
//

import Foundation
import Testing

//  ```
//  输入: s = "anagram", t = "nagaram"
//  输出: true
//  ```

@Suite(.serialized, .tags(.字符串, .哈希表))
struct 有效的字母异位词 {
    
    // MARK: - TODO: 实现你的解决方案
    class Solution {
        func isAnagram(_ s: String, _ t: String) -> Bool {
            guard s.count == t.count else { return false }
            
            var map: [Character: Int] = [:]
        
            for char in s {
                var count = map[char] ?? 0
                count += 1
                map[char] = count
            }
            
            for char in t {
                let count = map[char] ?? 0
                if count == 0 { return false }
                if count == 1 {
                    map.removeValue(forKey: char)
                } else {
                    map[char] = count - 1
                }
            }
            return map.isEmpty
        }
    }
    
    
    class SolutionTrain {
        func isAnagram(_ s: String, _ t: String) -> Bool {
            false
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: ["anagram", "nagaram"]) {
            SolutionTrain().isAnagram("anagram", "nagaram")
        }
        #expect(ret == true)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: ["rat", "car"]) {
            SolutionTrain().isAnagram("rat", "car")
        }
        #expect(ret == false)
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: ["ab", "a"]) {
            Solution().isAnagram("ab", "a")
        }
        #expect(ret == false)
    }
    
    @Test func testUnit3() {
        let ret = measureLogger(parameters: ["aa", "a"]) {
            Solution().isAnagram("aa", "a")
        }
        #expect(ret == false)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

