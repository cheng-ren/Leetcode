//
//  爬楼梯.swift
//  LeetcodeTest
//
//  Created on 2025/10/20.
//

import Foundation
import Testing

@Suite(.tags(.递归))
struct 爬楼梯 {
    
    // MARK: - 递归
    // 时间复杂度：O(n)，每个节点最多被访问一次
    // 空间复杂度：O(n)，递归调用栈的深度为树的高度
    class Solution0 {
        func climbStairs(_ n: Int) -> Int {
            if n == 1 { return 1 }
            if n == 2 { return 2 }
            
            return climbStairs(n - 1) + climbStairs(n - 2)
        }
    }
    
    // MARK: - 记忆化递归
    // 时间复杂度：O(n)，每个节点最多被访问一次
    // 空间复杂度：O(n)，递归调用栈的深度为树的高度
    class Solution1 {
        func climbStairs(_ n: Int) -> Int {
            var memo: [Int: Int] = [:]
            return climbWithMemo(n, &memo)
        }
        
        private func climbWithMemo(_ n: Int, _ memo: inout [Int: Int]) -> Int {
            if n == 1 { return 1 }
            if n == 2 { return 2 }
            
            if let val = memo[n] {
                return val
            }
            
            let n1 = climbWithMemo(n - 1, &memo)
            let n2 = climbWithMemo(n - 2, &memo)
            
            memo[n-1] = n1
            memo[n-2] = n1
            
            return n1 + n2
        }
    }
    
    // MARK: - 动态规划
    // 时间复杂度：O(n)，每个节点最多被访问一次
    // 空间复杂度：O(1)，只使用了常数级别的额外空间
    class Solution3 {
        func climbStairs(_ n: Int) -> Int {
            var dp: [Int] = [0, 1, 2]
            for i in 3...n {
                dp.append(dp[i-1] + dp[i-2])
            }
            return dp[n]
        }
    }
    
    class SolutionTrain {
        func climbStairs(_ n: Int) -> Int {
            0
        }
    }
    
    @Test func testUnit0() {
        let ret = measureLogger(parameters: [3]) {
            SolutionTrain().climbStairs(3)
        }
        #expect(ret == 3)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [5]) {
            SolutionTrain().climbStairs(5)
        }
        #expect(ret == 8)
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: [10]) {
            SolutionTrain().climbStairs(10)
        }
        #expect(ret == 89)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
