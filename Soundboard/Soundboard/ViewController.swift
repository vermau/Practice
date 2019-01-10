//
//  ViewController.swift
//  Soundboard
//
//  Created by Ujjwal Verma on 10/1/19.
//  Copyright © 2019 Ujjwal Verma. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    let sounds = ["a", "b", "c", "d"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonTouched(_ sender: UIButton) {
        let tag = sender.tag
        
        playSound(fileName: sounds[tag])
    }
    
    fileprivate func playSound(fileName: String) {
        let url = Bundle.main.url(forResource: fileName, withExtension: "mp3")
        
        // - Making sure that url is not nil
        guard url != nil else {
            return
        }
        
        // - Create the audio player and play the sound file
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            audioPlayer?.play()
        } catch {
            print("Error")
        }

    }
}

