//
//  Player.swift
//  CHALLENGE_1
//
//  Created by Aleksandr Kan on 10/02/23.
//

import Foundation

struct Player {
    
    var name = "Defult player"
    var questionLevel = 1
    var money = 0
    var date: Date
    
    init(name: String = "Defult player") {
        self.name = name
        self.date = Date()
    }
    
}
