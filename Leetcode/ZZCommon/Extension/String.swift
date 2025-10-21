//
//  String.swift
//  LeetcodeTest
//
//  Created by yiche on 2025/10/21.
//

import Foundation

// 补充String移除行尾空格api
extension String {
    func rstrip() -> String {
        guard let i = self.lastIndex(where: { $0 != " " }) else { return "" }
        return String(self[...i])
    }
}

// 实现下标索引
extension String {

    subscript(index: Int) -> Character {
        return self[self.index(startIndex, offsetBy: index)]
    }

    func substring(to index: String.Index) -> String {
        return String(self[..<index])
    }

    func substring(from index: String.Index) -> String {
        return String(self[index...])
    }

    func substring(with range: Range<String.Index>) -> String {
        return String(self[range])
    }

    

}

