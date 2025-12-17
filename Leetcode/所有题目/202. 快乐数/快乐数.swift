//
//  快乐数.swift
//  LeetcodeTest
//
//  Created by 任成 on 2025/10/25.
//

import Foundation
import Testing

//  输入：n = 19
//  输出：true
//  解释：
//  1² + 9² = 82
//  8² + 2² = 68
//  6² + 8² = 100
//  1² + 0² + 0² = 1

@Suite(.serialized, .tags(.简单, .哈希表, .快慢指针))
struct 快乐数 {
    
    // MARK: - 哈希表
    // 时间复杂度：O(log n)，数字的位数是 log n
    // 空间复杂度：O(log n)，需要存储循环中的数字
    class Solution {
        func isHappy(_ n: Int) -> Bool {
            
            func bitSquareSum(_ n: Int) -> Int {
                var cur = n
                var sum = 0
                while cur > 0 {
                    let sub = cur % 10
                    sum += (sub * sub)
                    cur = cur / 10
                }
                return sum
            }
            
            var set: Set<Int> = []
            var cur = n
            set.insert(n)
            while cur != 1 {
                let sum = bitSquareSum(cur)
                let (success, _) = set.insert(sum)
                cur = sum
                if !success {
                    return false
                }
            }
            
            return true
        }
    }
    
    // MARK: - 快慢指针
    // 时间复杂度：O(log n)，数字的位数是 log n
    // 空间复杂度：O(1)，只使用了常数级别的额外空间
    class Solution2 {
        
        func isHappy(_ n: Int) -> Bool {
            func bitSquareSum(_ n: Int) -> Int {
                var cur = n
                var sum = 0
                while cur > 0 {
                    let sub = cur % 10
                    sum += (sub * sub)
                    cur = cur / 10
                }
                return sum
            }
            
            var slow = n
            var fast = bitSquareSum(n)
            while fast != 1 && fast != slow {
                slow = bitSquareSum(slow)
                fast = bitSquareSum(bitSquareSum(fast))
            }
            return fast == 1
        }
    }
    
    class SolutionTrain {
        
        func isHappy(_ n: Int) -> Bool {
            false
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: [19]) {
            SolutionTrain().isHappy(19)
        }
        #expect(ret == true)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [2]) {
            SolutionTrain().isHappy(2)
        }
        #expect(ret == false)
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: [1]) {
            SolutionTrain().isHappy(1)
        }
        #expect(ret == true)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

