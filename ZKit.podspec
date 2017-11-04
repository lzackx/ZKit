Pod::Spec.new do |s|
  s.name             = 'ZKit'
  s.version          = "1.1.0"
  s.summary          = 'A common extension tool'

  s.homepage         = "https://github.com/lzackx/ZKit"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lzackx' => 'zackx@foxmail.com' }
  s.source           = { :git => 'https://github.com/lzackx/ZKit.git', :tag => s.version }

  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.source_files = 'ZKit/ZKit/*.swift'
  s.frameworks = 'UIKit'
  
  s.pod_target_xcconfig =  {
        'SWIFT_VERSION' => '4.0',
  }
end
