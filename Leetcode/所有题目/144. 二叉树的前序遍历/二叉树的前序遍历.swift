//
//  二叉树的前序遍历.swift
//  LeetcodeTest
//
//  Created on 2025/11/18.
//

import Foundation
import Testing

//  ```
//  输入：root = [1,null,2,3]
//  输出：[1,2,3]
//  ```

@Suite(.serialized, .tags(.树, .递归, .迭代))
struct 二叉树的前序遍历 {
    
    // MARK: - 递归（原始版本 - 性能较差）
    /// 时间复杂度：O(n²)，因为数组拼接操作 ret += 会导致多次数组复制
    /// 空间复杂度：O(n)，递归调用栈的深度为树的高度
    /// 性能问题：每次 ret += 都会创建新数组，导致时间复杂度退化
    class Solution0 {
        func preorderTraversal(_ root: TreeNode?) -> [Int] {
            guard let root = root else { return [] }
            var result: [Int] = [root.val]
            result += preorderTraversal(root.left)
            result += preorderTraversal(root.right)
            return result
        }
    }
    
    // MARK: - 递归（优化版本 - 推荐 ⭐）
    /// 时间复杂度：O(n)，每个节点最多被访问一次
    /// 空间复杂度：O(n)，递归调用栈的深度为树的高度
    /// 性能优势：实测比迭代版本快 3 倍
    /// 优化点：
    /// 1. 使用 inout 参数避免数组复制
    /// 2. 直接访问节点，引用计数操作最少
    /// 3. 编译器可以更好地优化递归调用（内联、尾递归等）
    /// 4. 内存访问模式更线性，CPU 缓存友好
    class Solution1 {
        func preorderTraversal(_ root: TreeNode?) -> [Int] {
            var result: [Int] = []
            preorderHelper(root, &result)
            return result
        }
        
        func preorderHelper(_ root: TreeNode?, _ result: inout [Int]) {
            guard let root = root else { return }
            result.append(root.val)
            preorderHelper(root.left, &result)
            preorderHelper(root.right, &result)
        }
    }
    
    // MARK: - 迭代
    /// 时间复杂度：O(n)，每个节点最多被访问一次
    /// 空间复杂度：O(n)，栈的大小为树的高度
    /// 实现思路：
    /// 1. 使用栈模拟递归过程
    /// 2. 前序遍历顺序：根 -> 左 -> 右
    /// 3. 由于栈是后进先出，需要先将右子节点入栈，再将左子节点入栈
    ///    这样出栈时就是先左后右，符合前序遍历要求
    /// 4. 每次从栈中弹出节点时，立即访问该节点（根节点）
    class Solution2 {
        func preorderTraversal(_ root: TreeNode?) -> [Int] {
            guard let root = root else { return [] }
            var stack: [TreeNode] = [root]
            var result: [Int] = []
            
            while !stack.isEmpty {
                let node = stack.removeLast()
                result.append(node.val)
                
                // 先入栈右子节点，再入栈左子节点
                // 这样出栈时就是先左后右
                if let right = node.right {
                    stack.append(right)
                }
                if let left = node.left {
                    stack.append(left)
                }
            }
            
            return result
        }
    }
    
    class SolutionTrain {
        func preorderTraversal(_ root: TreeNode?) -> [Int] {
            []
        }
    }
    
    @Test func testUnit0() {
        //     1
        //      \
        //       2
        //      /
        //     3
        let parameters: [Int?] = [1, nil, 2, 3]
        let tree = TreeNode.makeTree(parameters)
        print(tree!)
        let ret = measureLogger(parameters: [parameters]) {
            SolutionTrain().preorderTraversal(tree)
        }
        #expect(ret == [1, 2, 3])
    }
    
    @Test func testUnit1() {
        let parameters: [Int?] = []
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [parameters]) {
            SolutionTrain().preorderTraversal(tree)
        }
        #expect(ret == [])
    }
    
    @Test func testUnit2() {
        let parameters: [Int?] = [1]
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [parameters]) {
            SolutionTrain().preorderTraversal(tree)
        }
        #expect(ret == [1])
    }
    
    @Test func testUnit3() {
        let parameters: [Int?] = [1, 2]
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [parameters]) {
            SolutionTrain().preorderTraversal(tree)
        }
        #expect(ret == [1, 2])
    }
    
    @Test func testUnit4() {
        let parameters: [Int?] = [1, nil, 2]
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [parameters]) {
            SolutionTrain().preorderTraversal(tree)
        }
        #expect(ret == [1, 2])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

