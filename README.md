# Listen to a codable!

With this library your distance to whole socket complexity is a single line of code.
Simple, readable, userful:

```swift

let observable: Observable<MyCodable> = socket.observe(eventName: "message_updates")

```
# But how?
This library uses PublishSubjects and if the codable model decoded successfully, then the decoded object will send into that publishSubjec and return observable version of it.

functionalities are separated into 2 different protocols:
## 1- SocketToggle

This is for connect or disconnect mostly recommended to use where you don't want to listen any model for example inside the AppDelegate.

## 2- SocketMessage

This is for send and receive models in specific eventNames.
