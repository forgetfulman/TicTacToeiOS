//
//  Player.swift
//  TicTacToe
//
//  Created by Chris Taylor on 14/07/2017.
//  Copyright © 2017 Chris Taylor. All rights reserved.
//

import UIKit

class Player {
    
    //MARK: Properties
    
    var playerName: String
    var playerToken: PlayerToken
    
    //MARK: Initialization
    
    init(name: String, token: PlayerToken) {
        self.playerName = name
        self.playerToken = token
    }
    
}

