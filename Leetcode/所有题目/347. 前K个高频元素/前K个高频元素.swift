//
//  前K个高频元素.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/27.
//

import Foundation
import Testing

//  ```
//  输入: nums = [1,1,1,2,2,3], k = 2
//  输出: [1,2]
//  ```

@Suite(.tags(.哈希表))
struct 前K个高频元素 {
    
    // MARK: - 方法1：哈希表 + 桶排序（最优解）
    // 时间复杂度：O(n)
    // 空间复杂度：O(n)
    class Solution {
        func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
            // 1. 统计频率
            var freqMap: [Int: Int] = [:]
            for num in nums {
                freqMap[num, default: 0] += 1
            }
            
            // 2. 桶排序：频率作为索引，值是该频率的数字列表
            // 最大频率不会超过数组长度
            var buckets: [[Int]] = Array(repeating: [], count: nums.count + 1)
            for (num, freq) in freqMap {
                buckets[freq].append(num)
            }
            
            // 3. 从高频率到低频率收集结果
            var result: [Int] = []
            for i in stride(from: buckets.count - 1, through: 0, by: -1) {
                if !buckets[i].isEmpty {
                    result.append(contentsOf: buckets[i])
                    if result.count >= k {
                        return Array(result.prefix(k))
                    }
                }
            }
            
            return result
        }
    }
    
    class SolutionTrain {
        func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
            var map: [Int: Int] = [:]
            for num in nums {
                map[num, default: 0] += 1
            }
            
            var buckets: [[Int]] = Array(repeating: [], count: nums.count + 1)
            for (num, freq) in map {
                buckets[freq].append(num)
            }
            
            var result: [Int] = []
            for i in stride(from: nums.count, through: 0, by: -1) {
                guard result.count < k else { break }
                if !buckets[i].isEmpty {
                    result.append(contentsOf: buckets[i])
                    if result.count > k {
                        result = Array(result.prefix(k))
                    }
                }
            }
            
            return result
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: [[1, 1, 1, 2, 2, 3], 2]) {
            SolutionTrain().topKFrequent([1, 1, 1, 2, 2, 3], 2)
        }
        #expect(Set(ret) == Set([1, 2]))
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [[1], 1]) {
            SolutionTrain().topKFrequent([1], 1)
        }
        #expect(ret == [1])
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: [[4, 1, -1, 2, -1, 2, 3], 2]) {
            SolutionTrain().topKFrequent([4, 1, -1, 2, -1, 2, 3], 2)
        }
        #expect(Set(ret) == Set([-1, 2]))
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}
