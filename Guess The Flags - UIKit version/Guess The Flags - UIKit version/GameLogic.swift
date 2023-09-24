//
//  GameLogic.swift
//  Guess The Flags - UIKit version
//
//  Created by Oleg Zhovtanskyi on 24/09/2023.
//

import UIKit

struct GameLogic {
    
     let flags = ["andora", "argentina", "armenia", "australia", "austria", "barbados", "belgium", "brazil", "canada", "chechia", "china", "columbia", "denmark", "estonia", "finland", "france", "georgia", "germany", "greece", "india", "israel", "italy", "japan", "latvia", "lithuania", "luxembourg", "norway", "poland", "sweden", "switzerland", "uk", "ukraine", "us"]
    
    
    
    
    func setUpImageForButton () -> String {
        let random = Int.random(in: 0...flags.count - 1)
        return flags[random]
    }
}
