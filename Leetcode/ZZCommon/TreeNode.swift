//
//  TreeNode.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/20.
//

import Foundation


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
    
    static func makeTree(_ values: [Int?]) -> TreeNode? {
        guard !values.isEmpty, let firstVal = values[0] else { return nil }
        let root = TreeNode(firstVal)
        var queue: [TreeNode] = [root]
        var index = 1
        
        while !queue.isEmpty && index < values.count {
            let node = queue.removeFirst()
            
            if index < values.count, let leftVal = values[index] {
                node.left = TreeNode(leftVal)
                queue.append(node.left!)
            }
            index += 1
            
            if index < values.count, let rightVal = values[index] {
                node.right = TreeNode(rightVal)
                queue.append(node.right!)
            }
            index += 1
        }
        
        return root
    }
    
}

extension TreeNode: CustomStringConvertible {

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
            let _ = leftWidth + nodeWidth + rightWidth

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
