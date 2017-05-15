Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '8.0'
s.name = "PKTAlertView"
s.summary = "PKTAlertView lets a user display a highly attractive and customizable alert view"
s.requires_arc = true

s.version = "0.1.0"

s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Pankaj Teckchandani" => "pankaj.teckchandani@gmail.com" }


s.homepage = "https://github.com/teckism/PKTAlertView"


s.source = { :git => "https://github.com/teckism/PKTAlertView.git", :tag => "#{s.version}"}

s.framework = "UIKit"

s.source_files = "RWPickFlavor/**/*.{swift}"

s.resources = "RWPickFlavor/**/*.{png,jpeg,jpg,storyboard,xib}"
end