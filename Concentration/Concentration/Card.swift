//
//  Card.swift
//  Concentration
//
//  Created by Artsiom Sadyryn on 9/30/18.
//  Copyright © 2018 Artsiom Sadyryn. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    var hashValue: Int {
        return identifier
    }
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
