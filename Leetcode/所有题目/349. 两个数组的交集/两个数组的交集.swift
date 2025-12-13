//
//  两个数组的交集.swift
//  LeetcodeTest
//
//  Created by rencheng on 2025/10/25.
//

import Foundation
import Testing

//  ```
//  输入：nums1 = [1,2,2,1], nums2 = [2,2]
//  输出：[2]
//  ```
@Suite(.serialized, .tags(.哈希表))
struct 两个数组的交集 {
    
    // MARK: - 哈希表
    // 时间复杂度：O(n + m)
    // 空间复杂度：O(n + m)
    class Solution {
        func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            let set1: Set<Int> = Set(nums1)
            let set2: Set<Int> = Set(nums2)
            let (smallSet, largeSet) = set1.count < set2.count ? (set1, set2) : (set2, set1)
            return smallSet.filter { largeSet.contains($0) }
        }
    }
    
    class SolutionTrain {
        func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            []
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: [[1,2,2,1], [2,2]]) {
            SolutionTrain().intersection([1,2,2,1], [2,2])
        }
        #expect(ret.sorted() == [2])
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [[4,9,5], [9,4,9,8,4]]) {
            SolutionTrain().intersection([4,9,5], [9,4,9,8,4])
        }
        #expect(ret.sorted() == [4,9])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}
