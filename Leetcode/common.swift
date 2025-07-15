//
//  Common.swift
//  Leetcode
//
//  Created by yiche on 2025/7/14.
//

import Foundation

protocol RequirtedMethod {
    func test() -> Any
}

class Common: RequirtedMethod {
    
    func test() -> Any {
        fatalError("类必须实现 test()")
    }
    
    func run() {
        print("题目:\(type(of: self))")
        
        let start = Date()
        let ret = test()
        let end = Date()
        print("输出:\(ret)")
        print("耗时:\(String(format: "%.3f", end.timeIntervalSince(start) * 1000))ms")
        print("")
    }
    
}
