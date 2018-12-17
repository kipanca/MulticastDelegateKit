#
# Be sure to run `pod lib lint MulticastDelegate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MulticastDelegateKit'
  s.version          = '1.0.0'
  s.summary          = 'A library which allows to have several delegates instead of one'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A simple library which allows to have several delegates instead of one. Also it includes subclasses for UIKit controls to work with MulticastDelegate.'
  s.homepage         = 'https://github.com/elano50/MulticastDelegate'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alex Kisel' => 'kipanca7@gmail.com' }
  s.source           = { :git => 'https://github.com/elano50/MulticastDelegate.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.3'

  s.source_files = 'MulticastDelegate/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MulticastDelegate' => ['MulticastDelegate/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
