Pod::Spec.new do |s|
  s.name = 'YSFileManager'
  s.version = '0.0.3'
  s.summary = 'YSFileManager'
  s.homepage = 'https://github.com/yusuga/YSFileManager'
  s.license = 'MIT'
  s.author = 'Yu Sugawara'
  s.source = { :git => 'https://github.com/yusuga/YSFileManager.git', :tag => s.version.to_s }
  s.platform = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.source_files = 'Classes/YSFileManager/*.{h,m}'
  s.requires_arc = true
end