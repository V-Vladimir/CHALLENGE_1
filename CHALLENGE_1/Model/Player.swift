//
//  Player.swift
//  CHALLENGE_1
//
//  Created by Aleksandr Kan on 10/02/23.
//

import Foundation

struct Player {
    
    var name = "Defult player" {
        didSet { date = Date() }
    }
    var questionLevel = 1
    private(set) var date = Date()
    
    mutating func reset() {
        name = "Defult player"
        questionLevel = 1
        date = Date()
    }
}
