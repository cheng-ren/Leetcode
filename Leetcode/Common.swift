//
//  Common.swift
//  LeetcodeTest
//
//  Created by 任成 on 2025/10/17.
//

import Foundation

let canPrintProblem = ProcessInfo.processInfo.environment["canPrintProblem"] != nil

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
    print("⏱️  耗时: \(String(format: "%.6f", timeElapsed))秒")
    print(String(repeating: "=", count: 50) + "\n")
    
    return result
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

class ListNode: CustomStringConvertible, Equatable, Hashable {
    
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
    
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
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

class TreeNode: CustomStringConvertible {
    
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
    
    // 获取树高
    private func getHeight(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        return 1 + max(getHeight(node.left), getHeight(node.right))
    }

    public var description: String {
        func buildLines(_ node: TreeNode?) -> [String] {
            guard let node = node else { return [] }

            let valStr = "\(node.val)"
            let leftLines = buildLines(node.left)
            let rightLines = buildLines(node.right)
            let h = max(leftLines.count, rightLines.count)

            // 节点字符宽度
            let nodeWidth = valStr.count

            // 对齐左、右子树输出宽度
            var leftPadded = leftLines
            var rightPadded = rightLines
            while leftPadded.count < h { leftPadded.append(String(repeating: " ", count: leftPadded.first?.count ?? 0)) }
            while rightPadded.count < h { rightPadded.append(String(repeating: " ", count: rightPadded.first?.count ?? 0)) }
            let leftWidth = leftPadded.first?.count ?? 0
            let rightWidth = rightPadded.first?.count ?? 0

            // 当前行宽度
            let lineWidth = leftWidth + nodeWidth + rightWidth

            // 第一行 居中输出当前节点
            let firstLine = String(repeating: " ", count: leftWidth) + valStr + String(repeating: " ", count: rightWidth)

            // 第二行(连接线)
            var secondLine = ""
            if node.left != nil {
                // /
                secondLine += String(repeating: " ", count: leftWidth - 1) + "/"
            } else {
                secondLine += String(repeating: " ", count: leftWidth)
            }
            secondLine += String(repeating: " ", count: nodeWidth)
            if node.right != nil {
                // \
                secondLine += "\\"
                secondLine += String(repeating: " ", count: rightWidth - 1)
            } else {
                secondLine += String(repeating: " ", count: rightWidth)
            }
            // 递归拼接下层
            var lines = [firstLine]
            // 只有左右孩子才加连线
            if node.left != nil || node.right != nil {
                lines.append(secondLine)
            }
            for i in 0..<h {
                let l = i < leftPadded.count ? leftPadded[i] : String(repeating: " ", count: leftWidth)
                let r = i < rightPadded.count ? rightPadded[i] : String(repeating: " ", count: rightWidth)
                lines.append(l + String(repeating: " ", count: nodeWidth) + r)
            }
            return lines
        }

        let lines = buildLines(self)
        // 去掉行尾多余空格
        return "\n" + lines.map { $0.rstrip() }.joined(separator: "\n")
    }
}

extension TreeNode: Equatable {
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs === rhs
    }
}

extension TreeNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

// 补充String移除行尾空格api
extension String {
    func rstrip() -> String {
        guard let i = self.lastIndex(where: { $0 != " " }) else { return "" }
        return String(self[...i])
    }
}

