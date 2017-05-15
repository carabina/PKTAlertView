Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "PKTAlertView"
s.summary = "PKTAlertView lets a user display a highly attractive and customizable alert view"
s.requires_arc = true

s.version = "0.4.0"

s.license = { :type => "MIT", :file => "LICENSE" }


s.author = { "Pankaj Teckchandani" => "pankaj.teckchandani@gmail.com" }

s.homepage = "https://github.com/teckism/PKTAlertView"

s.source = { :git => "https://github.com/teckism/PKTAlertView.git", :tag => "#{s.version}"}

s.framework = "UIKit"
s.source_files = "PKTAlertView/**/*.{swift,xib,h,m}"
s.dependency 'BetterBaseClasses', '~> 1.0'

s.resources = "PKTAlertView/**/*.{xib}"
end