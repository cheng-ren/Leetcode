//
//  二叉树的最近公共祖先.swift
//  LeetcodeTest
//
//  Created by 任成 on 2025/10/19.
//

import Foundation
import Testing

@Suite(.tags(.树))
struct 二叉树的最近公共祖先 {
    
    /// 存储父节点
    class Solution0 {
        func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            var parant: [TreeNode: TreeNode] = [:]
            // 递归遍历
            func travel(root: TreeNode?) {
                guard root != nil else { return }
                if let lNode = root?.left {
                    parant[lNode] = root
                }
                if let rNode = root?.right {
                    parant[rNode] = root
                }
                travel(root: root?.left)
                travel(root: root?.right)
            }
            travel(root: root)
            
            // 双指针
            var cP = p
            var cQ = q
            
            while cP != cQ {
                cP = cP == nil ? p : parant[cP!]
                cQ = cQ == nil ? q : parant[cQ!]
            }
            
            return cQ
        }
    }
    
    /// 递归
    class Solution1 {
        func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            // 递归终止条件
            // 1. 遇到空节点，返回 nil
            // 2. 遇到 p 或 q，返回当前节点
            guard let root = root else { return nil }
            if root === p || root === q {
                return root
            }
            
            // 递归查找左右子树
            let left = lowestCommonAncestor(root.left, p, q)
            let right = lowestCommonAncestor(root.right, p, q)
            
            // 根据左右子树的返回值判断
            if left != nil && right != nil {
                // 左右都找到了，说明 p 和 q 分别在左右子树
                // 当前节点就是最近公共祖先
                return root
            }
            
            // 只有一边找到，返回找到的那一边
            // 如果都没找到，返回 nil
            return left != nil ? left : right
        }
    }
    
    @Test func testUnit0() {
        let node3 = TreeNode(3)
        let node5 = TreeNode(5)
        let node1 = TreeNode(1)
        let node6 = TreeNode(6)
        let node2 = TreeNode(2)
        let node0 = TreeNode(0)
        let node8 = TreeNode(8)
        let node7 = TreeNode(7)
        let node4 = TreeNode(4)

        node3.left = node5
        node3.right = node1
        node5.left = node6
        node5.right = node2
        node1.left = node0
        node1.right = node8
        node2.left = node7
        node2.right = node4

        let root = node3
        
        print(root)

        let ret = measureLogger(parameters: [root]) {
            Solution0().lowestCommonAncestor(root, node0, node8)
        }
        #expect(ret?.val == 1)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
 
