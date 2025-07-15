//
//  字符串反转.swift
//  Leetcode
//
//  Created by yiche on 2025/7/14.
//

import Foundation

class 字符串反转: Common {
    
    class Solution1 {
        func reverseString(_ s: inout [Character]) {
            for i in 0..<(s.count / 2) {
                let t = s[i]
                s[i] = s[s.count-i-1]
                s[s.count-i-1] = t
            }
        }
    }
    
    class Solution {
        func reverseString(_ s: inout [Character]) {
            for i in 0..<(s.count / 2) {
                s.swapAt(i, s.count-i-1)
            }
        }
    }
    
    
    override func test() -> Any {
        var s: [Character] = ["h","e","l","l","o"]
        Solution().reverseString(&s) // 预期 "olleh"
        return s
    }
    
}
