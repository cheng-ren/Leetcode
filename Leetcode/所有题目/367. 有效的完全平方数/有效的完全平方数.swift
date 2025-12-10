//
//  有效的完全平方数.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/12/10.
//

import Foundation
import Testing

@Suite(.tags(.二分查找))
struct 有效的完全平方数 {
    
    // MARK: - 占位实现
    class Solution {
        func isPerfectSquare(_ num: Int) -> Bool {
            false
        }
    }
    
    class SolutionTrain {
        func isPerfectSquare(_ num: Int) -> Bool {
            var l = 0, r = num
            while l <= r {
                let mid = l + (r - l) / 2
                let square = mid * mid
                if square == num {
                    return true
                } else if square < num {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            return false
        }
    }
    
    @Test func testUnit0() {
        let ret = measureLogger(parameters: [16]) {
            SolutionTrain().isPerfectSquare(16)
        }
        #expect(ret == true)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [14]) {
            SolutionTrain().isPerfectSquare(14)
        }
        #expect(ret == false)
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: [1]) {
            SolutionTrain().isPerfectSquare(1)
        }
        #expect(ret == true)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}


