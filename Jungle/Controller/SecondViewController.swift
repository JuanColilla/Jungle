//
//  SecondViewController.swift
//  JungleApp
//
//  Created by Alumne on 07/05/2019.
//  Copyright © 2019 GRV. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class SecondViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //Load the files
        let path = Bundle.main.path(forResource: "Jungle", ofType: "mp4")
        
        let videoURL = URL(fileURLWithPath: path!)
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        self.present(playerViewController, animated: true){
            playerViewController.player?.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

