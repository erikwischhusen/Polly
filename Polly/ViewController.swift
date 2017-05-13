//
//  ViewController.swift
//  Polly
//
//  Created by Erik Wischhusen on 5/12/17.
//  Copyright © 2017 Erik Wischhusen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var message: UITextField!
    @IBOutlet weak var delayCnt: UITextField!
    @IBOutlet weak var repeatCnt: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        try? AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sayIt() {
        var repeatCount : Int!
        var delayLength : TimeInterval!
        repeatCount = Int(self.repeatCnt.text!)
        delayLength = TimeInterval(self.delayCnt.text!)
        let synthesizer = AVSpeechSynthesizer()
        
        for _ in 1...repeatCount {
            let utterence = AVSpeechUtterance(string: self.message.text!)
            utterence.rate = 0.4
            utterence.postUtteranceDelay = delayLength
            synthesizer.speak(utterence)
        }
    }


}

