Pod::Spec.new do |spec|
  spec.name                       = 'ZKit'
  spec.module_name                = 'ZKit'
  spec.version                    = "2.3.0"
  spec.summary                    = 'A tool kit for iOS development'
  spec.homepage                   = "https://github.com/lzackx/ZKit"
  spec.license                    = { :type => 'MIT', :file => 'LICENSE' }
  spec.author                     = { 'lzackx' => 'zackx@foxmail.com' }
  spec.source                     = { :git => 'https://github.com/lzackx/ZKit.git', :tag => spec.version }
  spec.ios.deployment_target      = '9.0'
  spec.default_subspec            = 'core'

  spec.subspec 'core' do |core|
    core.source_files           = 'ZKit/ZKit/core/*.{m,h}'
    core.private_header_files   = 'ZKit/ZKit/core/*Private.h'
    core.frameworks             = 'Foundation'
  end

  spec.subspec 'view' do |view|
    view.source_files           = 'ZKit/ZKit/view/*.{m,h}'
    view.frameworks             = 'UIKit'
    view.dependency 'ZKit/core'
  end

  spec.subspec 'sysctl' do |sysctl|
    sysctl.source_files         = 'ZKit/ZKit/sysctl/*.{m,h}'
    sysctl.frameworks           = 'Foundation'
    sysctl.dependency 'ZKit/core'
  end

  spec.subspec 'color' do |color|
    color.source_files          = 'ZKit/ZKit/color/*.{m,h}'
    color.frameworks            = 'UIKit'
  end

  spec.subspec 'string' do |string|
    string.source_files          = 'ZKit/ZKit/string/*.{m,h}'
    string.frameworks            = 'UIKit'
  end
end
