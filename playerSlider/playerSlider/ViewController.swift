//
//  ViewController.swift
//  playerSlider
//
//  Created by Максим Вильданов on 21.03.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var player = AVAudioPlayer()
    var temp = Timer()
    var play = UIImage(named: "play.png")
    var pause = UIImage(named: "pause.png")
// outlets
    @IBOutlet weak var sliderTimeDuration: UISlider!
    @IBOutlet weak var sliderVolume: UISlider!
    
    @IBOutlet weak var labelTime: UILabel!
    
    @IBOutlet weak var labelTimeToEnd: UILabel!
    @IBOutlet weak var playStopBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderTimeDuration.addTarget(self, action: #selector(timeDur), for: .valueChanged)
        do {
            if let audiopath = Bundle.main.path(forResource: "forest the people – pumped up kicks", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audiopath))
            
            }
        } catch {
            print("Error!")
        }
        player.play()
        self.sliderTimeDuration.maximumValue = Float(player.duration)
        temp = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        sliderTimeDuration.value = Float(player.currentTime)
        let timeInterval = ceil((Float(player.currentTime)))
        let timeEndInterval = ceil((Float(player.duration)))
        let timeMinute = Int(timeInterval / 60)
        let timeEndMinute = Int(timeEndInterval / 60) - 1 - timeMinute
        let timeSec = Int(timeInterval - Float(timeMinute * 60))
        let timeEndSec = 60 - timeSec
        let strtimeMinute = timeMinute > 9 ? String(timeMinute) : "0" + String(timeMinute)
        let strtimeEndMinute = timeEndMinute > 9 ? String(timeEndMinute) : "0" + String(timeEndMinute)
        let strtimeSec = timeSec  > 9 ? String(timeSec) : "0" + String(timeSec)
        let strtimeEndSec = timeEndSec  > 9 ? String(timeEndSec) : "0" + String(timeEndSec)
        let stringTime = strtimeMinute + ":" + strtimeSec
        let stringEndTime = "-" + strtimeEndMinute + ":" + strtimeEndSec
        labelTime.text = stringTime
        labelTimeToEnd.text = stringEndTime
    }
// actions
    @IBAction func sliderSongAction(_ sender: UISlider) {
        
    }
    @IBAction func sliderAction(_ sender: Any) {
        player.volume = sliderVolume.value
    }

 
    @IBAction func playAndStopAction(_ sender: UIButton) {
        if player.isPlaying {
            player.stop()
            playStopBut.setImage(self.play, for: .normal)
        } else {
            player.play()
            playStopBut.setImage(self.pause, for: .normal)
        }
    }
    
    
    @objc func timeDur(sender: UISlider) {
            if sender == sliderTimeDuration {
            self.player.currentTime = TimeInterval(sender.value)
            
        }
    }
    
}

