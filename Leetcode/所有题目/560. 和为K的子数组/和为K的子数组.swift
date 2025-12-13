//
//  和为K的子数组.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/29.
//

import Foundation
import Testing

//  ```
//  输入：nums = [1,1,1], k = 2
//  输出：2
//  ```

@Suite(.serialized, .tags(.哈希表))
struct 和为K的子数组 {
    
    // MARK: - 请在此处编写你的解决方案
    class Solution {
        func subarraySum(_ nums: [Int], _ k: Int) -> Int {
            // 在这里实现你的代码
            return 0
        }
    }
    
    class SolutionTrain {
        func subarraySum(_ nums: [Int], _ k: Int) -> Int {
            0
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: [[1, 1, 1], 2]) {
            SolutionTrain().subarraySum([1, 1, 1], 2)
        }
        #expect(ret == 2)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [[1, 2, 3], 3]) {
            SolutionTrain().subarraySum([1, 2, 3], 3)
        }
        #expect(ret == 2)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

