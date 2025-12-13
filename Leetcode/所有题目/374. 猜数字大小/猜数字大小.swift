//
//  猜数字大小.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/12/10.
//

import Foundation
import Testing

fileprivate var guessTarget = 0
fileprivate func resetGuessTarget(_ target: Int) {
    guessTarget = target
}
fileprivate func guess(_ num: Int) -> Int {
    if num > guessTarget { return -1 }
    if num < guessTarget { return 1 }
    return 0
}

@Suite(.tags(.二分查找))
struct 猜数字大小 {
    
    // MARK: - 二分查找
    // 时间复杂度：O(log n)
    // 空间复杂度：O(1)
    class Solution {
        
        func guessNumber(_ n: Int) -> Int {
            var l = 1, r = n
            while l <= r {
                let mid = l + (r - l) / 2
                if guess(mid) == 0 {
                    return mid
                } else if guess(mid) > 0 {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            return -1
        }
    }
    
    class SolutionTrain {
        
        func guessNumber(_ n: Int) -> Int {
            0
        }
    }
    
    @Test func testUnit0() {
        resetGuessTarget(6)
        let ret = measureLogger(parameters: [10, 6]) {
            SolutionTrain().guessNumber(10)
        }
        #expect(ret == 6)
    }
    
    @Test func testUnit1() {
        resetGuessTarget(1)
        let ret = measureLogger(parameters: [1, 1]) {
            SolutionTrain().guessNumber(1)
        }
        #expect(ret == 1)
    }
    
    @Test func testUnit2() {
        resetGuessTarget(1)
        let ret = measureLogger(parameters: [2, 1]) {
            SolutionTrain().guessNumber(2)
        }
        #expect(ret == 1)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}


