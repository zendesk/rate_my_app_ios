:warning: *Use of this software is subject to important terms and conditions as set forth in the License file* :warning:

# Zendesk Sample Apps for iOS

## Description
This repository provides you with an open-source alternative to the "Rate My App" feature of versions
1.x of the Zendesk Support SDK for iOS. It is a simple example with no integration with or 
dependency on the Zendesk platform.    
 
## Owners
If you have any questions please email support@zendesk.com.
 
## Getting Started
To include this replacement for ZendeskSDK RateMyApp in your app, add `RMAReplacement` (`.swift` or `.h .m`).  

Then, in a view controller add:

```swift
if #available(iOS 10.3, *) {
    SKStoreReviewController.requestReview()
} else {
    let rma = RMAReplacement(appVersion: "1.0.1")
    rma.displayRMA(with: self)
}
```
This will result in the Store Kit review UI for iOS versions 10.3+. Bellow iOS 10.3 an alert will be displayed which will take a user to the app store or open up the ticket creation UI from ZendeskSDK.

## Running the example

The example uses [Cocoapods](https://cocoapods.org/) to install ZendeskSDK. 
Run the following to get started:
```
$ pod install
```
Then build and run the example project.

## Contributions
Pull requests are welcome.
 
## Bugs
Please submit bug reports to [Zendesk](https://support.zendesk.com/requests/new).
 
