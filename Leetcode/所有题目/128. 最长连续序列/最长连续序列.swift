//
//  最长连续序列.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/27.
//

import Foundation
import Testing

//  ```
//  输入：nums = [100,4,200,1,3,2]
//  输出：4
//  解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
//  ```

@Suite(.serialized, .tags(.哈希表))
struct 最长连续序列 {
    
    // MARK: - 哈希表
    // 时间复杂度：O(n)
    // 空间复杂度：O(n)
    class Solution {
        func longestConsecutive(_ nums: [Int]) -> Int {
            let set: Set<Int> = Set(nums)
            
            var maxLength = 0
            for num in nums {
                guard !set.contains(num - 1) else { continue }
                var count = 0
                var t = num
                while set.contains(t) {
                    t += 1
                    count += 1
                }
                maxLength = max(maxLength, count)
            }
            return maxLength
        }
    }
    
    class SolutionTrain {
        func longestConsecutive(_ nums: [Int]) -> Int {
            0
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: [[100, 4, 200, 1, 3, 2]]) {
            SolutionTrain().longestConsecutive([100, 4, 200, 1, 3, 2])
        }
        #expect(ret == 4)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [[0, 3, 7, 2, 5, 8, 4, 6, 0, 1]]) {
            SolutionTrain().longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1])
        }
        #expect(ret == 9)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

