Pod::Spec.new do |spec|
  spec.name                       = 'ZKit'
  spec.module_name                = 'ZKit'
  spec.version                    = "2.0.0"
  spec.summary                    = 'A tool kit for iOS development'
  spec.homepage                   = "https://github.com/lzackx/ZKit"
  spec.license                    = { :type => 'MIT', :file => 'LICENSE' }
  spec.author                     = { 'lzackx' => 'zackx@foxmail.com' }
  spec.source                     = { :git => 'https://github.com/lzackx/ZKit.git', :tag => s.version }
  spec.ios.deployment_target      = '8.0'
  spec.default_subspec            = 'core'

  spec.subspec 'core' do |core|
    core.source_files             = 'ZKit/ZKit/core/*.{m,h}'
    core.private_header_files     = 'core/ZKitPrivate.h'
    core.frameworks               = 'Foundation'
  end

  spec.subspec 'object' do |object|
    object.source_files           = 'ZKit/ZKit/object/*.{m,h}'
    object.frameworks             = 'Foundation'
  end

  spec.subspec 'view' do |view|
    view.source_files             = 'ZKit/ZKit/view/*.{m,h}'
    view.frameworks               = 'UIKit'
  end

  spec.subspec 'string' do |string|
    string.source_files           = 'ZKit/ZKit/string/*.{m,h}'
    string.frameworks             = 'Foundation'
  end

  spec.subspec 'router' do |router|
    router.source_files           = 'ZKit/ZKit/router/*.{m,h}'
    router.frameworks             = 'Foundation'
  end
  
end
