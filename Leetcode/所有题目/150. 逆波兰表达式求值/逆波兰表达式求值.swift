//
//  逆波兰表达式求值.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/21.
//

import Foundation
import Testing

// 输入：tokens = ["2","1","+","3","*"]
// 输出：9
// 解释：该算式转化为常见的中缀算术表达式为：((2 + 1) * 3) = 9

@Suite(.tags(.栈))
struct 逆波兰表达式求值 {
    
    class Solution {
        func evalRPN(_ tokens: [String]) -> Int {
            
            var stack: [Int] = []
            
            let opers: Set<String> = ["+", "-", "*", "/"]
            
            for token in tokens {
                if opers.contains(token) {
                    let operNumR = stack.popLast()!
                    let operNumL = stack.popLast()!
                    var ret: Int = 0
                    switch token {
                    case "+":
                        ret = operNumL + operNumR
                    case "-":
                        ret = operNumL - operNumR
                    case "*":
                        ret = operNumL * operNumR
                    case "/":
                        ret = operNumL / operNumR
                    default:
                        fatalError("未知操作符")
                    }
                    stack.append(ret)
                } else {
                    stack.append((Int(token) ?? 0))
                }
            }
            return stack.last!
        }
    }
    
    class Solution1 {
        func evalRPN(_ tokens: [String]) -> Int {
            let operations: Set<String> = [
                "+", "-", "*", "/"
            ]
            var stack: [Int] = []
            for token in tokens {
                if operations.contains(token) {
                    var ret = 0
                    let operNumR = stack.popLast()!
                    let operNumL = stack.popLast()!
                    
                    switch token {
                    case "+":
                        ret = operNumL + operNumR
                    case "-":
                        ret = operNumL - operNumR
                    case "*":
                        ret = operNumL * operNumR
                    case "/":
                        ret = operNumL / operNumR
                    default:
                        fatalError("错误的操作")
                    }
                    stack.append(ret)
                } else {
                    stack.append(Int(token) ?? 0)
                }
            }
            return stack.last!
        }
    }
    
    // 输入：tokens = ["2","1","+","3","*"]
    // 输出：9
    // 解释：该算式转化为常见的中缀算术表达式为：((2 + 1) * 3) = 9
    class SolutionTrain {
        func evalRPN(_ tokens: [String]) -> Int {
            let oper: Set<Character> = [ "+", "-", "*", "/" ]
            var stack: [Int] = []
            for token in tokens {
                if oper.contains(token) {
                    let operNumR = stack.popLast()!
                    let operNumL = stack.popLast()!
                    var ret = 0
                    switch token {
                    case "+": ret = operNumL + operNumR
                    case "-": ret = operNumL - operNumR
                    case "*": ret = operNumL * operNumR
                    case "/": ret = operNumL / operNumR
                    default: break
                    }
                    stack.append(ret)
                } else {
                    stack.append(Int(token) ?? 0)
                }
            }
            return stack.last!
        }
    }
    
    @Test func testUnit0() async throws {
        let paramaters = ["2","1","+","3","*"]
        let ret = measureLogger(parameters: paramaters) {
            SolutionTrain().evalRPN(paramaters)
        }
        #expect(ret == 9)
    }
    
    @Test func testUnit1() async throws {
        let paramaters = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
        //        解释：该算式转化为常见的中缀算术表达式为：
        //          ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
        //        = ((10 * (6 / (12 * -11))) + 17) + 5
        //        = ((10 * (6 / -132)) + 17) + 5
        //        = ((10 * 0) + 17) + 5
        //        = (0 + 17) + 5
        //        = 17 + 5
        //        = 22
        let ret = measureLogger(parameters: paramaters) {
            SolutionTrain().evalRPN(paramaters)
        }
        #expect(ret == 22)
    }
    
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
