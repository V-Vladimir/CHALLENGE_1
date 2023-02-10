//
//  Sounds + Extensions.swift
//  CHALLENGE_1
//
//  Created by Sergey Azimov on 07.02.2023.
//

import UIKit
import AVFoundation


enum SoundsName {
    case answerAccepted,timeGoing,answerCorrect,answerWrong,mainSound

    var sound: URL {
        switch self {
        case .answerAccepted: return URL(fileURLWithPath:  Bundle.main.path(forResource: "answerAccepted", ofType: "mp3")!)
        case .timeGoing: return URL(fileURLWithPath:  Bundle.main.path(forResource: "timeGoing", ofType: "mp3")!)
        case .answerCorrect: return URL(fileURLWithPath:  Bundle.main.path(forResource: "answerCorrect", ofType: "mp3")!)
        case .answerWrong: return URL(fileURLWithPath:  Bundle.main.path(forResource: "answerWrong", ofType: "mp3")!)
        case .mainSound: return URL(fileURLWithPath:  Bundle.main.path(forResource: "mainSound", ofType: "mp3")!)
        }
    }
}

class SoundManager {
    private let question = CQuestions()
    var player = AVAudioPlayer()
   
    func mistakePlay() {
        if !question.isMakeMistake() {
            playSound(urlSound: .answerCorrect)
        } else if question.isMakeMistake() {
            playSound(urlSound: .answerWrong)
        }
    }
    
    
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
            player.stop()
            player = try AVAudioPlayer(contentsOf: urlSound.sound)
            player.play()
            
        } catch {
            print("error url Sound")
        }
    }
    
        }
