//
//  Sounds + Extensions.swift
//  CHALLENGE_1
//
//  Created by Sergey Azimov on 07.02.2023.
//

import UIKit
import AVFoundation

class PreMadeSounds {
   
   
    
  
    private var soundsGame: AVAudioPlayer?
    private var soundAnswer: AVAudioPlayer?
    private var soundGoing:  AVAudioPlayer?
    
    func timeGoing(AVPlayer: AVAudioPlayer?) {
        guard let path = Bundle.main.path(forResource: "timeGoing.mp3", ofType: nil) else { return }
        let url = URL(fileURLWithPath: path)
        do {
            soundsGame = try AVAudioPlayer(contentsOf: url)
            soundsGame?.play()
        } catch {
            
        }
    }
    
    
    func timeGing() {
        guard let path = Bundle.main.path(forResource: "timeGoing.mp3", ofType: nil) else { return }
        let url = URL(fileURLWithPath: path)
        do {
            soundsGame = try AVAudioPlayer(contentsOf: url)
            soundsGame?.play()
            if  soundsGame?.duration == 30 {
                soundsGame?.stop()
            }
        } catch {
            
        }
    }
    
    
    
    //напишите название необходимой мелодии
    func answer(nameSoundMP3: String) {

        let pathAnswer = Bundle.main.path(forResource: nameSoundMP3, ofType: nil) ?? "nil sound"
       
        let urlAnswer = URL(fileURLWithPath: pathAnswer)
        do {
            soundAnswer = try AVAudioPlayer(contentsOf: urlAnswer)
           
            if soundsGame!.isPlaying {
                soundAnswer?.play()
                soundsGame?.stop()
            }
            } catch {
                
            }
            
        }
    }
