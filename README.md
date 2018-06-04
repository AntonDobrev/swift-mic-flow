# Kinvey Login with MIC (Mobile Identity Connect)

*Before you run the project:*

Remeber to:

* Run [CocoaPods](https://cocoapods.org) in Terminal with the command `pod install`
* Change the `AppDelegate.swift` file with your own `appKey` and `appSecret`, for example:

```
Kinvey.sharedClient.initialize(appKey: "my app key", appSecret: "my app secret")
```

* Change the `AppDelegate.swift` and `Info.plist` files with your own value for `redirectURI` and `URL Schemes`, for example:

AppDelegate.swift
```
let redirectURI = URL(string: "myCustomURL://")!
```

Info.plist
```
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>myCustomURL</string>
        </array>
    </dict>
</array>
```
