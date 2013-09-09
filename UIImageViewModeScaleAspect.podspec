Pod::Spec.new do |s|
  s.name         = 'UIImageViewModeScaleAspect'
  s.version      = '1.2'
  s.summary      = 'Create animation of a UIImageView between twice contentMode ( UIViewContentModeScaleAspectFill / UIViewContentModeScaleAspectFit ).'
  s.homepage     = "https://github.com/alexruperez/UIImageViewModeScaleAspect"
  s.author       = {'Alex Rupérez' => 'contact@alexruperez.com'}
  s.source       = {:git => 'https://github.com/alexruperez/UIImageViewModeScaleAspect.git', :tag => '1.1'}
  s.platform     = :ios, '5.0'
  s.source_files = 'UIImageViewModeScaleAspect/UIImageViewModeScaleAspect.{h,m}'
  s.license      = 'MIT'
  s.requires_arc = true
end