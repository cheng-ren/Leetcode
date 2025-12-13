//
//  斐波那契数列.swift
//  LeetcodeTest
//
//  Created on 2025/10/20.
//

import Foundation
import Testing

@Suite(.serialized, .tags(.递归))
struct 斐波那契数列 {
    
    /// 基础递归（效率低，有大量重复计算）
    class Solution0 {
        func fib(_ n: Int) -> Int {
            guard n > 2 else { return 1 }
            return fib(n - 1) + fib(n - 2)
        }
    }
    
    /// 记忆化递归（推荐）
    class Solution1 {
        func fib(_ n: Int) -> Int {
            var memo: [Int: Int] = [:]
            return fibMemo(n, &memo)
        }
        
        private func fibMemo(_ n: Int, _ memo: inout [Int: Int]) -> Int {
            guard n > 2 else { return 1}
            if let val = memo[n] {
                return val
            }
            let n1 = fibMemo(n - 1, &memo)
            let n2 = fibMemo(n - 2, &memo)
            memo[n-1] = n1
            memo[n-2] = n2
            
            return n1 + n2
        }
    }
    
    /// 动态规划（迭代）
    class Solution2 {
        func fib(_ n: Int) -> Int {
            // TODO: 实现动态规划
            // 提示：从 F(0) 和 F(1) 开始迭代
            return 0
        }
    }
    
    @Test func testUnit0() {
        let ret = measureLogger(parameters: [5]) {
            Solution0().fib(5)
        }
        #expect(ret == 5)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [10]) {
            Solution1().fib(10)
        }
        #expect(ret == 55)
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: [15]) {
            Solution2().fib(15)
        }
        #expect(ret == 610)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}

/*
学习提示：

1. 递归三要素：
   - 递归终止条件（base case）
   - 递归调用
   - 返回值

2. 斐波那契数列定义：
   F(0) = 0, F(1) = 1
   F(n) = F(n-1) + F(n-2) (n >= 2)

3. 优化思路：
   - 基础递归有大量重复计算
   - 记忆化可以避免重复计算
   - 动态规划从底向上迭代

4. 时间复杂度：
   - 基础递归：O(2^n)
   - 记忆化递归：O(n)
   - 动态规划：O(n)
*/
