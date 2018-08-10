#
# Be sure to run `pod lib lint MkImageViewer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MkImageViewer'
  s.version          = '0.0.5'
  s.summary          = 'MKImageviewer is used to display image in horizontal scrollview'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
MKImageviewer is used to display image in horizontal scrollview. It helps to load image asyc and provide pagination feature by using its delegate methods.
DESC

  s.homepage         = 'https://github.com/mohit5189/MkImageViewer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mohit5189' => 'ch.mohitkumar1234@gmail.com' }
  s.source           = { :git => 'https://github.com/mohit5189/MkImageViewer.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MkImageViewer/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MkImageViewer' => ['MkImageViewer/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
