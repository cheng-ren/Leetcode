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
        // TODO: 没理解
        func subarraySum(_ nums: [Int], _ k: Int) -> Int {
            // 前缀和 + 哈希表解法
            var count = 0  // 结果计数
            
            var prefixSum = 0  // 当前前缀和
            // 哈希表：key是前缀和，value是该前缀和出现的次数
            var map: [Int: Int] = [0: 1]  // 初始化：前缀和0出现1次
            
            for num in nums {
                // 计算当前前缀和
                prefixSum += num
                
                // 查找是否存在前缀和 prefixSum - k
                // 如果存在，说明从那个位置到当前位置的子数组和为k
                if let times = map[prefixSum - k] {
                    count += times
                }
                
                // 更新当前前缀和出现的次数
                map[prefixSum, default: 0] += 1
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


