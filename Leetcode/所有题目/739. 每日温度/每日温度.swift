//
//  每日温度.swift
//  LeetcodeTest
//
//  Created by 任成 on 2025/10/20.
//

import Foundation
import Testing

// 输入: temperatures = [73,74,75,71,69,72,76,73]
// 输出: [1,1,4,2,1,1,0,0]
@Suite(.serialized, .tags(.栈, .递归))
struct 每日温度 {
    
    // MARK: - 方案1：单调栈（最优解）
    // 时间复杂度：O(n)，每个元素最多入栈和出栈各一次
    // 空间复杂度：O(n)，栈的大小
    class Solution0 {
        func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
            let n = temperatures.count
            var result = Array(repeating: 0, count: n)
            var stack: [Int] = [] // 单调递减栈，存储索引
            
            for i in 0..<n {
                // 当前温度比栈顶索引对应的温度高，说明找到了答案
                while !stack.isEmpty && temperatures[i] > temperatures[stack.last!] {
                    let prevIndex = stack.removeLast()
                    result[prevIndex] = i - prevIndex
                }
                stack.append(i)
            }
            
            return result
        }
    }
    
    // MARK: - 方案3：递归（原始方案，不推荐）
    // 时间复杂度：O(n²)
    // 空间复杂度：O(n²)，递归栈 + 数组切片
    class Solution1 {
        func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
            guard !temperatures.isEmpty else { return [] }
            
            var targetIndex = 0
            for (idx, val) in temperatures.enumerated() {
                if idx == 0 { continue }
                if val > temperatures[0] {
                    targetIndex = idx
                    break
                }
            }
            
            return [targetIndex] + dailyTemperatures(Array(temperatures[1...]))
        }
    }
    
    // 输入: temperatures = [73,74,75,71,69,72,76,73]
    // 输出: [1,1,4,2,1,1,0,0]
    class SolutionTrain {
        func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
            []
        }
    }
    

    // MARK: 测试用例
    
    @Test func testUnit0() async throws {
        let temperatures = [73,74,75,71,69,72,76,73]
        let ret = measureLogger(parameters: [temperatures]) {
            SolutionTrain().dailyTemperatures(temperatures)
        }
        #expect(ret == [1,1,4,2,1,1,0,0])
    }
    
    @Test func testUnit1() async throws {
        let temperatures = [30,40,50,60]
        #expect(SolutionTrain().dailyTemperatures(temperatures) == [1,1,1,0])
    }
    
    @Test func testUnit2() async throws {
        let temperatures = [30,60,90]
        #expect(SolutionTrain().dailyTemperatures(temperatures) == [1,1,0])
    }
    
    // MARK: 展示问题描述
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
