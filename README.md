# Leetcode Swift 刷题项目

这个项目采用 **Swift Testing** 框架实现 Leetcode 算法题练习，支持一键运行测试用例，并提供性能分析和可视化输出。

## ✨ 项目特色

- 🎯 **Swift Testing 框架**：使用现代化的 Swift Testing 进行单元测试
- ⚡ **一键运行**：通过 Xcode 或命令行快速执行测试
- 📊 **性能分析**：内置 `measureLogger` 函数，自动统计执行时间
- 📝 **题目可视化**：集成 Markdown 文档查看，快速了解题目描述
- 🏗️ **模块化设计**：每个题目独立目录，包含解法和测试用例

## 🚀 快速开始

### 方式一：Xcode 一键运行（推荐）

1. 用 Xcode 打开项目：
   ```bash
   open Leetcode.xcodeproj
   ```

2. 选择 `LeetcodeTest` scheme

3. 一键运行所有测试：
   - 按 `Command + U` 运行所有测试
   - 或点击菜单栏：`Product` → `Test`

4. 运行特定题目：
   - 打开对应的 Swift 文件（如 `每日温度.swift`）
   - 点击测试方法左侧的菱形按钮 ◆
   - 或在测试导航器（`Command + 6`）中选择特定测试

### 方式二：命令行运行

```bash
# 运行所有测试
xcodebuild test -scheme LeetcodeTest

# 或使用 swift test（需要配置 Package.swift）
swift test
```

## 📁 项目结构

```
Leetcode/
├── Leetcode/
│   ├── Common.swift              # 公共工具类和数据结构
│   ├── 1.两数之和/
│   │   ├── 两数之和.swift        # 解法 + 测试用例
│   │   └── 两数之和.md           # 题目描述
│   ├── 2.两数相加/
│   │   ├── 两数相加.swift
│   │   └── 两数相加.md
│   └── ...                       # 其他题目
├── Leetcode.xcodeproj/           # Xcode 项目配置
└── README.md                     # 项目说明
```

## 🔧 Swift Testing 运行机制

### 1. 测试结构

每个题目的 Swift 文件采用以下结构：

```swift
import Testing

struct 每日温度 {
    // MARK: - 解法实现
    class Solution0 {
        func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
            // 算法实现
        }
    }
    
    // MARK: - 测试用例
    @Test func testUnit0() async throws {
        let input = [73,74,75,71,69,72,76,73]
        let result = Solution0().dailyTemperatures(input)
        #expect(result == [1,1,4,2,1,1,0,0])
    }
    
    // MARK: - 查看题目
    @Test func showProblem() async throws {
        showMarkdown(#filePath)
    }
}
```

### 2. 核心组件

#### `@Test` 注解
- 标记测试方法，Swift Testing 会自动发现并执行
- 支持异步测试（`async throws`）

#### `#expect` 断言
- Swift Testing 的断言语法，比 XCTest 更简洁
- 失败时提供清晰的错误信息

#### `measureLogger` 性能测试
- 自动记录算法执行时间
- 格式化输出题目、方法、参数、结果和耗时

```swift
let result = measureLogger(parameters: [input]) {
    Solution0().dailyTemperatures(input)
}
```

输出示例：
```
==================================================
📝 题目: 每日温度
🔧 方法: dailyTemperatures(_:)
📥 参数:
   [0]: [73, 74, 75, 71, 69, 72, 76, 73]
📤 结果: [1, 1, 4, 2, 1, 1, 0, 0]
⏱️  耗时: 0.000234秒
==================================================
```

### 3. 公共数据结构

`Common.swift` 提供了常用的 Leetcode 数据结构：

- **ListNode**：链表节点，支持美化打印（`1 -> 2 -> 3`）
- **TreeNode**：二叉树节点，支持树形可视化打印
- **measureLogger**：性能测量工具
- **showMarkdown**：打开题目 Markdown 文档（支持 Typora）

## 📚 已完成题目

| 题号 | 题目 | 难度 | 标签 |
|------|------|------|------|
| 1 | [两数之和](Leetcode/1.两数之和/两数之和.md) | 简单 | 哈希表 |
| 2 | [两数相加](Leetcode/2.两数相加/两数相加.md) | 中等 | 链表 |
| 14 | [最长公共前缀](Leetcode/14.%20最长公共前缀/最长公共前缀.md) | 简单 | 字符串 |
| 160 | [相交链表](Leetcode/160.%20相交链表/相交链表.md) | 简单 | 链表 |
| 226 | [翻转二叉树](Leetcode/226.%20翻转二叉树/翻转二叉树.md) | 简单 | 二叉树 |
| 234 | [回文链表](Leetcode/234.%20回文链表/回文链表.md) | 简单 | 链表 |
| 236 | [二叉树的最近公共祖先](Leetcode/236.%20二叉树的最近公共祖先/二叉树的最近公共祖先.md) | 中等 | 二叉树 |
| 344 | [反转字符串](Leetcode/344.%20反转字符串/反转字符串.md) | 简单 | 双指针 |
| 739 | [每日温度](Leetcode/739.%20每日温度/每日温度.md) | 中等 | 单调栈 |
| LCR 016 | [无重复字符的最长子串](Leetcode/LCR%20016.%20无重复字符的最长子串/无重复字符的最长子串.md) | 中等 | 滑动窗口 |

## 💡 使用技巧

1. **查看测试结果**：测试运行后，在 Xcode 的 Test Navigator（`⌘+6`）中查看详细结果
2. **调试测试**：在测试方法中设置断点，然后 Debug 模式运行测试
3. **查看题目**：运行 `showProblem()` 测试方法会自动打开对应的 Markdown 文件
4. **性能对比**：同一题目可以有多个解法（Solution0, Solution1），通过 `measureLogger` 对比性能

## 📖 学习跟踪

本项目配套 Notion 学习站点，记录每日练习进度和复习计划：

🔗 **[Leetcode 学习跟踪 - Notion](https://rencheng.notion.site/Leetcode-29194e2f5928817e9946c57e0cd0e0cf?source=copy_link)**

Notion 站点功能：
- 📊 **题目数据库**：记录所有练习过的题目
- 📅 **练习时间**：追踪每次练习的日期
- 🔄 **复习计划**：基于遗忘曲线设置下次复习时间
- 🏷️ **题目分类**：按标签（数组、链表、树等）组织
- 📈 **掌握程度**：标记题目熟练度（不熟悉/一般/熟练）
- 💡 **解决方案**：记录多种解法和思路
- 📆 **每日回顾**：查看每天都练习了哪些内容

通过 Notion + Swift Testing 的组合，实现系统化的算法学习和定期复习。

## 🛠️ 环境要求

- macOS 14.0+
- Xcode 16.0+
- Swift 6.0+