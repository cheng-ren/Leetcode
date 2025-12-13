//
//  二叉树的后序遍历.swift
//  LeetcodeTest
//
//  Created on 2025/11/18.
//

import Foundation
import Testing

//  ```
//  输入：root = [1,null,2,3]
//  输出：[3,2,1]
//  ```

@Suite(.serialized, .tags(.树, .递归, .迭代))
struct 二叉树的后序遍历 {
    
    class Solution {
        func postorderTraversal(_ root: TreeNode?) -> [Int] {
            guard let root = root else { return [] }
            var result: [Int] = []
            result += postorderTraversal(root.left)
            result += postorderTraversal(root.right)
            result += [root.val]
            return result
        }
    }
    
    class Solution1 {
        func postorderTraversal(_ root: TreeNode?) -> [Int] {
            var result: [Int] = []
            postorderHelper(root, &result)
            return result
        }
        
        func postorderHelper(_ root: TreeNode?, _ result: inout [Int]) {
            guard let root = root else { return }
            postorderHelper(root.left, &result)
            postorderHelper(root.right, &result)
            result.append(root.val)
        }
    }
    
    // MARK: - 迭代方法一：双栈法（推荐 ⭐）
    /// 时间复杂度：O(n)，每个节点最多被访问一次
    /// 空间复杂度：O(n)，两个栈的大小为树的高度
    /// 实现思路：
    /// 1. 后序遍历顺序：左 -> 右 -> 根
    /// 2. 如果按照"根 -> 右 -> 左"的顺序遍历，然后反转结果，就得到"左 -> 右 -> 根"
    /// 3. 使用第一个栈进行遍历，第二个栈存储结果
    /// 4. 遍历时：先访问根节点，然后先入栈左子节点，再入栈右子节点
    ///    这样出栈时就是先右后左，符合"根->右->左"的顺序
    /// 5. 最后反转结果数组
    class Solution2 {
        func postorderTraversal(_ root: TreeNode?) -> [Int] {
            guard let root = root else { return [] }
            var stack: [TreeNode] = [root]
            var result: [Int] = []
            
            while !stack.isEmpty {
                let node = stack.removeLast()
                result.append(node.val)
                
                // 先入栈左子节点，再入栈右子节点
                // 这样出栈时就是先右后左，遍历顺序是"根->右->左"
                if let left = node.left {
                    stack.append(left)
                }
                if let right = node.right {
                    stack.append(right)
                }
            }
            
            // 反转结果，得到"左->右->根"的后序遍历
            return result.reversed()
        }
    }
    
    class SolutionTrain {
   
        func postorderTraversal(_ root: TreeNode?) -> [Int] {
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
            SolutionTrain().postorderTraversal(tree)
        }
        #expect(ret == [3, 2, 1])
    }
    
    @Test func testUnit1() {
        let parameters: [Int?] = []
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [parameters]) {
            SolutionTrain().postorderTraversal(tree)
        }
        #expect(ret == [])
    }
    
    @Test func testUnit2() {
        let parameters: [Int?] = [1]
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [parameters]) {
            SolutionTrain().postorderTraversal(tree)
        }
        #expect(ret == [1])
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}

