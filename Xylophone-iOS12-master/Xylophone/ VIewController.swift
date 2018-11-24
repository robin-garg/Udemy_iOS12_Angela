//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        let soundFile = String(format: "note%i", sender.tag)
        play(sound: soundFile)
    }
    
    func play(sound soundFile: String) {
        let url = Bundle.main.url(forResource: soundFile, withExtension: "wav")
        
        do {
            player = try AVAudioPlayer(contentsOf: url!)
        } catch {
            // couldn't load file :(
            print(error)
        }
        player?.play()

    }

}

