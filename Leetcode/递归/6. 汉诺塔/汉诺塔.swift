//
//  汉诺塔.swift
//  LeetcodeTest
//
//  Created on 2025/10/20.
//

import Foundation
import Testing

@Suite(.tags(.递归))
struct 汉诺塔 {
    
    /// 基础递归实现
    class Solution0 {
        var moveCount = 0
        
        func hanoi(_ n: Int, from: String = "A", to: String = "C", aux: String = "B") -> Int {
            // TODO: 实现汉诺塔递归
            // 提示：
            // 1. 终止条件：n == 1 时，直接移动
            // 2. 把 n-1 个盘子从 from 移到 aux（借助 to）
            // 3. 把第 n 个盘子从 from 移到 to
            // 4. 把 n-1 个盘子从 aux 移到 to（借助 from）
            moveCount = 0
            hanoiRecursive(n, from: from, to: to, aux: aux)
            return moveCount
        }
        
        private func hanoiRecursive(_ n: Int, from: String, to: String, aux: String) {
            // TODO: 实现递归函数
        }
    }
    
    /// 带可视化的递归
    class Solution1 {
        func hanoi(_ n: Int) -> Int {
            var towers: [String: [Int]] = [
                "A": Array((1...n).reversed()),
                "B": [],
                "C": []
            ]
            
            var stepCount = 0
            hanoiVisual(n, from: "A", to: "C", aux: "B", 
                       towers: &towers, stepCount: &stepCount)
            return stepCount
        }
        
        private func hanoiVisual(_ n: Int, 
                                from: String, 
                                to: String, 
                                aux: String,
                                towers: inout [String: [Int]],
                                stepCount: inout Int) {
            // TODO: 实现可视化递归
            // 在移动盘子时更新 towers 状态
        }
    }
    
    @Test func testUnit0() {
        let ret = measureLogger(parameters: [3]) {
            Solution0().hanoi(3)
        }
        // n=3 时需要 2^3-1 = 7 步
        #expect(ret == 7)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [4]) {
            Solution0().hanoi(4)
        }
        // n=4 时需要 2^4-1 = 15 步
        #expect(ret == 15)
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: [5]) {
            Solution1().hanoi(5)
        }
        // n=5 时需要 2^5-1 = 31 步
        #expect(ret == 31)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}

/*
学习提示：

1. 汉诺塔递归三步骤：
   移动 n 个盘子从 A 到 C（借助 B）：
   a) 把 n-1 个盘子从 A 移到 B（借助 C）
   b) 把第 n 个盘子从 A 移到 C
   c) 把 n-1 个盘子从 B 移到 C（借助 A）

2. 递归的魔力：
   - 不要纠结每一步细节
   - 相信递归会正确处理 n-1 个盘子的移动
   - 注意三根柱子角色的变化

3. 时间复杂度：
   T(n) = 2*T(n-1) + 1 = 2^n - 1
   这是指数级增长！

4. 最少移动次数：
   n=1: 1 步
   n=2: 3 步
   n=3: 7 步
   n=4: 15 步
   n=5: 31 步
   n个盘子：2^n - 1 步

5. 经典故事：
   传说印度寺庙有64个金盘，僧侣要全部移动完。
   如果每秒移动一次，需要约 5850 亿年！

6. 关键点：
   - 参数变化：注意起点、终点、辅助柱的角色互换
   - 递归终止：n == 1 时直接移动
   - 递推关系：T(n) = 2*T(n-1) + 1
*/
