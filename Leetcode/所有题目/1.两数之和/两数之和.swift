//
//  两数之和.swift
//  LeetcodeTest
//
//  Created by 任成 on 2025/10/16.
//

import Testing

@Suite(.serialized, .tags(.简单, .哈希表))
struct 两数之和 {
    
    // MARK: - 暴力解法
    // 时间复杂度：O(n²)，需要两层循环
    // 空间复杂度：O(1)，只使用了常数级别的额外空间
    class Solution0 {
    
        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            for i in 0..<nums.count {
                for j in i+1..<nums.count {
                    if nums[i] + nums[j] == target {
                        return [i, j]
                    }
                }
            }
            return []
        }
    }
    
    // MARK: - 哈希表
    // 时间复杂度：O(n)，每个元素最多被访问一次
    // 空间复杂度：O(n)，需要存储最多 n 个元素
    class Solution1 {
        
        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            var dict: [Int: Int] = [:]
            for (i, num) in nums.enumerated() {
                if let j = dict[target - num] {
                    return [j, i]
                }
                dict[num] = i
            }
            return []
        }
    }
    
    /// 自测 - 字典缓存
    class SolutionTrain {
        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            []
        }
    }

    @Test func testUnit0() async throws {
        let ret = measureLogger(parameters: [[2, 3, 4, 6], 5]) {
            SolutionTrain().twoSum([2, 3, 4, 6], 5)
        }
        #expect(ret == [0, 1])
    }
    
    @Test func testUnit2() async throws {
        let ret = measureLogger(parameters: [[2, 3, 4, 7], 6]) {
            SolutionTrain().twoSum([2, 3, 4, 7], 6)
        }
        #expect(ret == [0, 2])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }

}


