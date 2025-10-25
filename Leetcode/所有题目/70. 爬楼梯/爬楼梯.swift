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
    
    /// 基础递归
    class Solution0 {
        func climbStairs(_ n: Int) -> Int {
            if n == 1 { return 1 }
            if n == 2 { return 2 }
            
            return climbStairs(n - 1) + climbStairs(n - 2)
        }
    }
    
    /// 记忆化递归
    class Solution1 {
        func climbStairs(_ n: Int) -> Int {
            // TODO: 实现记忆化递归
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
    
    /// 动态规划
    class Solution2 {
        func climbStairs(_ n: Int) -> Int {
            // TODO: 实现动态规划
            // 提示：dp[i] 表示爬到第 i 阶的方法数
            return 0
        }
    }
    
    @Test func testUnit0() {
        let ret = measureLogger(parameters: [3]) {
            Solution0().climbStairs(3)
        }
        #expect(ret == 3)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [5]) {
            Solution1().climbStairs(5)
        }
        #expect(ret == 8)
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: [10]) {
            Solution2().climbStairs(10)
        }
        #expect(ret == 89)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}

/*
学习提示：

1. 问题分析：
   - 要到达第 n 阶，可以从第 n-1 阶爬1阶，或从第 n-2 阶爬2阶
   - 因此：f(n) = f(n-1) + f(n-2)

2. 与斐波那契的关系：
   - 本质上是斐波那契数列的变体
   - 只是初始值不同

3. 扩展思考：
   - 如果每次可以爬 1、2 或 3 阶，递推关系是什么？
   - f(n) = f(n-1) + f(n-2) + f(n-3)
*/
