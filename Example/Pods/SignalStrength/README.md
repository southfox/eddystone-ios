# SignalStrength

[![CI Status](http://img.shields.io/travis/Tanner Nelson/SignalStrength.svg?style=flat)](https://travis-ci.org/Tanner Nelson/SignalStrength)
[![Version](https://img.shields.io/cocoapods/v/SignalStrength.svg?style=flat)](http://cocoapods.org/pods/SignalStrength)
[![License](https://img.shields.io/cocoapods/l/SignalStrength.svg?style=flat)](http://cocoapods.org/pods/SignalStrength)
[![Platform](https://img.shields.io/cocoapods/p/SignalStrength.svg?style=flat)](http://cocoapods.org/pods/SignalStrength)

## Preview

![alt tag](https://cloud.githubusercontent.com/assets/1342803/12491628/208d872e-c04a-11e5-8ca4-b5e7266aee05.gif)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

SignalStrength is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SignalStrength"
```

## Usage

Add a view to your Storyboard and set the class to `SignalStrengthView`. The view is `@IBDesignable` so you should immediately see the signal strength indicators and intrinsic sizing.

Add an outlet from the `SignalStrengthView` to your ViewController to modify the `SignalStrengthView`'s `signal` and `flipped` properties.

### Signal

This `enum` property changes how many dots are filled in on the view. Use the example application provided in the CocoaPod to view how different `SignalStrength` values affect the view.

```swift
enum SignalStrength {
    case Excellent
    case VeryGood
    case Good
    case Low
    case VeryLow
    case NoSignal
    case Unknown

}
```
### Color

This `UIColor` property changes the background color of the dots. This is great for inverting the color of the SignalStrengthView if it is in a selected UITableViewCell.

### Flipped

This `Bool` property changes from which side the dots will begin to fill in or empty. Setting flipped to true for right aligned views is recommended.

## Customization

`sizing` and `spacing` constants can be modified at compile time in the `SignalStrengthDotView` class.

## Author

Tanner Nelson, <me@tanner.xyz>

## License

SignalStrength is available under the MIT license. See the LICENSE file for more info.