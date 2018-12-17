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

  s.description      = 'A simple library which allows to have several delegates instead of one. Also it includes subclasses for UIKit controls to work with MulticastDelegateKit.'
  s.homepage         = 'https://github.com/elano50/MulticastDelegateKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alex Kisel' => 'kipanca7@gmail.com' }
  s.source           = { :git => 'https://github.com/elano50/MulticastDelegateKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'MulticastDelegate/Classes/**/*'

end
