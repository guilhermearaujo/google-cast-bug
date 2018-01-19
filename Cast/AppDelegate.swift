//
//  AppDelegate.swift
//  Cast
//
//  Created by Guilherme Araújo on 19/01/18.
//  Copyright © 2018 bug. All rights reserved.
//

import UIKit
import GoogleCast

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    let discoveryCriteria = GCKDiscoveryCriteria(applicationID: "INSERT_APP_ID")
    let options = GCKCastOptions(discoveryCriteria: discoveryCriteria)

    GCKCastContext.setSharedInstanceWith(options)
    GCKLogger.sharedInstance().delegate = self
    GCKCastContext.sharedInstance().useDefaultExpandedMediaControls = true

    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
    let castContainerVC = GCKCastContext.sharedInstance().createCastContainerController(for: vc)
    castContainerVC.miniMediaControlsItemEnabled = true

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = castContainerVC
    window?.makeKeyAndVisible()

    let expandedControlsVC = GCKCastContext.sharedInstance().defaultExpandedMediaControlsViewController
    expandedControlsVC.setButtonType(.skipPrevious, at: 0)
    expandedControlsVC.setButtonType(.rewind30Seconds, at: 1)
    expandedControlsVC.setButtonType(.forward30Seconds, at: 2)
    expandedControlsVC.setButtonType(.skipNext, at: 3)

    return true
  }
}

extension AppDelegate: GCKLoggerDelegate {
  func logMessage(_ message: String, at level: GCKLoggerLevel, fromFunction function: String, location: String) {
    #if DEBUG
      NSLog("%@  %@", function, message)
    #endif
  }
}
