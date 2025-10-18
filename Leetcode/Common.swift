//
//  Common.swift
//  LeetcodeTest
//
//  Created by 任成 on 2025/10/17.
//

import Foundation

func logger(resolveName: String, funcName: String = #function, parameters: [Any?]? = nil, ret: Any? = nil)
{
    print("\n==========================")
    print("resolve:\t\(resolveName)")
    print("function:\t\(funcName)")
    if let parameters = parameters, !parameters.isEmpty {
        print("parameters:\t" + parameters.map { "\($0 ?? "空")" }.joined(separator: ", "))
    } else {
        print("parameters:\t空")
    }
    print("return:\t\t\(ret ?? "空")")
    print("==========================\n")
}


func showMarkdown(_ filePath: String) {
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

class ListNode: CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    // 辅助函数：将链表转为数组
    func toList() -> [Int] {
        var result: [Int] = []
        var current: ListNode? = self
        while current != nil {
            result.append(current!.val)
            current = current?.next
        }
        return result
    }
    
    var description: String {
        var next: ListNode? = self
        var ret = ""
        while next != nil {
            ret += "\(next!.val) -> "
            next = next!.next
        }
        if ret.hasSuffix(" -> ") {
            ret = String(ret.prefix(ret.count - 4))
        }
        return ret
    }
}

class TreeNode {
    open var val: Int
    open var left: TreeNode?
    open var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
