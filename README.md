![MulticastDelegateKit: Simple multi delegate in Swift](https://github.com/luximetr/AnyFormatKit/blob/develop/Assets/anyformatkit.png)

[![Build Status](https://travis-ci.org/elano50/MulticastDelegateKit.svg?branch=master)](https://travis-ci.org/elano50/MulticastDelegateKit)
[![Version](https://img.shields.io/cocoapods/v/MulticastDelegateKit.svg?style=flat)](https://cocoapods.org/pods/MulticastDelegateKit)
[![License](https://img.shields.io/cocoapods/l/MulticastDelegateKit.svg?style=flat)](https://cocoapods.org/pods/MulticastDelegateKit)
[![Platform](https://img.shields.io/cocoapods/p/MulticastDelegateKit.svg?style=flat)](https://cocoapods.org/pods/MulticastDelegateKit)
![Swift](https://img.shields.io/badge/%20in-swift%204.2-orange.svg)

Multicast delegate framework written on Swift 4.2.

## Features

| |Features |
|-------------------|------------------------------------------------------------|
:performing_arts:| Adding multicast delegate to your custom classes
:bicyclist:| Subclasses of UIKit controls with multicast delegate property (currently only for UITableView) 
:rocket:| Manage which delegates responsible for returning value for UIKit controls using ```responsibleForSelectors()``` function


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

### Responsible for selectors example

Some delegate methods can return a value. So when we have several delegates, we need a mechanism to manage which delegate is responsible for returning value. Only one delegate should be responsible for returning value, other delegates are listeners. 

```swift
class FooClass: UITableViewDelegate, MulticastableDelegate {
  var tableView: MultidelegateTableView

  func setup() {
    tableView.multiDelegate.add(delegate: self)
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }

  func responsibleForSelectors() -> [String]? {
    return [#selector(tableView(_:heightForRowAt:)).description]
  }
}
```

## Requirements

iOS 10.0+
Swift 4.0+

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
