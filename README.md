# Listen to a codable!

With this library your distance to whole socket complexity is a single line of code.
Simple, readable, userful:

```swift

let observable: Observable<MyCodable> = socket.observe(eventName: "message_updates")

```
# But how?
This library uses PublishSubjects and if the codable model decoded successfully, then the decoded object will send into that publishSubjec and return observable version of it.

```swift

let rxSocket = RxSocketProvider().makeSocketHandler(auth:["token": "your_token"], url: your_url) // RxSocketTerminalInterface & RxSocketToggle protocols

rxSocket.start().subscribe().disposedBy(disposeBag)

rxSocket.send(eventName: "your_event_name", model: myCodable)

```

functionalities are separated into 2 different protocols:
## 1- SocketToggle

This is for connect or disconnect mostly recommended to use where you don't want to listen any model for example inside the AppDelegate.

this only allows you to connect and disconnect socket


```swift

let socketToggle: RxSocketToggle = RxSocketProvider().makeSocketHandler(auth:["token": "your_token"], url: your_url)

socketToggle.start().subscribe().disposedBy(disposeBag)

socketToggle.stop()

```

## 2- SocketMessage

This is for send and receive models in specific eventNames.

this only allows you to listen for a model or sending it on a specific event.


```swift

let socketTerminal: RxSocketTerminalInterface = RxSocketProvider().makeSocketHandler(auth:["token": "your_token"], url: your_url)

let observable: Observable<MyCodable> = socketTerminal.observe(eventName: "your_event_name")

socketTerminal.send(eventName: "your_event_name", model: myCodable)

```

# RxSocket.io

[![CI Status](https://img.shields.io/travis/behrad-kzm/RxSocket.io.svg?style=flat)](https://travis-ci.org/behrad-kzm/RxSocket.io)
[![Version](https://img.shields.io/cocoapods/v/RxSocket.io.svg?style=flat)](https://cocoapods.org/pods/RxSocket.io)
[![License](https://img.shields.io/cocoapods/l/RxSocket.io.svg?style=flat)](https://cocoapods.org/pods/RxSocket.io)
[![Platform](https://img.shields.io/cocoapods/p/RxSocket.io.svg?style=flat)](https://cocoapods.org/pods/RxSocket.io)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

  - RxSwift
  - Socket.io
  
## Installation

RxSocket.io is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxSocket.io'
```

## Author

behrad-kzm, behrad.kzm@gmail.com

## License

RxSocket.io is available under the MIT license. See the LICENSE file for more info.
