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
//  - 4 ，用加粗斜体标识，nums2 = [1,3,4,2]。不存在下一个更大元素，所以答案是 -1 。
//  - 1 ，用加粗斜体标识，nums2 = [1,3,4,2]。下一个更大元素是 3 。
//  - 2 ，用加粗斜体标识，nums2 = [1,3,4,2]。不存在下一个更大元素，所以答案是 -1 。
//  ```

@Suite(.tags(.栈))
struct 下一个更大元素I {
    
    class Solution {
        func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            var stack: [Int] = []
            
            for num in nums2 {
                stack.append(num)
            }
            
            for num in nums1 {
                
            }
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: [[4, 1, 2], [1, 3, 4, 2]]) {
            Solution().nextGreaterElement([4, 1, 2], [1, 3, 4, 2])
        }
        #expect(ret == [-1, 3, -1])
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [[2, 4], [1, 2, 3, 4]]) {
            Solution().nextGreaterElement([2, 4], [1, 2, 3, 4])
        }
        #expect(ret == [3, -1])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}
