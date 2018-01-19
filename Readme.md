# Google Cast SDK Bug
Skip previous and Skip next don't work.

## Steps to reproduce
1. Clone this repo
1. Run `pod install` to install dependencies
1. Open `AppDelegate.swift` and replace the Chromecast Applicatio ID with one of yours
1. Run on a device
1. Connect to a Chromecast
1. Tap `Enqueue!` to enqueue a list of 4 items
1. Tap the mini controller to open the expanded controller
1. Tap the skip buttons

## Logs
When I press the skip next button, the project outputs the following log messages:
```
-[GCKMediaControlChannel didReceiveTextMessage:]  Received unexpected error: Invalid Request.
-[GCKUIMediaController request:didFailWithError:]  request [incremental number] failed with error Error Domain=com.google.cast.GCKError Code=4 "Invalid request" UserInfo={NSLocalizedDescription=Invalid request}
```
