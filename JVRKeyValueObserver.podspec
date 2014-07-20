Pod::Spec.new do |s|
  s.name             = "JVRKeyValueObserver"
  s.version          = "0.1.1"
  s.summary          = "A helper class for easier Key-Value Observing"
  s.homepage         = "https://github.com/jozsef-vesza/JVRKeyValueObserver"
  s.license          = 'MIT'
  s.author           = { "József Vesza" => "jozsef.vesza@outlook.com" }
  s.source           = { :git => "https://github.com/jozsef-vesza/JVRKeyValueObserver.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/j_vesza'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes'
  s.public_header_files = 'Pod/Classes/*.h'
end
