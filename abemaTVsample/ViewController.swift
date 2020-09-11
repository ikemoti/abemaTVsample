//
//  ViewController.swift
//  abemaTVsample
//
//  Created by Sousuke Ikemoto on 2020/09/10.
//  Copyright © 2020 Sousuke Ikemoto. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        // 動画ファイルのURLを取得
//              let url = URL(string: "https://devimages.apple.com.edgekey.net/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8")
//
//              // 生成
//              let player = AVPlayer(url: url!)
//
//              // レイヤーの追加
//              let playerLayer = AVPlayerLayer(player: player)
//              playerLayer.frame = self.view.bounds
//              self.view.layer.addSublayer(playerLayer)
//
//              // 再生
//              player.play()
    }
    @IBAction func button(_ sender: Any) {
        guard let url = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8") else {
            return
        }

        // Create an AVPlayer, passing it the HTTP Live Streaming URL.
        let player = AVPlayer(url: url)

        // Create a new AVPlayerViewController and pass it a reference to the player.
        let controller = AVPlayerViewController()
        controller.player = player

        // Modally present the player and call the player's play() method when complete.
        present(controller, animated: true) {
            player.play()
        }
        
        
        
    }
    

}

