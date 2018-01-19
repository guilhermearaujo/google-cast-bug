//
//  ViewController.swift
//  Cast
//
//  Created by Guilherme Araújo on 19/01/18.
//  Copyright © 2018 bug. All rights reserved.
//

import UIKit
import GoogleCast

class ViewController: UIViewController {

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    let button = GCKUICastButton(frame: CGRect(x: 20, y: 100, width: 40, height: 40))
    button.backgroundColor = .red
    view.addSubview(button)

    let enqueueButton = UIButton(frame: CGRect(x: 20, y: 200, width: 80, height: 40))
    enqueueButton.addTarget(self, action: #selector(enqueue), for: .touchUpInside)
    enqueueButton.setTitle("Enqueue!", for: .normal)
    enqueueButton.backgroundColor = .red
    view.addSubview(enqueueButton)
  }

  @objc func enqueue() {
    let queue: [GCKMediaQueueItem] = [newItem(), newItem(), newItem(), newItem()]
    GCKCastContext.sharedInstance()
      .sessionManager
      .currentSession?
      .remoteMediaClient?
      .queueLoad(queue, start: 0, repeatMode: .off)
  }

  func newItem() -> GCKMediaQueueItem {
    return GCKMediaQueueItem(
      mediaInformation: newMediaInfo(),
      autoplay: true,
      startTime: 0,
      playbackDuration: 0,
      preloadTime: 0,
      activeTrackIDs: nil,
      customData: nil
    )
  }

  func newMediaInfo() -> GCKMediaInformation {
    return GCKMediaInformation(
      contentID: "http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8",
      streamType: .buffered,
      contentType: "",
      metadata: nil,
      streamDuration: 0,
      mediaTracks: nil,
      textTrackStyle: nil,
      customData: nil
    )
  }
}

