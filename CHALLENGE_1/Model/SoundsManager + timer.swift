//
//  Sounds + Extensions.swift
//  CHALLENGE_1
//
//  Created by Sergey Azimov on 07.02.2023.
//

import UIKit
import AVFoundation


enum SoundsName {
    case answerAccepted,timeGoing,answerCorrect,answerWrong
    
    var sound: URL {
        switch self {
        case .answerAccepted: return URL(fileURLWithPath:  Bundle.main.path(forResource: "answerAccepted", ofType: "mp3")!)
        case .timeGoing: return URL(fileURLWithPath:  Bundle.main.path(forResource: "timeGoing", ofType: "mp3")!)
        case .answerCorrect: return URL(fileURLWithPath:  Bundle.main.path(forResource: "answerCorrect", ofType: "mp3")!)
        case .answerWrong: return URL(fileURLWithPath:  Bundle.main.path(forResource: "answerWrong", ofType: "mp3")!)
        }
    }
}

class SoundManager {
    private let question = CQuestions()
    
    var player = AVAudioPlayer()
    var IsTimeOver = false
    
    private var timer: Timer?
    var seconds = 5
    
 
    func playSound(urlSound: SoundsName) {
        do {
            player = try AVAudioPlayer(contentsOf: urlSound.sound)
            player.play()
        } catch {
            print("error url Sound")
        }
    }
    
    
    func answer(urlSound: SoundsName) {
        do {
            stopTimer()
            player.stop()
            player = try AVAudioPlayer(contentsOf: urlSound.sound)
            player.play()
        } catch {
            print("error url Sound")
        }
    }
    
    func startTimer() {
        playSound(urlSound: .timeGoing)
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeGone), userInfo: nil, repeats: true)
        seconds = 5
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func timeGone() {
        seconds -= 1
        print(seconds)
        if seconds == 0 {
            player.stop()
            playSound(urlSound: .answerWrong)
            stopTimer()
        }
    
    }
}
