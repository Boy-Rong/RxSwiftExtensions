#
# Be sure to run `pod lib lint RxSwiftExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxSwiftExtensions.swift'
  s.version          = '0.2.6'
  s.summary          = 'RxSwift+Extensions'


  s.description      = <<-DESC
  RxSwift扩展
                       DESC
  s.homepage         = 'https://github.com/Boy-Rong/RxSwiftExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rongshao' => 'rongheng.rh@gmail.com' }
  s.source           = { :git => 'https://github.com/Boy-Rong/RxSwiftExtensions.git', :tag => s.version.to_s }

  s.module_name      = 'RxSwiftExtensions'
  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.cocoapods_version = '>=1.6.0'


  s.source_files = 'RxSwiftExtensions/Sources/*.swift'

  s.dependency 'RxSwift', '~>6.0'
end
