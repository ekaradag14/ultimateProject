//
//  textToSpeechViewController.swift
//  ultimateProject
//
//  Created by Erencan Karadağ on 1.05.2020.
//  Copyright © 2020 Erencan Karadağ. All rights reserved.
//


import UIKit
import AVFoundation

class TextToSpeechViewController: UIViewController  {
    
    @IBOutlet weak var textToBeSpeaked: UITextField!
    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.textToBeSpeaked.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        if let text = textToBeSpeaked.text {
            SpeechService.shared.speak(text: text ) {
                // Finished speaking
            }
        }
        
    }
}
