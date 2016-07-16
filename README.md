# AppVersion

![](https://img.shields.io/badge/language-swift-orange.svg) ![](https://travis-ci.org/woshizilong/AppVersion.svg?branch=master) ![](https://img.shields.io/cocoapods/v/AppVersion.svg) ![](https://img.shields.io/badge/license-MIT-000000.svg)

AppVersion是一个Swift Framework，适配[Semantic Versioning 2.0.0](http://semver.org)版本号系统。

实现了如下协议:

* Equatable
* Comparable
* CustomStringConvertible
* StringLiteralConvertibleHashable


## 使用方法

AppVersion可以传入用'.'分割的版本字符串来实例化:

```swift
let version = Version(versionStringWithDot: "1.0.0")
```

或者直接用'.'分割的版本字符串直接转化:

```swift
let version : Version = "1.0.0"
```

AppVersion支持互相间的比较:

```swift
let appVersion : Version = “1.2.3”
let newVersion : Version = getNewVersionFromAppStore()
if appVersion < newVersion {
    // You need upgrade
}
```


## 引入工程的方式

AppVersion 支持 [CocoaPods](http://cocoapods.org)。你只需要在你的Podfile中加入下面的设置:

```ruby
use_frameworks!
pod 'AppVersion'
```


## 作者

卡爸，woshizilong@hotmail.com  


## Todo
* let version : Version = UIDevice.currentDevice().systemVersion
* Version.SystemVersion
* Version.AppVersion
* let version : Version = Version(bundlePath: "Alamofire.framework")
* version > "1.0.3"

## License

Version is available under the MIT license. See the LICENSE file for more info.

