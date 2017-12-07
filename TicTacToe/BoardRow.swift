//
//  BoardRow.swift
//  TicTacToe
//
//  Created by Chris Taylor on 24/07/2017.
//  Copyright © 2017 Chris Taylor. All rights reserved.
//

import UIKit

class BoardRow {
    
    //MARK: Properties
    
    var firstSquare: BoardSquare
    var secondSquare: BoardSquare
    var thirdSquare: BoardSquare
    
    //MARK: Initialization
    
    init() {
        self.firstSquare = BoardSquare()
        self.secondSquare = BoardSquare()
        self.thirdSquare = BoardSquare()
    }
    
    init(firstSquare: BoardSquare, secondSquare: BoardSquare, thirdSquare: BoardSquare) {
        self.firstSquare = firstSquare
        self.secondSquare = secondSquare
        self.thirdSquare = thirdSquare
    }
    
    //MARK: Behaviour
    
    func rowSquares () -> [BoardSquare] {
        return [firstSquare, secondSquare, thirdSquare]
    }
    
}
