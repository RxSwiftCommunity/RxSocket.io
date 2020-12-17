#
# Be sure to run `pod lib lint RxSocket.io.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxSocket.io'
  s.version          = '1.0.2'
  s.summary          = 'Listen to a codable! With RxSocket.io library your distance to whole socket complexity is a single line of code.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'This library uses PublishSubjects and if the codable model decoded successfully, then the decoded object will send into that publishSubjec and return observable version of it.functionalities are separated into 2 different protocols of SocketToggle, SocketMessage'
                       DESC

  s.homepage         = 'https://github.com/behrad-kzm/RxSocket.io'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'behrad-kzm' => 'behrad.kzm@gmail.com' }
  s.source           = { :git => 'https://github.com/behrad-kzm/RxSocket.io.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.instagram.com/behrad._.kazemi/'
  s.social_media_url = 'https://www.linkedin.com/in/kaazemi'

  
  s.ios.deployment_target = '12.0'
  s.swift_version = '5'
  
  s.source_files = 'RxSocket.io/Classes/**/*.{h,m,swift}', 'RxSocket.io/Classes/*.{h,m,swift}'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'Socket.IO-Client-Swift'
  # s.resource_bundles = {
  #   'RxSocket.io' => ['RxSocket.io/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
