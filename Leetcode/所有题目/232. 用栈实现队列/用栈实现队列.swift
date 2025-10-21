//
//  用栈实现队列.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/21.
//

import Foundation
import Testing

@Suite(.tags(.栈))
struct 用栈实现队列 {
    
    class MyQueue {
        
        var stackA: [Int]
        var stackB: [Int]

        init() {
            stackA = []
            stackB = []
        }
        
        func push(_ x: Int) {
            stackA.append(x)
        }
        
        func pop() -> Int {
            guard !stackA.isEmpty || !stackB.isEmpty else {
                fatalError("数组中没有元素了")
            }
            if stackB.isEmpty {
                while stackA.first != nil {
                    stackB.append(stackA.removeLast())
                }
            }
            return stackB.removeLast()
        }
        
        func peek() -> Int {
            guard !stackA.isEmpty || !stackB.isEmpty else {
                fatalError("数组中没有元素了")
            }
            if stackB.isEmpty {
                while stackA.first != nil {
                    stackB.append(stackA.removeLast())
                }
            }
            return stackB.last!
        }
        
        func empty() -> Bool {
            return stackA.isEmpty && stackB.isEmpty
        }
    }
    
    
    @Test func testUnit0() async throws {
        
        let ret = measureLogger(parameters: [1]) {
            let obj = MyQueue()
            obj.push(1)
            obj.push(2)
            let ret_2: Int = obj.pop()
            let ret_3: Int = obj.peek()
            let ret_4: Bool = obj.empty()
            let ret_5: Bool = obj.empty()
            return ret_5
        }
        #expect(ret == false)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
