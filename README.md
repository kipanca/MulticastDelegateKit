[![Build Status](https://travis-ci.org/elano50/MulticastDelegateKit.svg?branch=master)](https://travis-ci.org/elano50/MulticastDelegateKit)
[![Version](https://img.shields.io/cocoapods/v/MulticastDelegateKit.svg?style=flat)](https://cocoapods.org/pods/MulticastDelegateKit)
[![License](https://img.shields.io/cocoapods/l/MulticastDelegateKit.svg?style=flat)](https://cocoapods.org/pods/MulticastDelegateKit)
[![Platform](https://img.shields.io/cocoapods/p/MulticastDelegateKit.svg?style=flat)](https://cocoapods.org/pods/MulticastDelegateKit)

Multicast delegate framework written on Swift 4.2.

## Features

| |Features |
|-------------------|------------------------------------------------------------|
:performing_arts:| Adding multicast delegate to your custom classes
:bicyclist:| Subclasses of UIKit controls with multicast delegate property (currently only for UITableView) 
:rocket:| Manage which delegates responsible for returning value for UIKit controls using ```responsableForSelectors:``` method


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### UITableView example

```swift
let tableView = MultidelegateTableView()
tableView.multiDelegate.add(delegate: self)
```

### Custom class example

```swift
protocol FooClassDelegate {
  func fooEvent()
}

class FooClass {
  var multicastDelegate = MulticastDelegate<FooClassDelegate>()
  
  func foo() {
    multicastDelegate.invoke { delegate in
      delegate.fooEvent()
    }
  }
}

class BarClass: FooClassDelegate {
  var foo = FooClass()
  var baz = BazClass()
  
  init() {
    foo.multicastDelegate.add(delegate: self)
    foo.multicastDelegate.add(delegate: baz)
  }
  
  func fooEvent() {
    
  }
}

class BazClass: FooClassDelegate {
  
  func fooEvent() {
    
  }
}
```

## Requirements

## Installation

MulticastDelegate is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MulticastDelegateKit'
```

## Author

Alex Kisel, alexander.kisel@brander.ua

## License

MulticastDelegate is available under the MIT license. See the LICENSE file for more info.
