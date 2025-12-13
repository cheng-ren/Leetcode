//
//  x 的平方根.swift
//  LeetcodeTest
//
//  Created on 2025/01/27.
//

import Foundation
import Testing

//  ```
//  输入：x = 4
//  输出：2
//  ```

@Suite(.serialized, .tags(.二分查找))
struct x的平方根 {
    
    // MARK: - 二分查找
    // 时间复杂度：O(log n)
    // 空间复杂度：O(1)
    class Solution {
        func mySqrt(_ x: Int) -> Int {
            var l = 0
            var r = x
            var ans = 0
            while l <= r {
                let mid = l + (r - l) / 2
                if mid * mid <= x {
                    ans = mid
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            return ans
        }
    }
    
    class SolutionTrain {
        func mySqrt(_ x: Int) -> Int {
            0
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: [4]) {
            SolutionTrain().mySqrt(4)
        }
        #expect(ret == 2)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [8]) {
            SolutionTrain().mySqrt(8)
        }
        #expect(ret == 2)
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: [0]) {
            SolutionTrain().mySqrt(0)
        }
        #expect(ret == 0)
    }
    
    @Test func testUnit3() {
        let ret = measureLogger(parameters: [1]) {
            SolutionTrain().mySqrt(1)
        }
        #expect(ret == 1)
    }
    
    @Test func testUnit4() {
        let ret = measureLogger(parameters: [2147395599]) {
            SolutionTrain().mySqrt(2147395599)
        }
        #expect(ret == 46339)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

