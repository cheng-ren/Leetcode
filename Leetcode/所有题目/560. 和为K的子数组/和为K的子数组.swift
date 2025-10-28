//
//  和为K的子数组.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/27.
//

import Foundation
import Testing

//  ```
//  输入：nums = [1,1,1], k = 2
//  输出：2
//  输入：nums = [1,2,3], k = 3
//  输出：2
//  ```

@Suite(.tags(.哈希表))
struct 和为K的子数组 {
    
    class SolutionTrain {
        func subarraySum(_ nums: [Int], _ k: Int) -> Int {
            var i = 0
            var j = 1
            
            var count = 0
            while j < nums.count {
                let left = nums[i]
                let right = nums[j]
                if left + right == k {
                    count += 1
                }
                
                i += 1
                j += 1
            }
            return count
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


