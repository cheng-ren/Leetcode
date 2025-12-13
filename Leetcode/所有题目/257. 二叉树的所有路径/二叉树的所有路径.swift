//
//  二叉树的所有路径.swift
//  LeetcodeTest
//
//  Created on 2025/12/01.
//

import Foundation
import Testing

//  ```
//  输入：root = [1,2,3,nil,5]
//  输出：["1->2->5","1->3"]
//  ```

@Suite(.serialized, .tags(.树, .递归))
struct 二叉树的所有路径 {
    
    // MARK: - 递归
    // 时间复杂度：O(n)，每个节点最多被访问一次
    // 空间复杂度：O(n)，递归调用栈的深度为树的高度
    class Solution {
        func binaryTreePaths(_ root: TreeNode?) -> [String] {
            var result: [String] = []
            binaryTreePathsHelper(root, "", &result)
            return result
        }
        
        func binaryTreePathsHelper(_ root: TreeNode?, _ curPath: String, _ result: inout [String]) {
            guard let root = root else { return }
            var mPath = curPath
            mPath += "\(root.val)"
            if root.left == nil && root.right == nil {
                result.append(mPath)
            } else {
                mPath += "->"
                binaryTreePathsHelper(root.left, mPath, &result)
                binaryTreePathsHelper(root.right, mPath, &result)
            }
        }
    }
    
    class SolutionTrain {
        func binaryTreePaths(_ root: TreeNode?) -> [String] {
            
            return []
        }
    }
    
    @Test func testUnit0() {
        //     1
        //    / \
        //   2   3
        //    \
        //     5
        let parameters: [Int?] = [1, 2, 3, nil, 5]
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [tree]) {
            SolutionTrain().binaryTreePaths(tree)
        }
        #expect(Set(ret) == Set(["1->2->5", "1->3"]))
    }
    
    @Test func testUnit1() {
        let parameters: [Int?] = []
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [tree]) {
            SolutionTrain().binaryTreePaths(tree)
        }
        #expect(ret == [])
    }
    
    @Test func testUnit2() {
        let parameters: [Int?] = [1]
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [tree]) {
            SolutionTrain().binaryTreePaths(tree)
        }
        #expect(ret == ["1"])
    }
    
    @Test func testUnit3() {
        //     1
        //    /
        //   2
        let parameters: [Int?] = [1, 2]
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [tree]) {
            SolutionTrain().binaryTreePaths(tree)
        }
        #expect(ret == ["1->2"])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}


