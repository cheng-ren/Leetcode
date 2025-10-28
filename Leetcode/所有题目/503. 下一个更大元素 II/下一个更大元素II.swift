//
//  下一个更大元素II.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/25.
//

import Foundation
import Testing

//  ```
//  输入: nums = [1,2,1]
//  输出: [2,-1,2]
//  解释: 第一个 1 的下一个更大的数是 2；
//  数字 2 找不到下一个更大的数；
//  第二个 1 的下一个最大的数需要循环搜索，结果也是 2。
//  ```

@Suite(.tags(.栈))
struct 下一个更大元素II {
    
    // MARK: - 单调栈
    // 循环数组的处理技巧：将数组长度翻倍，通过取模运算模拟循环
    // 时间复杂度：O(n)
    // 空间复杂度：O(n)
    class Solution {
        func nextGreaterElements(_ nums: [Int]) -> [Int] {
            var stack: [Int] = []
            var ret: [Int] = Array(repeating: -1, count: nums.count)
            for i in stride(from: nums.count * 2, through: 0, by: -1) {
                let num = nums[i % nums.count]
                while !stack.isEmpty && stack.last! <= num {
                    stack.removeLast()
                }
                ret[i % nums.count] = stack.isEmpty ? -1 : stack.last!
                stack.append(num)
            }
            return ret
        }
    }
    
    class SolutionTrain {
        func nextGreaterElements(_ nums: [Int]) -> [Int] {
            var stack: [Int] = []
            var result: [Int] = Array(repeating: -1, count: nums.count)
            for i in stride(from: nums.count * 2 - 1, through: 0, by: -1) {
                let num = nums[i % nums.count]
                while !stack.isEmpty && stack.last! <= num {
                    stack.removeLast()
                }
                result[i % nums.count] = stack.isEmpty ? -1 : stack.last!
                stack.append(num)
            }
            return result
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: [[1, 2, 1]]) {
            SolutionTrain().nextGreaterElements([1, 2, 1])
        }
        #expect(ret == [2, -1, 2])
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [[1, 2, 3, 4, 3]]) {
            SolutionTrain().nextGreaterElements([1, 2, 3, 4, 3])
        }
        #expect(ret == [2, 3, 4, -1, 4])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

