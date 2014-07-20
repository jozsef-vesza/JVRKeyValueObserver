# JVRKeyValueObserver

[![CI Status](http://img.shields.io/travis/József Vesza/JVRKeyValueObserver.svg?style=flat)](https://travis-ci.org/József Vesza/JVRKeyValueObserver)
[![Version](https://img.shields.io/cocoapods/v/JVRKeyValueObserver.svg?style=flat)](http://cocoadocs.org/docsets/JVRKeyValueObserver)
[![License](https://img.shields.io/cocoapods/l/JVRKeyValueObserver.svg?style=flat)](http://cocoadocs.org/docsets/JVRKeyValueObserver)
[![Platform](https://img.shields.io/cocoapods/p/JVRKeyValueObserver.svg?style=flat)](http://cocoadocs.org/docsets/JVRKeyValueObserver)

## Credits

This pod was created following the excellent [KVO article](http://www.objc.io/issue-7/key-value-coding-and-observing.html) on [objc.io](http://www.objc.io/). The original source can be found in their [example repository](https://github.com/objcio/issue-7-lab-color-space-explorer) for the article. I would like to thank [objc.io](https://twitter.com/objcio) for providing such high quality articles.

## Usage

```objc

@interface MyViewController ()

@property (nonatomic, strong) id modelObserverToken;
@property (nonatomic, strong) MyObservableObject *observableObject;

@end

@implementation JVAGoalsViewController

- (void)viewDidLoad {
	// Subscribe for change notifications with a given selector
	self.modelObserverToken = [JVRKeyValueObserver
                               observeObject:self.observableObject
                               keyPath:@"observableProperty" target:self
                               selector:@selector(modelDidChange:)
                               options:NSKeyValueObservingOptionNew];
}

- (void)modelDidChange:(NSDictionary *)change {
	// Handle changes...
}

@end

```

## Installation

JVRKeyValueObserver is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "JVRKeyValueObserver"

## Author

József Vesza, jozsef.vesza@outlook.com

## License

JVRKeyValueObserver is available under the MIT license. See the LICENSE file for more info.

