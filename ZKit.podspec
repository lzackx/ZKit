#
# Be sure to run `pod lib lint ZKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name                       = 'ZKit'
  spec.module_name                = 'ZKit'
  spec.version                    = "3.0.0"
  spec.summary                    = 'A tool kit for iOS development'
  spec.homepage                   = "https://github.com/lzackx/ZKit"
  spec.license                    = { :type => 'MIT', :file => 'LICENSE' }
  spec.author                     = { 'lzackx' => 'zackx@foxmail.com' }
  spec.source                     = { :git => 'https://github.com/lzackx/ZKit.git', :tag => spec.version }
  spec.ios.deployment_target      = '10.0'
  spec.default_subspec            = 'core'

  spec.subspec 'core' do |subspec|
    subspec.source_files          = 'ZKit/Classes/core/*.{m,h}'
    subspec.private_header_files  = 'ZKit/Classes/core/*Private.h'
    subspec.frameworks            = 'Foundation'
  end

  spec.subspec 'all' do |subspec|
    subspec.dependency  'ZKit/core'
    subspec.dependency  'ZKit/sysctl'
    subspec.dependency  'ZKit/string'
    subspec.dependency  'ZKit/ui'
    subspec.dependency  'ZKit/info'
    subspec.dependency  'ZKit/request'
    subspec.dependency  'ZKit/router'
    subspec.dependency  'ZKit/tabbar'
    subspec.dependency  'ZKit/navigationbar'
    subspec.dependency  'ZKit/popup'
    subspec.dependency  'ZKit/optimize'
    subspec.dependency  'ZKit/webview'
    subspec.dependency  'ZKit/flutter'
    subspec.dependency  'ZKit/notification'
    subspec.dependency  'ZKit/advertisement'
    subspec.dependency  'ZKit/payment'
    subspec.dependency  'ZKit/location'
    subspec.dependency  'ZKit/media'
    subspec.dependency  'ZKit/att'
  end

  spec.subspec 'sysctl' do |subspec|
    subspec.source_files          = 'ZKit/Classes/sysctl/*.{m,h}'
    subspec.frameworks            = 'Foundation', 'CoreFoundation'
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'string' do |subspec|
    subspec.source_files          = 'ZKit/Classes/string/*.{m,h}'
    subspec.frameworks            = 'Foundation'
  end

  spec.subspec 'ui' do |subspec|
    subspec.source_files          = 'ZKit/Classes/ui/*.{m,h}'
    subspec.frameworks            = 'UIKit'
    subspec.dependency 'ZKit/core'
  end
  
  # Project
  spec.subspec 'info' do |subspec|
    subspec.source_files          = 'ZKit/Classes/info/*.{m,h}'
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'request' do |subspec|
    subspec.source_files          = 'ZKit/Classes/request/*.{m,h}'
    subspec.dependency 'ZKit/core'
		subspec.dependency 'Zequest', '~> 1.0.0'
  end

  spec.subspec 'router' do |subspec|
		subspec.source_files          = 'ZKit/Classes/router/*.{m,h}'
		subspec.dependency 'ZKit/core'
		subspec.dependency 'Zouter', '~> 2.0.0'
  end
  
  spec.subspec 'tabbar' do |subspec|
    subspec.source_files          = 'ZKit/Classes/tabbar/*.{m,h}'
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'navigationbar' do |subspec|
    subspec.source_files          = 'ZKit/Classes/navigationbar/*.{m,h}'
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'popup' do |subspec|
    subspec.source_files          = 'ZKit/Classes/popup/*.{m,h}'
    subspec.dependency 'ZKit/core'
		subspec.dependency 'Zopup'
		subspec.frameworks            = 'UIKit'
  end

  spec.subspec 'optimize' do |subspec|
    subspec.source_files          = 'ZKit/Classes/optimize/*.{m,h}'
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'webview' do |subspec|
    subspec.source_files          = 'ZKit/Classes/webview/*.{m,h}'
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'flutter' do |subspec|
    subspec.source_files          = 'ZKit/Classes/flutter/*.{m,h}'
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'notification' do |subspec|
    subspec.source_files          = 'ZKit/Classes/notification/*.{m,h}'
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'advertisement' do |subspec|
    subspec.source_files          = 'ZKit/Classes/advertisement/*.{m,h}'
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'payment' do |subspec|
    subspec.source_files          = 'ZKit/Classes/payment/*.{m,h}'
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'location' do |subspec|
    subspec.source_files          = 'ZKit/Classes/location/*.{m,h}'
    subspec.dependency 'ZKit/core'
  end
  
  spec.subspec 'media' do |subspec|
    subspec.source_files          = 'ZKit/Classes/media/*.{m,h}'
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'att' do |subspec|
    subspec.source_files          = 'ZKit/Classes/att/*.{m,h}'
    subspec.dependency 'ZKit/core'
    subspec.frameworks            = 'AppTrackingTransparency'
  end

end
