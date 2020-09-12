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
  
    let testview: PlayerView = .init()
    let player = AVPlayer(url: URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8")!)
    
    var User: [String] = ["test1","test2","test3"]
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(testview)
        testview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testview.heightAnchor.constraint(equalToConstant: 200),
            testview.widthAnchor.constraint(equalToConstant: 414),
            testview.topAnchor.constraint(equalTo: self.view.topAnchor),
            testview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        tableview.delegate = self
        tableview.dataSource = self
       
        testview.player = player
        
        
    }
    
//    var player = AVPlayer()
    
    
    @IBAction func button(_ sender: Any) {
       player.play()
    }
    
    @IBAction func stopButton(_ sender: Any) {
        player.pause()
    }
    
    
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = User[indexPath.row]
        return cell
    }
    
    
    
    
}
class PlayerView: UIView {
    var player: AVPlayer? {
        get { return playerLayer.player }
        set { playerLayer.player = newValue }
    }
    
    // The layer used by the player.
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    // Set the class of the layer for this view.
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}

