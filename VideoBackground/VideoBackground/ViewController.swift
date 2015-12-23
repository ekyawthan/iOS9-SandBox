//
//  ViewController.swift
//  VideoBackground
//
//  Created by Kyaw Than Mong on 12/22/15.
//  Copyright © 2015 Meera Solution. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    var videoPlayer : AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.layer.cornerRadius = 4
        
        if let videoResourceURL = NSBundle.mainBundle().URLForResource("login", withExtension: "mov") {
            videoPlayer = AVPlayer(URL: videoResourceURL)
            videoPlayer?.actionAtItemEnd = .None
            videoPlayer?.muted = true
            let playerLayer = AVPlayerLayer(player: videoPlayer)
            playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            playerLayer.zPosition = -1
            playerLayer.frame = self.view.frame
            view.layer.addSublayer(playerLayer)
            videoPlayer?.play()
            
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "loopVideo", name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func loopVideo() {
        videoPlayer?.seekToTime(kCMTimeZero)
        videoPlayer?.play()
    }

}

