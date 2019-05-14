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
    
    @IBOutlet weak var hyena: UIImageView!
    @IBOutlet weak var lion: UIImageView!
    @IBOutlet weak var bird: UIImageView!
    @IBOutlet weak var hippo: UIImageView!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var speakerImageView: UIImageView!
    

    var audioPlayer: AVAudioPlayer?
    var onDemandAudioPlayer: AVAudioPlayer?
    var onDemandPath: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        speakerImageView.image = UIImage.animatedImage(with: [UIImage(named: "Speaker 1"), UIImage(named: "Speaker 2"), UIImage(named: "Speaker 3"), UIImage(named: "Speaker 2"), UIImage(named: "Speaker 1")] as! [UIImage], duration: 1.5)
        
        let url = URL(string: Bundle.main.path(forResource: "jungle_music", ofType: "mp3")!)
        audioPlayer = try? AVAudioPlayer(contentsOf: url!, fileTypeHint: nil)
        audioPlayer?.prepareToPlay()
        audioPlayer?.setVolume(volumeSlider.value, fadeDuration: 0.1)
        audioPlayer?.play()
        speakerImageView.startAnimating()
        
    }
    
    @IBAction func changeVolume(_ sender: UISlider) {
        audioPlayer?.setVolume(sender.value, fadeDuration: 0.1)
    }
    
    @IBAction func actionButtons(_ sender: UIButton) {
        
        let index = sender.tag
        
        switch index {
        case 0:
            speakerImageView.image = UIImage.animatedImage(with: [UIImage(named: "Speaker 1"), UIImage(named: "Speaker 2"), UIImage(named: "Speaker 3"), UIImage(named: "Speaker 2"), UIImage(named: "Speaker 1")] as! [UIImage], duration: 1.5)
            audioPlayer?.play()
            speakerImageView.startAnimating()
            
        case 1:
            audioPlayer?.stop()
            speakerImageView.stopAnimating()
            speakerImageView.image = UIImage(named: "Speaker OFF")
            
        case 2:
            audioPlayer?.currentTime = 0
            speakerImageView.stopAnimating()
            speakerImageView.image = UIImage(named: "Speaker OFF")
            audioPlayer?.stop()
            onDemandAudioPlayer?.stop()
        default:
            break
        }
    }
    
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        playSoundsOnDemand(animalID: sender.view?.tag ?? 0)
    }
    
 
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
            self.dropDown()
    }
    
    @IBAction func tapTwiceToRun(_ sender: UITapGestureRecognizer) {
            self.runawayFromHere()
            onDemandAudioPlayer?.stop()
    }
    
    
    func playSoundsOnDemand(animalID: Int) {
        onDemandAudioPlayer?.setVolume(volumeSlider.value, fadeDuration: 0.1)
        switch animalID {
        case 1:
            onDemandPath = URL(string: Bundle.main.path(forResource: "hyena", ofType: "mp3")!)
            onDemandAudioPlayer = try? AVAudioPlayer(contentsOf: onDemandPath!, fileTypeHint: nil)
            onDemandAudioPlayer?.prepareToPlay()
            onDemandAudioPlayer?.setVolume(volumeSlider.value, fadeDuration: 0.1)
            onDemandAudioPlayer?.play()
        case 2:
            onDemandPath = URL(string: Bundle.main.path(forResource: "lion", ofType: "mp3")!)
            onDemandAudioPlayer = try? AVAudioPlayer(contentsOf: onDemandPath!, fileTypeHint: nil)
            onDemandAudioPlayer?.prepareToPlay()
            onDemandAudioPlayer?.setVolume(volumeSlider.value, fadeDuration: 0.1)
            onDemandAudioPlayer?.play()
        case 3:
            onDemandPath = URL(string: Bundle.main.path(forResource: "bird", ofType: "mp3")!)
            onDemandAudioPlayer = try? AVAudioPlayer(contentsOf: onDemandPath!, fileTypeHint: nil)
            onDemandAudioPlayer?.prepareToPlay()
            onDemandAudioPlayer?.setVolume(volumeSlider.value, fadeDuration: 0.1)
            onDemandAudioPlayer?.play()
        case 4:
            onDemandPath = URL(string: Bundle.main.path(forResource: "hippo", ofType: "mp3")!)
            onDemandAudioPlayer = try? AVAudioPlayer(contentsOf: onDemandPath!, fileTypeHint: nil)
            onDemandAudioPlayer?.prepareToPlay()
            onDemandAudioPlayer?.setVolume(volumeSlider.value, fadeDuration: 0.1)
            onDemandAudioPlayer?.play()
        default:
            print("Nothing...")
        }
    }
    
    // LINKED TO ANIMATION
    func dropDown() {
        let duration = 0.75
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.hyena.center.y += 500
            self.lion.center.y += 500
            self.bird.center.y += 200
            self.hippo.center.y += 200
        }, completion: { if $0 == .end {
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.hyena.center.y -= 500
                self.lion.center.y -= 500
                self.bird.center.y -= 200
                self.hippo.center.y -= 200},
            completion: nil)
            }})
    }


    func runawayFromHere() {
        let duration = 0.75
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.hyena.center.y -= 400
            self.hyena.center.x -= 400
            self.lion.center.y -= 400
            self.lion.center.x += 400
            self.bird.center.y += 400
            self.bird.center.x -= 400
            self.hippo.center.y += 400
            self.hippo.center.x += 400
        }, completion: { if $0 == .end {
            UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.hyena.center.y += 400
                self.hyena.center.x += 400
                self.lion.center.y += 400
                self.lion.center.x -= 400
                self.bird.center.y -= 400
                self.bird.center.x += 400
                self.hippo.center.y -= 400
                self.hippo.center.x -= 400},
                                                           completion: nil)
            }})
    }

}
