//
//  AppVersion.swift
//  AppVersion
//
//  Created by kaba on 16/7/15.
//  Copyright © 2016年 kaba. All rights reserved.
//

import Foundation

/**
 *  ### AppVersion是一个Swift Framework，适配Semantic Versioning 2.0.0版本号系统。
 
 #### 实现了如下协议:
 
 - Equatable
 - Comparable
 - CustomStringConvertible
 - StringLiteralConvertibleHashable

 */
struct Version: Equatable, Comparable, CustomStringConvertible, StringLiteralConvertible {
    let version: [Int]
    private let versionStringWithDot: String

    /**
     使用版本号字符串进行构造
     
     let version:Version = Version(versionStringWithDot: "1.0.1")
     
     - parameter versionStringWithDot: 用点连接的版本号字符串
     
     - returns: Version结构
     */
    init(versionStringWithDot: String) {
        self.versionStringWithDot = versionStringWithDot
        version = versionStringWithDot.componentsSeparatedByString(".").map { (value) -> Int in
            Int(value) ?? 0
        }
    }

    /**
     使用Bundle的路径进行构造
     
     let version:Version = Version(bundlePath: "Alamofire.framework")
     
     - parameter bundlePath: Bundle的全路径
     */
    init?(bundlePath: String) {
        let bundle:NSBundle? = NSBundle(path: bundlePath)
        
        /// 这是一个可以失败的构造器
        if bundle == nil {
            return nil
        }
        
        /// 使用Bundle文件的Plist文件中取得版本号
        let version:String = bundle!.infoDictionary!["CFBundleShortVersionString"] as! String
        self.init(versionStringWithDot: version)
    }

    // MARK: - CustomStringConvertible协议的实现
    /// CustomStringConvertible协议的实现
    var description: String {
        return self.versionStringWithDot
    }

    // MARK: - StringLiteralConvertible协议的实现
    /**
     StringLiteralConvertible协议的实现

     - parameter value: 等号右边的字符串对象
     */
    init(stringLiteral value: StringLiteralType) {
        self.init(versionStringWithDot: value)
    }

    typealias ExtendedGraphemeClusterLiteralType = String
    init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.init(versionStringWithDot: value)
    }

    typealias UnicodeScalarLiteralType = String
    init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.init(versionStringWithDot: value)
    }
}

// MARK: - Equatable协议的实现
/**
 Equatable协议的实现

 - parameter left:  操作符左边的对象
 - parameter right: 操作符右边的对象

 - returns: 两边是否相等
 */
func == (left: Version, right: Version) -> Bool {

    let isLeftCountLong: Bool = left.version.count > right.version.count

    let compareCount: Int = isLeftCountLong ? right.version.count : left.version.count

    /**
     *  如果相同位数部分有不等的数字，就判定为不相等
     */
    for index in 0..<compareCount {
        if left.version[index] != right.version[index] {
            return false
        }
    }

    if left.version.count == right.version.count {
        /**
         *  如果位数相同就判定为相等
         */
        return true
    } else {
        /// 判断位数长的Version结构剩下的位数，如果不全是'0'就判定为不相等，否则判定为相等
        let checkVersion: Version = isLeftCountLong ? left : right
        for value in checkVersion.version[compareCount..<checkVersion.version.count] {
            if value != 0 {
                return false
            }
        }
        return true
    }
}

// MARK: - Comparable协议的实现
/**
 Comparable协议的实现

 - parameter left:  操作符左边的对象
 - parameter right: 操作符右边的对象

 - returns: 左边是否小于右边
 */
func < (left: Version, right: Version) -> Bool {
    let isLeftCountLong: Bool = left.version.count > right.version.count

    let compareCount: Int = isLeftCountLong ? right.version.count : left.version.count

    for index in 0..<compareCount {
        if left.version[index] > right.version[index] {
            return false
        } else if left.version[index] < right.version[index] {
            return true
        }
    }

    if left.version.count == right.version.count {
        return false
    } else {
        let checkVersion: Version = isLeftCountLong ? left : right
        for value in checkVersion.version[compareCount..<checkVersion.version.count] {
            if value < 0 {
                return isLeftCountLong
            } else if value > 0 {
                return !isLeftCountLong
            }
        }

        return false
    }
}