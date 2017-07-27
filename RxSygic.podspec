#
# Be sure to run `pod lib lint RxSygic.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxSygic'
  s.version          = '0.2.4'
  s.summary          = 'RxSygic layer for SygicSDK'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/anonymcek/RxSygic'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Sygic' => 'info@sygic.com' }
  s.source           = { :git => 'https://github.com/anonymcek/RxSygic.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'RxSygic/Classes/*'
  
  # s.resource_bundles = {
  #   'RxSygic' => ['RxSygic/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'Sygic', '~>1.1.12'
  s.dependency 'RxSwift', '~>3.6.1'
  s.dependency 'RxCocoa', '~>3.6.1'
  
end
