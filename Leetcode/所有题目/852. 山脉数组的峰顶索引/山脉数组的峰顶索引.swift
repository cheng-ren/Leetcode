//
//  山脉数组的峰顶索引.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/25.
//

import Foundation
import Testing

//  ```
//  输入：arr = [0,1,0]
//  输出：1
//  ```

@Suite(.tags(.二分查找))
struct 山脉数组的峰顶索引 {
    
    class Solution {
        func peakIndexInMountainArray(_ arr: [Int]) -> Int {
            // TODO: 实现你的解决方案
            return 0
        }
    }
    
    class SolutionTrain {
        func peakIndexInMountainArray(_ arr: [Int]) -> Int {
            // TODO: 在这里实现你的练习代码
            return 0
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: [[0, 1, 0]]) {
            SolutionTrain().peakIndexInMountainArray([0, 1, 0])
        }
        #expect(ret == 1)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [[0, 2, 1, 0]]) {
            SolutionTrain().peakIndexInMountainArray([0, 2, 1, 0])
        }
        #expect(ret == 1)
    }
    
    @Test func testUnit2() {
        let ret = measureLogger(parameters: [[0, 10, 5, 2]]) {
            SolutionTrain().peakIndexInMountainArray([0, 10, 5, 2])
        }
        #expect(ret == 1)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

