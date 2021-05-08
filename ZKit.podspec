Pod::Spec.new do |spec|
  spec.name                       = 'ZKit'
  spec.module_name                = 'ZKit'
  spec.version                    = "3.0.0"
  spec.summary                    = 'A tool kit for iOS development'
  spec.homepage                   = "https://github.com/lzackx/ZKit"
  spec.license                    = { :type => 'MIT', :file => 'LICENSE' }
  spec.author                     = { 'lzackx' => 'zackx@foxmail.com' }
  spec.source                     = { :git => 'https://github.com/lzackx/ZKit.git', :tag => spec.version }
  spec.ios.deployment_target      = '12.0'
  spec.default_subspec            = 'core'

  spec.subspec 'core' do |subspec|
    subspec.source_files             = 'ZKit/ZKit/core/*.{m,h}'
    subspec.private_header_files     = 'ZKit/ZKit/core/*Private.h'
    subspec.frameworks               = 'Foundation'
  end

  spec.subspec 'sysctl' do |subspec|
    subspec.source_files           = 'ZKit/ZKit/sysctl/*.{m,h}'
    subspec.frameworks             = 'Foundation', 'CoreFoundation'
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'string' do |subspec|
    subspec.source_files           = 'ZKit/ZKit/string/*.{m,h}'
    subspec.frameworks             = 'Foundation'
  end

  spec.subspec 'ui' do |subspec|
    subspec.source_files               = 'ZKit/ZKit/ui/*.{m,h}'
    subspec.frameworks                 = 'UIKit'
    subspec.dependency 'ZKit/core'
  end
  
  # Project

  spec.subspec 'info' do |subspec|
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'request' do |subspec|
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'router' do |subspec|
    subspec.dependency 'ZKit/core'
  end
  
  spec.subspec 'tabbar' do |subspec|
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'navigationbar' do |subspec|
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'popup' do |subspec|
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'optimize' do |subspec|
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'webview' do |subspec|
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'flutter' do |subspec|
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'notification' do |subspec|
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'advertisement' do |subspec|
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'payment' do |subspec|
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'location' do |subspec|
    subspec.dependency 'ZKit/core'
  end
  
  spec.subspec 'media' do |subspec|
    subspec.dependency 'ZKit/core'
  end

  spec.subspec 'att' do |subspec|
    subspec.dependency 'ZKit/core'
  end

end
