Pod::Spec.new do |spec|
  spec.name                       = 'ZKit'
  spec.module_name                = 'ZKit'
  spec.version                    = "2.0.0"
  spec.summary                    = 'A tool kit for iOS development'
  spec.homepage                   = "https://github.com/lzackx/ZKit"
  spec.license                    = { :type => 'MIT', :file => 'LICENSE' }
  spec.author                     = { 'lzackx' => 'zackx@foxmail.com' }
  spec.source                     = { :git => 'https://github.com/lzackx/ZKit.git', :tag => s.version }
  spec.ios.deployment_target      = '9.0'
  spec.source_files               = 'ZKit/ZKit/core/*.{m,h}', 'ZKit/ZKit/view/*.{m,h}'
  spec.frameworks                 = 'Foundation', 'UIKit'
end
