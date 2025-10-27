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
@Suite(.tags(.哈希表))
struct 两个数组的交集 {
    
    // MARK: - 哈希表
    class Solution1 {
        func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            let set1: Set<Int> = Set(nums1)
            let set2: Set<Int> = Set(nums2)
            let (smallSet, largeSet) = set1.count < set2.count ? (set1, set2) : (set2, set1)
            return smallSet.filter { largeSet.contains($0) }
        }
    }
    
    // MARK: - 哈希表 - 标准库
    class Solution {
        func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            return Array(Set(nums1).intersection(Set(nums2)))
        }
    }
    
    // MARK: - 双指针
    class Solution2 {
        func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
            // TODO: 待完成
            return []
        }
    }

    @Test func testUnit0() {
        let ret = measureLogger(parameters: [[1,2,2,1], [2,2]]) {
            Solution().intersection([1,2,2,1], [2,2])
        }
        #expect(ret.sorted() == [2])
    }
    
    @Test func testUnit1() {
        let ret = measureLogger(parameters: [[4,9,5], [9,4,9,8,4]]) {
            Solution().intersection([4,9,5], [9,4,9,8,4])
        }
        #expect(ret.sorted() == [4,9])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}
