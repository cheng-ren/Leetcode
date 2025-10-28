//
//  二叉树的最大深度.swift
//  LeetcodeTest
//
//  Created on 2025/10/20.
//

import Foundation
import Testing

@Suite(.tags(.递归, .树))
struct 二叉树的最大深度 {
    
    /// 递归（DFS）
    class Solution0 {
        func maxDepth(_ root: TreeNode?) -> Int {
            guard root != nil else { return 0 }
            return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
        }
    }
    
    /// 迭代（BFS 层序遍历）
    class Solution1 {
        func maxDepth(_ root: TreeNode?) -> Int {
            // 提示：使用队列，逐层遍历
            guard root != nil else { return 0 }
            var queue: [TreeNode] = []
            queue.append(root!)
            var depth = 0
            while !queue.isEmpty {
                // 记录当前层的节点数量
                let levelSize = queue.count
                // 遍历当前层的所有节点
                for _ in 0..<levelSize {
                    let node = queue.removeFirst()
                    if let left = node.left {
                        queue.append(left)
                    }
                    if let right = node.right {
                        queue.append(right)
                    }
                }
                // 处理完一层后，深度才加 1
                depth += 1
            }
            return depth
        }
    }
    
    /// 迭代（DFS 栈）
    class Solution2 {
        func maxDepth(_ root: TreeNode?) -> Int {
            // 提示：使用栈，记录节点和对应深度
            guard let root = root else { return 0 }
            var stack: [(TreeNode, Int)] = []
            stack.append((root, 1))
            var depth = 0
            while !stack.isEmpty {
                let (node, currentDepth) = stack.removeLast()
                depth = max(depth, currentDepth)
                
                if let left = node.left {
                    stack.append((left, currentDepth + 1))
                }
                if let right = node.right {
                    stack.append((right, currentDepth + 1))
                }
            }
            
            return depth
        }
    }
    
    @Test func testUnit0() {
        // [3,9,20,null,null,15,7]
        let parameters = [3, 9, 20, nil, nil, 15, 7]
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [tree]) {
            Solution0().maxDepth(tree)
        }
        #expect(ret == 3)
    }
    
    @Test func testUnit1() {
        let parameters = [3, 9, 20, nil, nil, 15, 7]
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [tree]) {
            Solution1().maxDepth(tree)
        }
        #expect(ret == 3)
    }
    
    @Test func testUnit2() {
        let parameters = [3, 9, 20, nil, nil, 15, 7]
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [tree]) {
            Solution2().maxDepth(tree)
        }
        #expect(ret == 3)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}
