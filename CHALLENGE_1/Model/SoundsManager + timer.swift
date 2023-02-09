//
//  Sounds + Extensions.swift
//  CHALLENGE_1
//
//  Created by Sergey Azimov on 07.02.2023.
//

import UIKit
import AVFoundation

class PreMadeSounds {
   
    
    
    private var gameGoing: AVAudioPlayer?
    private var answerAccepted: AVAudioPlayer?
    private var soundsAnswer:  AVAudioPlayer?
    
    func timeGoing(AVPlayer: AVAudioPlayer?) {
        guard let path = Bundle.main.path(forResource: "timeGoing.mp3", ofType: nil) else { return }
        let url = URL(fileURLWithPath: path)
        do {
            gameGoing = try AVAudioPlayer(contentsOf: url)
            gameGoing?.play()
        } catch {
            
        }
    }
    
    func answerAccepted(AVPlayer: AVAudioPlayer?) {
        guard let path = Bundle.main.path(forResource: "timeGoing.mp3", ofType: nil) else { return }
        let url = URL(fileURLWithPath: path)
        do {
            answerAccepted = try AVAudioPlayer(contentsOf: url)
            answerAccepted?.play()
        } catch {
            
        }
    }
    
    func timeGing() {
        guard let path = Bundle.main.path(forResource: "timeGoing.mp3", ofType: nil) else { return }
        let url = URL(fileURLWithPath: path)
        do {
             soundsAnswer = try AVAudioPlayer(contentsOf: url)
            soundsAnswer?.play()
        } catch {
            
        }
    }
    
    }
