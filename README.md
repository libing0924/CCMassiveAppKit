<p align="center" >
  <img src="https://raw.githubusercontent.com/libing0924/CCMassiveAppKit/master/CCMassiveAppKit/Resources/images/massivelogo.png" alt="AFNetworking" title="AFNetworking">
</p>


[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/CCMassiveAppKit.svg)](https://img.shields.io/cocoapods/v/AFNetworking.svg)

CCMassiveAppKit是面向iOS开发新手的一个快速开发包，可以从0开始快速搭建一个通用依赖库的工程，底层架构是基于[CCSimpleAppKit](https://github.com/libing0924/CCMassiveAppKit)，为了快速的开始一个项目的开发，在导入CCMassiveAppKit的时候注意一定要引入相应的依赖库。

## Features

- 高效
- 组件化
- 可扩展

## 导入

**导入源码**

1.下载最新版本的代码
2.把文件拖入到你的工程

**CocoaPods**

1.加入到Podfile文件
```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'TargetName' do
pod 'CCMassiveAppKit', '~> 1.0.2'
end
```
2.通过pod命令安装
```bash
$ gem install cocoapods
```
3.在需要使用的地方导入相关的头文件

> CocoaPods 0.39.0+ is required to build AFNetworking 3.0.0+.

