//
//  RealmManager.swift
//  CHALLENGE_1
//
//  Created by Aleksandr Kan on 10/02/23.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    private init() {  }
    
    private let localRealm = try! Realm()
    
    func  savePlayerModel(_ model: PlayerModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
}
