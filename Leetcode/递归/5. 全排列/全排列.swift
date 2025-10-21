//
//  全排列.swift
//  LeetcodeTest
//
//  Created on 2025/10/20.
//

import Foundation
import Testing

@Suite(.tags(.递归))
struct 全排列 {
    
    /// 回溯（使用 visited 数组）
    class Solution0 {
        func permute(_ nums: [Int]) -> [[Int]] {
            // TODO: 实现回溯算法
            // 提示：
            // 1. 使用 visited 数组标记已使用的元素
            // 2. path 记录当前路径
            // 3. 当 path 长度等于 nums 长度时，加入结果
            var result: [[Int]] = []
            var path: [Int] = []
            var visited = [Bool](repeating: false, count: nums.count)


            backtrack(nums, &path, &visited, &result)
            return result
        }
        
        private func backtrack(_ nums: [Int], 
                              _ path: inout [Int], 
                              _ visited: inout [Bool], 
                              _ result: inout [[Int]]) {
            // TODO: 实现回溯递归函数
            // 1. 判断终止条件
            // 2. 遍历选择列表
            // 3. 做选择 -> 递归 -> 撤销选择

            if path.count == nums.count {
                result.append(path)
                return
            }

            for i in 0..<nums.count {
                if visited[i] { continue }
                visited[i] = true
            }

            path.removeLast()
//            visited[i] = false
        }
    }
    
    /// 回溯（通过 contains 判断）
    class Solution1 {
        func permute(_ nums: [Int]) -> [[Int]] {
            // TODO: 实现回溯算法
            // 提示：不使用 visited，直接用 path.contains 判断
            var result: [[Int]] = []
            var path: [Int] = []
            
            backtrack(nums, &path, &result)
            return result
        }
        
        private func backtrack(_ nums: [Int], 
                              _ path: inout [Int], 
                              _ result: inout [[Int]]) {
            // TODO: 实现回溯递归函数
        }
    }
    
    /// 回溯（交换法）
    class Solution2 {
        func permute(_ nums: [Int]) -> [[Int]] {
            // TODO: 实现交换法
            // 提示：通过交换元素位置来生成排列
            var result: [[Int]] = []
            var nums = nums
            
            backtrack(&nums, 0, &result)
            return result
        }
        
        private func backtrack(_ nums: inout [Int], 
                              _ start: Int, 
                              _ result: inout [[Int]]) {
            // TODO: 实现回溯递归函数
            // 从 start 位置开始，依次与后面的元素交换
        }
    }
    
    @Test func testUnit0() {
        let ret = measureLogger(parameters: [[1,2,3]]) {
            Solution0().permute([1, 2, 3])
        }
        #expect(ret.count == 6)
        #expect(ret.contains([1, 2, 3]))
        #expect(ret.contains([3, 2, 1]))
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [[0,1]]) {
            Solution1().permute([0, 1])
        }
        #expect(ret == [[0, 1], [1, 0]] || ret == [[1, 0], [0, 1]])
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: [[1]]) {
            Solution2().permute([1])
        }
        #expect(ret == [[1]])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}

/*
学习提示：

1. 回溯算法框架：
   backtrack(路径, 选择列表):
       if 满足结束条件:
           result.add(路径)
           return
       
       for 选择 in 选择列表:
           做选择
           backtrack(路径, 选择列表)
           撤销选择

2. 决策树（[1,2,3]）：
                    []
          /         |         \
        [1]        [2]        [3]
       /   \      /   \      /   \
    [1,2] [1,3] [2,1] [2,3] [3,1] [3,2]

3. 回溯的本质：
   - 做选择：向前试探
   - 递归：继续下一步
   - 撤销：回到上一步，尝试其他选择

4. 时间复杂度：O(n! * n)
   - n! 个排列
   - 每个排列需要 O(n) 构建

5. 关键点：
   - 状态管理：path（路径）、visited（已使用）
   - 终止条件：path 长度等于数组长度
   - 选择列表：未使用的元素
*/
