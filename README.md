# NSKButton
NSKButton is a subclass of `UIButton` that implements image positioning like `NSButton` in `OSX`.

Minimal deployment targets: `iOS 8.0`,  `tvOS 9.0`

Installation guide: place this into `Podfile`

```
# use_frameworks!

target 'Target' do
    pod 'NSKButton/ObjC' # objc project
    pod 'NSKButton/Swift' # swift project
end
```

Usage:
```objc
nskButton.nskImagePosition = NSKImagePosition{Default,Right,Top,Bottom};
```

Changing `self.nskImagePosition` automatically invalidates the button layout.

![Alt text](https://github.com/NSSimpleApps/NSKButton/blob/master/NSKButton.gif)
