//
//  翻转二叉树.swift
//  LeetcodeTest
//
//  Created by 任成 on 2025/10/20.
//

import Foundation
import Testing
// TODO: 待完成

@Suite(.serialized, .tags(.简单, .树))
struct 翻转二叉树 {
    
    // MARK: - 递归
    // 时间复杂度：O(n)，每个节点最多被访问一次
    // 空间复杂度：O(n)，递归调用栈的深度为树的高度
    class Solution {
        func invertTree(_ root: TreeNode?) -> TreeNode? {
            nil
        }
    }
    
    @Test func testUnit0() async throws {
//        let paramaters: [Any] = []
//        let root = TreeNode.make
//        let ret = measureLogger(parameters: paramaters) {
//            Solution().invertTree(<#T##root: TreeNode?##TreeNode?#>)
//        }
//        #expect(ret, <#ret#>)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}

