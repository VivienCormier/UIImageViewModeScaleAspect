Pod::Spec.new do |s|
  s.name         = 'UIImageViewModeScaleAspect'
  s.version      = '2.0'
  s.summary      = 'Create animation of a UIImageView between twice contentMode ( UIViewContentModeScaleAspectFill / UIViewContentModeScaleAspectFit ).'
  s.homepage     = "https://github.com/VivienCormier/UIImageViewModeScaleAspect"
  s.author       = {'Vivien Cormier' => 'vivien.cormier@gmail.com'}
  s.source       = {:git => 'https://github.com/VivienCormier/UIImageViewModeScaleAspect.git', :tag => '2.0'}
  s.platform     = :ios, '8.0'
  s.source_files = 'UIImageViewModeScaleAspect/UIImageViewModeScaleAspect.swift'
  s.license      = 'MIT'
  s.requires_arc = true
end
