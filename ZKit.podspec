Pod::Spec.new do |spec|
  spec.name                       = 'ZKit'
  spec.module_name                = 'ZKit'
  spec.version                    = "2.0.0"
  spec.summary                    = 'A tool kit for iOS development'
  spec.homepage                   = "https://github.com/lzackx/ZKit"
  spec.license                    = { :type => 'MIT', :file => 'LICENSE' }
  spec.author                     = { 'lzackx' => 'zackx@foxmail.com' }
  spec.source                     = { :git => 'https://github.com/lzackx/ZKit.git', :tag => spec.version }
  spec.ios.deployment_target      = '9.0'
  spec.default_subspec            = 'core'

  spec.subspec 'core' do |core|
    core.source_files           = 'ZKit/ZKit/core/*.{m,h}'
    core.frameworks             = 'Foundation'
  end

  spec.subspec 'view' do |view|
    view.source_files           = 'ZKit/ZKit/view/*.{m,h}'
    view.frameworks             = 'UIKit'
    view.dependency 'ZKit/core'
  end

  spec.subspec 'sysctl' do |sysctl|
    sysctl.source_files           = 'ZKit/ZKit/sysctl/*.{m,h}'
    sysctl.frameworks             = 'Foundation'
    sysctl.dependency 'ZKit/core'
  end
end
