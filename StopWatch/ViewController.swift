//
//  ViewController.swift
//  StopWatch
//
//  Created by Apple on 2019/01/28.
//  Copyright © 2019年 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var miSecLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    weak var timer: Timer!
    var startTime = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonTapped(_ sender: Any) {
        startTime = Date()
        
        if startButton.currentTitle == "Start!"{
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: #selector(self.timeCounter),
                userInfo: nil,
                repeats: true)

            
            startButton.setTitle("Pause", for: UIControlState.normal)
            
        }else if startButton.currentTitle == "Pause"{
            timer.invalidate()
            
            startButton.setTitle("Restart", for: UIControlState.normal)
            
        }else{
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: #selector(self.timeCounter),
                userInfo: nil,
                repeats: true)

            startButton.setTitle("Pause", for: UIControlState.normal)
        }
    }
    
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        timer.invalidate()
        
        minLabel.text = "00"
        secLabel.text = "00"
        miSecLabel.text = "00"
        
        startButton.setTitle("Start!", for: UIControlState.normal)
    }
    
    @objc func timeCounter(){
        let currentTime = Date().timeIntervalSince(startTime)
        
        let currentMin = Int(currentTime/60)
        let currentSec = Int(currentTime) % 60
        let currentMiSec = Int(currentTime*100) % 100
        
        minLabel.text = String(format: "%02d", currentMin)
        secLabel.text = String(format: "%02d", currentSec)
        miSecLabel.text = String(format: "%02d", currentMiSec)
    }
    
}













