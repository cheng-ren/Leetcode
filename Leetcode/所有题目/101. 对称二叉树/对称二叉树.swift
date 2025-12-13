//
//  对称二叉树.swift
//  LeetcodeTest
//
//  Created by rencheng on 2025/12/01.
//

import Foundation
import Testing

@Suite(.serialized, .tags(.树))
struct 对称二叉树 {
    
    // MARK: - 递归
    // 时间复杂度：O(n)，每个节点最多被访问一次
    // 空间复杂度：O(n)，递归调用栈的深度为树的高度
    // 思路：递归判断左右子树是否对称
    class Solution {
        func isSymmetric(_ root: TreeNode?) -> Bool {
            return check(root?.left, root?.right)
        }
        
        func check(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
            if left == nil && right == nil {
                return true
            }
            if left == nil || right == nil {
                return false
            }
            return left?.val == right?.val && check(left?.left, right?.right) && check(right?.left, left?.right)
        }
    }
    
    class SolutionTrain {
        func isSymmetric(_ root: TreeNode?) -> Bool {
            false
        }
    }
    
    @Test func testUnit0() {
        let root = TreeNode.makeTree([1, 2, 2, 3, 4, 4, 3])
        let ret = measureLogger(parameters: [root]) {
            SolutionTrain().isSymmetric(root)
        }
        #expect(ret == true)
    }
    
    @Test func testUnit1() {
        let root = TreeNode.makeTree([1, 2, 2, nil, 3, nil, 3])
        let ret = measureLogger(parameters: [root]) {
            SolutionTrain().isSymmetric(root)
        }
        #expect(ret == false)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}


