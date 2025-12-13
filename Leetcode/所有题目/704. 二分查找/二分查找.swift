//
//  二分查找.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/12/10.
//

import Foundation
import Testing

@Suite(.serialized, .tags(.数组, .二分查找))
struct 二分查找 {
    
    // MARK: - 二分查找
    // 时间复杂度：O(log n)
    // 空间复杂度：O(1)
    class Solution {
        
        func search(_ nums: [Int], _ target: Int) -> Int {
            var l = 0
            var r = nums.count - 1
            while l <= r {
                let mid = l + (r - l) / 2
                if nums[mid] == target {
                    return mid
                } else if nums[mid] < target {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
            return -1
        }
    }
    
    class SolutionTrain {
        
        func search(_ nums: [Int], _ target: Int) -> Int {
            -1
        }
    }
    
    @Test func testUnit0() {
        let ret = measureLogger(parameters: [[-1, 0, 3, 5, 9, 12], 9]) {
            SolutionTrain().search([-1, 0, 3, 5, 9, 12], 9)
        }
        #expect(ret == 4)
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [[-1, 0, 3, 5, 9, 12], 2]) {
            SolutionTrain().search([-1, 0, 3, 5, 9, 12], 2)
        }
        #expect(ret == -1)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}


