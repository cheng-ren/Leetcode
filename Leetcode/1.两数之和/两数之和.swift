//
//  两数之和.swift
//  LeetcodeTest
//
//  Created by 任成 on 2025/10/16.
//

import Testing

struct 两数之和 {
    
    /*
     # 🧮 Two Sum

     Given an array of integers `nums` and an integer `target`, return *indices of the two numbers such that they add up to* `target`.

     ```swift
     Input: nums = [2,7,11,15], target = 9
     Output: [0,1]
     ```
     */

    class Solution {
        
        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            var dict: [Int: Int] = [:]
            for (i, num) in nums.enumerated() {
                if let j = dict[target - num] {
                    return [j, i]
                }
                dict[num] = i
            }
            return []
        }
    }

    @Test func testUnit0() async throws {
        let ret = Solution().twoSum([2, 3, 4, 6], 5)
        logger(resolveName: String(describing: type(of: self)), parameters: [[2, 3, 4, 6], 5], ret: ret)
        #expect(ret == [0, 1])
    }
    
    @Test func testUnit1() async throws {
        let ret = Solution().twoSum([2, 3, 4, 7], 5)
        logger(resolveName: String(describing: type(of: self)), parameters: [[2, 3, 4, 7], 5], ret: ret)
        #expect(ret == [0, 1])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }

}


