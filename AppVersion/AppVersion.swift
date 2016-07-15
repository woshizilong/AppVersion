//
//  AppVersion.swift
//  AppVersion
//
//  Created by kaba on 16/7/15.
//  Copyright © 2016年 kaba. All rights reserved.
//

import Foundation


struct Version:Equatable, Comparable, CustomStringConvertible, StringLiteralConvertible {
    let version:[Int]
    private let versionStringWithDot:String
    
    init(versionStringWithDot:String){
        self.versionStringWithDot = versionStringWithDot
        version = versionStringWithDot.componentsSeparatedByString(".").map { (value) -> Int in
            Int(value) ?? 0
        }
    }
    
    // MARK: - CustomStringConvertible协议的实现
    /// CustomStringConvertible协议的实现
    var description: String{
        return self.versionStringWithDot
    }
    
    // MARK: - StringLiteralConvertible协议的实现
    /**
     StringLiteralConvertible协议的实现
     
     - parameter value: 等号右边的字符串对象
     */
    init(stringLiteral value: StringLiteralType){
        self.init(versionStringWithDot: value)
    }
    
    typealias ExtendedGraphemeClusterLiteralType = String
    init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType){
        self.init(versionStringWithDot: value)
    }
    
    typealias UnicodeScalarLiteralType = String
    init(unicodeScalarLiteral value: UnicodeScalarLiteralType){
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
func == (left:Version, right:Version) -> Bool{
    
    let isLeftCountLong:Bool = left.version.count > right.version.count
    
    let compareCount:Int = isLeftCountLong ? right.version.count : left.version.count
    
    for index in 0..<compareCount {
        if left.version[index] != right.version[index] {
            return false
        }
    }
    
    if left.version.count == right.version.count {
        return true
    }else{
        let checkVersion:Version = isLeftCountLong ? left : right
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
func < (left:Version, right:Version) -> Bool{
    let isLeftCountLong:Bool = left.version.count > right.version.count
    
    let compareCount:Int = isLeftCountLong ? right.version.count : left.version.count
    
    for index in 0..<compareCount {
        if left.version[index] > right.version[index] {
            return false
        }else if left.version[index] < right.version[index] {
            return true
        }
    }
    
    if left.version.count == right.version.count {
        return false
    }else{
        let checkVersion:Version = isLeftCountLong ? left : right
        for value in checkVersion.version[compareCount..<checkVersion.version.count] {
            if value < 0 {
                return isLeftCountLong
            }else if value > 0 {
                return !isLeftCountLong
            }
        }
        
        return false
    }
}