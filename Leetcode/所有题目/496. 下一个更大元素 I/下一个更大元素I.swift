//
//  下一个更大元素I.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/21.
//

import Foundation
import Testing

//  ```
//  输入：nums1 = [4,1,2], nums2 = [1,3,4,2].
//  输出：[-1,3,-1]
//  解释：nums1 中每个值的下一个更大元素如下所述：
//  - 4 ，nums2 = [1,3,4,2]。不存在下一个更大元素，所以答案是 -1 。
//  - 1 ，nums2 = [1,3,4,2]。下一个更大元素是 3 。
//  - 2 ，nums2 = [1,3,4,2]。不存在下一个更大元素，所以答案是 -1 。
//  | |
//  | |
//  | |
//  |_|
//  ```

@Suite(.tags(.栈))
struct 下一个更大元素I {
    
    // MARK: - 单调栈
    // 时间复杂度：O(n)
    // 空间复杂度：O(n)
    class Solution {
        func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            var stack: [Int] = [] // 存储最大值
            var map: [Int: Int] = [:]
            for i in stride(from: nums2.count - 1, through: 0, by: -1) {
                let num = nums2[i]
                // 将栈中所有小于当前数的元素弹出
                while !stack.isEmpty && stack.last! <= num {
                    stack.removeLast()
                }
                map[num] = stack.isEmpty ? -1 : stack.last!
                stack.append(num)

            }
            return nums1.map {
                map[$0] ?? -1
            }
            
        }
    }
    
    //  输入：nums1 = [4,1,2], nums2 = [1,3,4,2].
    //  输出：[-1,3,-1]
    //  解释：nums1 中每个值的下一个更大元素如下所述：
    //  - 4 ，nums2 = [1,3,4,2]。不存在下一个更大元素，所以答案是 -1 。
    //  - 1 ，nums2 = [1,3,4,2]。下一个更大元素是 3 。
    //  - 2 ，nums2 = [1,3,4,2]。不存在下一个更大元素，所以答案是 -1 。
    class SolutionTrain {
        func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            []
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: [[4, 1, 2], [1, 3, 4, 2]]) {
            SolutionTrain().nextGreaterElement([4, 1, 2], [1, 3, 4, 2])
        }
        #expect(ret == [-1, 3, -1])
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [[2, 4], [1, 2, 3, 4]]) {
            SolutionTrain().nextGreaterElement([2, 4], [1, 2, 3, 4])
        }
        #expect(ret == [3, -1])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}
