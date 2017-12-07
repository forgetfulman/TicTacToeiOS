//
//  BoardSquare.swift
//  TicTacToe
//
//  Created by Chris Taylor on 24/07/2017.
//  Copyright © 2017 Chris Taylor. All rights reserved.
//

import UIKit

class BoardSquare {
    
    //MARK: Properties
    
    var token: PlayerToken?
    
    //MARK: Initialization
    
    init() {
        self.token = nil
    }
    
    //MARK: Behaviour
    
    func layToken (token: PlayerToken) {
        self.token = token
    }
    
}
