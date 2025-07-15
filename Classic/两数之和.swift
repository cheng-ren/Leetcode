//
//  两数之和.swift
//  Leetcode
//
//  Created by yiche on 2025/7/14.
//

import Foundation

/// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
 
class 两数之和: Common {
    
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
    
    override func test() -> Any {
        return Solution().twoSum([2, 3, 4, 6], 5)
    }
    
}
