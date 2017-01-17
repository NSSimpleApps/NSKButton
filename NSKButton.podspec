Pod::Spec.new do |s|
    s.name         = "NSKButton"
    s.version      = "0.4"
    s.summary      = "NSKButton is a subclass of UIButton that implements image positioning like NSButton in OSX."
    s.description  = "NSKButton is a subclass of UIButton that implements image positioning like NSButton in OSX. Changing `self.nskImagePosition` automatically invalidates the button layout. See the README."
    s.homepage     = "https://github.com/NSSimpleApps/NSKButton"
    s.license      = { :type => 'MIT', :file => 'LICENSE' }
    s.author       = { 'NSSimpleApps, Sergey Poluyanov' => 'ns.simple.apps@gmail.com' }
    s.source       = { :git => "https://github.com/NSSimpleApps/NSKButton.git", :tag => s.version.to_s }
    s.requires_arc = true

    s.platform                  = :ios, '8.0', :tvos, '9.0'

    s.default_subspec = 'ObjC'

    s.subspec 'ObjC' do |objc|
        objc.ios.deployment_target     = '8.0'
        objc.tvos.deployment_target     = '9.0'
        objc.source_files = "Source/ObjC/*.{h,m}"
        objc.public_header_files = "Source/ObjC/NSKButton.h"
    end

    s.subspec 'Swift' do |swift|
        swift.ios.deployment_target     = '8.0'
        swift.tvos.deployment_target     = '9.0'
        swift.source_files = "Source/Swift/*.swift"
    end

end
