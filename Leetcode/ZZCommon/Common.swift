//
//  Common.swift
//  LeetcodeTest
//
//  Created by 任成 on 2025/10/17.
//

import Foundation
import Testing

let canPrintProblem = ProcessInfo.processInfo.environment["canPrintProblem"] != nil

extension Tag {
    @Tag static var 简单: Self
    @Tag static var 中等: Self
    @Tag static var 困难: Self
    /// 解决思路
    @Tag static var 递归: Self
    @Tag static var 双指针: Self
    @Tag static var 快慢指针: Self
    @Tag static var 迭代: Self
    @Tag static var 二分查找: Self
    @Tag static var 动态规划: Self
    
    /// 数据结构
    @Tag static var 数组: Self
    @Tag static var 栈: Self
    @Tag static var 队列: Self
    @Tag static var 哈希表: Self
    @Tag static var 链表: Self
    @Tag static var 字符串: Self
    @Tag static var 树: Self
}


func measureLogger<R>(
    function: String = #function,
    file: String = #file,
    parameters: [Any?]?,
    execute: () -> R
) -> R {
    let start = CFAbsoluteTimeGetCurrent()
    let result = execute()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - start
    
    let fileName = (file as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
    
    print("\n" + String(repeating: "=", count: 50))
    print("📝 题目: \(fileName)")
    print("🔧 方法: \(function)")
    if let params = parameters, !params.isEmpty {
        print("📥 参数:")
        for (index, param) in params.enumerated() {
            print("   [\(index)]: \(param ?? "nil")")
        }
    }
    print("📤 结果: \(result)")
    print("⏱️ 耗时: \(String(format: "%.6f", timeElapsed))秒")
    print(String(repeating: "=", count: 50) + "\n")
    
    return result
}


func showMarkdown(_ filePath: String) {
    guard canPrintProblem else { return }
    
    var nFilePath = filePath
    nFilePath.replace("swift", with: "md")
//    print(nFilePath)
    let p = Process()
    p.executableURL = URL(fileURLWithPath: "/usr/bin/open")
    p.arguments = ["-a", "/Applications/Typora.app", nFilePath]
    
    try? p.run()
    p.waitUntilExit() // 阻塞等待执行完毕
    let status = p.terminationStatus
    
    if status != 0 {
        let p = Process()
        p.executableURL = URL(fileURLWithPath: "/usr/bin/open")
        p.arguments = [nFilePath]
        try? p.run()
    }
}


//struct <#progremName#> {
//    
//    <#Solution#>
//    
//    @Test func testUnit0() async throws {
//        let paramaters: [Any] = []
//        let ret = measureLogger(parameters: paramaters) {
//            Solution().<#function#>
//        }
//        #expect(ret, <#ret#>)
//    }
//    
//    @Test func showProblem() async throws {
//        showMarkdown(#filePath)
//    }
//}
//
//@Test func showProblem() async throws {
//    showMarkdown(#filePath)
//}
