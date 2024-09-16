//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//


import AVFoundation

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft":300, "Medium":420,"Hard":720]
    
    var totleTime = 0
    var scondesPassed = 0
    
    var timer = Timer()
    
    var audioPlaye :AVAudioPlayer?

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let haradness = sender.currentTitle!
        
        totleTime = eggTimes[haradness]!
        
        timer.invalidate()
        progressBar.progress = 0
        titleLabel.text = haradness
        scondesPassed = 0

        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func updateTimer(){
        if scondesPassed < totleTime {
            print("\(scondesPassed) sconds" )
            scondesPassed += 1
            
            let precentageProgess = Float(scondesPassed) / Float(totleTime)
            progressBar.progress = precentageProgess
        } else{
            titleLabel.text = "Done!"
            timer.invalidate()
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: ".mp3")
            
            audioPlaye = try! AVAudioPlayer(contentsOf: url!)
            
            audioPlaye?.play()
        }
    }

}
