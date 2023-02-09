//
//  PlayerModel.swift
//  CHALLENGE_1
//
//  Created by Aleksandr Kan on 10/02/23.
//

import Foundation
import RealmSwift

class PlayerModel: Object {
    
    @Persisted var playerName = "Default Player"
    @Persisted var levelQuestion: Int = 1
    @Persisted var date: Date
    
}
