//
//  相同的树.swift
//  LeetcodeTest
//
//  Created on 2025/12/1.
//

import Foundation
import Testing

@Suite(.serialized, .tags(.树, .递归))
struct 相同的树 {
    
    class Solution {
        func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == q { return true }
            if p == nil || q == nil { return false }
            return p!.val == q!.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
    }
    
    class SolutionTrain {
        func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            false
        }
    }
    
    @Test func testUnit0() {
        // p = [1,2,3], q = [1,2,3]
        let pParams: [Int?] = [1, 2, 3]
        let qParams: [Int?] = [1, 2, 3]
        let p = TreeNode.makeTree(pParams)
        let q = TreeNode.makeTree(qParams)
        let ret = measureLogger(parameters: [pParams, qParams]) {
            SolutionTrain().isSameTree(p, q)
        }
        #expect(ret == true)
    }
    
    @Test func testUnit1() {
        // p = [1,2], q = [1,nil,2]
        let pParams: [Int?] = [1, 2]
        let qParams: [Int?] = [1, nil, 2]
        let p = TreeNode.makeTree(pParams)
        let q = TreeNode.makeTree(qParams)
        let ret = measureLogger(parameters: [pParams, qParams]) {
            SolutionTrain().isSameTree(p, q)
        }
        #expect(ret == false)
    }
    
    @Test func testUnit2() {
        // p = [1,2,1], q = [1,1,2]
        let pParams: [Int?] = [1, 2, 1]
        let qParams: [Int?] = [1, 1, 2]
        let p = TreeNode.makeTree(pParams)
        let q = TreeNode.makeTree(qParams)
        let ret = measureLogger(parameters: [pParams, qParams]) {
            SolutionTrain().isSameTree(p, q)
        }
        #expect(ret == false)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}

