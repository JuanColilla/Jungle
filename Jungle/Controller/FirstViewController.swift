//
//  FirstViewController.swift
//  JungleApp
//
//  Created by Alumne on 07/05/2019.
//  Copyright © 2019 GRV. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBAction func changeVolume(_ sender: UISlider) {
        
        audioPlayer?.setVolume(sender.value, fadeDuration: 0.1)
    }
    @IBAction func actionButtons(_ sender: UIButton) {
        
        let index = sender.tag
        
        switch index {
        case 0:
            audioPlayer?.play()
        case 1:
            audioPlayer?.stop()
        case 2:
            audioPlayer?.currentTime = 0
            audioPlayer?.stop()
        default:
            break
        }
    }
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let path = Bundle.main.path(forResource: "jungle_music", ofType: "mp3") else { return }
        
        let url = URL(fileURLWithPath: path)
        audioPlayer = try? AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
        audioPlayer?.prepareToPlay()
        audioPlayer?.setVolume(volumeSlider.value, fadeDuration: 0.1)
        audioPlayer?.play()
    }


}

