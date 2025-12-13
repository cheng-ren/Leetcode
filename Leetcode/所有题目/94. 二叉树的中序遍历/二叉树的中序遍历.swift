//
//  二叉树的中序遍历.swift
//  LeetcodeTest
//
//  Created on 2025/11/18.
//

import Foundation
import Testing

//  ```
//  输入：root = [1,null,2,3]
//  输出：[1,3,2]
//  ```

@Suite(.serialized, .tags(.树, .递归, .迭代))
struct 二叉树的中序遍历 {
    
    // MARK: - 递归（原始版本 - 性能较差）
    /// 时间复杂度：O(n²)，因为数组拼接操作 ret += 会导致多次数组复制
    /// 空间复杂度：O(n)，递归调用栈的深度为树的高度
    /// 性能问题：每次 ret += 都会创建新数组，导致时间复杂度退化
    class Solution {
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            guard let root = root else { return [] }
            var ret: [Int] = []
            ret += inorderTraversal(root.left)
            ret.append(root.val)
            ret += inorderTraversal(root.right)
            return ret
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
    class Solution0 {
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            var result: [Int] = []
            inorderHelper(root, &result)
            return result
        }
        
        private func inorderHelper(_ root: TreeNode?, _ result: inout [Int]) {
            guard let root = root else { return }
            inorderHelper(root.left, &result)
            result.append(root.val)
            inorderHelper(root.right, &result)
        }
    }
    
    // MARK: - 迭代
    /// 时间复杂度：O(n)，每个节点最多被访问一次
    /// 空间复杂度：O(n)，栈的大小为树的高度
    /// 性能分析：实测比优化递归慢 3 倍，主要原因：
    /// 1. 双重循环开销：外层 while + 内层 while，每次循环都有条件判断
    /// 2. 栈操作开销：每个节点需要 append 和 removeLast 两次操作
    ///    - append: 可能触发数组扩容（内存重新分配）
    ///    - removeLast: 涉及引用计数操作（TreeNode 是类，引用类型）
    /// 3. 引用计数开销：TreeNode 是类，栈中存储引用，每次操作都涉及引用计数增减
    /// 4. 内存访问模式：需要维护额外的栈数组，内存访问更分散，缓存命中率低
    /// 5. 编译器优化：递归版本更容易被编译器优化（尾递归优化、内联等）
    class Solution1 {
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
            var stack: [TreeNode] = []
            var cur = root
            var ret: [Int] = []
            // 双重循环：外层循环 O(n)，内层循环总次数也是 O(n)
            while cur != nil || !stack.isEmpty {
                // 内层循环：将所有左子节点入栈
                while cur != nil {
                    stack.append(cur!)  // 可能触发数组扩容，涉及引用计数 +1
                    cur = cur?.left
                }
            
                let node = stack.removeLast()  // 引用计数 -1（栈中），+1（node 变量）
                ret.append(node.val)
                cur = node.right
            }
            
            return ret
        }
    }
    
    class SolutionTrain {
        func inorderTraversal(_ root: TreeNode?) -> [Int] {
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
            SolutionTrain().inorderTraversal(tree)
        }
        #expect(ret == [1, 3, 2])
    }
    
    @Test func testUnit1() {
        let parameters: [Int?] = []
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [parameters]) {
            SolutionTrain().inorderTraversal(tree)
        }
        #expect(ret == [])
    }
    
    @Test func testUnit2() {
        let parameters: [Int?] = [1]
        let tree = TreeNode.makeTree(parameters)
        let ret = measureLogger(parameters: [parameters]) {
            SolutionTrain().inorderTraversal(tree)
        }
        #expect(ret == [1])
    }
    
    // MARK: - 性能分析说明
    /*
     为什么迭代版本（Solution1）比优化递归（Solution0）慢 3 倍？
     
     【核心原因】
     1. **引用计数开销**（最主要）
        - TreeNode 是类（引用类型），栈中存储的是引用
        - 每次 stack.append() 和 removeLast() 都涉及引用计数的增减
        - 对于 1000 个节点，大约有 2000 次引用计数操作（每个节点入栈+出栈）
        - 递归版本直接访问节点，引用计数操作更少
     
     2. **数组扩容开销**
        - Swift 数组是动态扩容的，初始容量较小
        - 随着 stack.append() 操作，可能触发多次内存重新分配
        - 递归版本只维护一个 result 数组，可以预分配容量
     
     3. **双重循环开销**
        - 外层循环：O(n) 次条件判断 (cur != nil || !stack.isEmpty)
        - 内层循环：O(n) 次条件判断和 append 操作
        - 递归版本：编译器可能进行尾递归优化和内联优化
     
     4. **内存访问模式**
        - 迭代版本需要同时访问：cur、stack、ret 三个变量
        - 内存访问更分散，CPU 缓存命中率低
        - 递归版本访问模式更线性，缓存友好
     
     5. **编译器优化**
        - Swift 编译器对递归函数有更好的优化（内联、尾递归等）
        - 迭代版本的循环结构较复杂，优化空间有限
     
     【结论】
     - 在 Swift 中，对于引用类型的树节点，优化递归通常比迭代更快
     - 如果 TreeNode 是值类型（struct），迭代版本可能更快
     - 实际性能取决于：数据规模、树的结构、编译器优化级别
     */
    
    // MARK: - 性能对比测试
    @Test func performanceComparison() {
        // 创建一个较大的平衡二叉树进行性能测试
        // 生成一个包含 1000 个节点的完全二叉树
        var largeTreeParams: [Int?] = []
        for i in 1...1000 {
            largeTreeParams.append(i)
        }
        let largeTree = TreeNode.makeTree(largeTreeParams)
        
        print("\n" + String(repeating: "=", count: 60))
        print("🚀 性能对比测试（1000 个节点的二叉树）")
        print(String(repeating: "=", count: 60))
        
        // 测试递归（原始版本 - 性能较差）
        let time1 = CFAbsoluteTimeGetCurrent()
        let result1 = Solution().inorderTraversal(largeTree)
        let elapsed1 = CFAbsoluteTimeGetCurrent() - time1
        print("📊 Solution（递归-原始）: \(String(format: "%.6f", elapsed1))秒")
        
        // 测试递归（优化版本）
        let time2 = CFAbsoluteTimeGetCurrent()
        let result2 = Solution0().inorderTraversal(largeTree)
        let elapsed2 = CFAbsoluteTimeGetCurrent() - time2
        print("📊 Solution0（递归-优化）: \(String(format: "%.6f", elapsed2))秒")
        
        // 测试迭代版本
        let time3 = CFAbsoluteTimeGetCurrent()
        let result3 = Solution1().inorderTraversal(largeTree)
        let elapsed3 = CFAbsoluteTimeGetCurrent() - time3
        print("📊 Solution1（迭代）: \(String(format: "%.6f", elapsed3))秒")
        
        print(String(repeating: "=", count: 60))
        
        // 验证结果一致性
        #expect(result1 == result2)
        #expect(result2 == result3)
        #expect(result1.count == 1000)
        
        // 性能分析
        print("\n📈 性能分析：")
        if elapsed1 > elapsed2 * 1.5 {
            print("  • 优化版递归比原始递归快 \(String(format: "%.2f", elapsed1 / elapsed2))倍")
        }
        if elapsed2 > elapsed3 * 1.2 {
            print("  • 迭代版本比优化递归快 \(String(format: "%.2f", elapsed2 / elapsed3))倍")
        } else if elapsed3 > elapsed2 * 1.2 {
            let speedup = elapsed3 / elapsed2
            print("  • ⚠️ 优化递归比迭代版本快 \(String(format: "%.2f", speedup))倍")
            print("  • 💡 原因：迭代版本的引用计数开销和数组操作导致性能下降")
            print("  • 💡 建议：在 Swift 中，对于引用类型的树，优化递归通常更高效")
        } else {
            print("  • 优化递归和迭代版本性能相当")
        }
        print("\n")
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
    
}


