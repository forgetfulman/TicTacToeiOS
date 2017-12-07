//
//  TicTacToeGameBoard.swift
//  TicTacToe
//
//  Created by Chris Taylor on 14/07/2017.
//  Copyright © 2017 Chris Taylor. All rights reserved.
//

import UIKit

struct TicTacToeGameBoard {
    
    //MARK: Properties
    
    var topRow: [Int: BoardSquare] = [:]
    var middleRow: [Int: BoardSquare] = [:]
    var bottomRow: [Int: BoardSquare] = [:]
    
    //MARK: Initialization
    
    init() {
        for rowPosition in 1...3 {
            self.topRow[rowPosition] = BoardSquare()
            self.middleRow[rowPosition] = BoardSquare()
            self.bottomRow[rowPosition] = BoardSquare()
        }
    }
    
    //MARK: Behaviour
    
    func boardLines () -> [BoardRow] {
        let firstRow = BoardRow(firstSquare: topRow[1]!, secondSquare: topRow[2]!, thirdSquare: topRow[3]!)
        let secondRow = BoardRow(firstSquare: middleRow[1]!, secondSquare: middleRow[2]!, thirdSquare: middleRow[3]!)
        let thirdRow = BoardRow(firstSquare: bottomRow[1]!, secondSquare: bottomRow[2]!, thirdSquare: bottomRow[3]!)
        let topToBottomDiagonal = BoardRow(firstSquare: topRow[1]!, secondSquare: middleRow[2]!, thirdSquare: bottomRow[3]!)
        let bottomToTopDiagnoal = BoardRow(firstSquare: bottomRow[3]!, secondSquare: middleRow[2]!, thirdSquare: topRow[1]!)
        let firstColumn = BoardRow(firstSquare: topRow[1]!, secondSquare: middleRow[1]!, thirdSquare: bottomRow[1]!)
        let secondColumn = BoardRow(firstSquare: topRow[2]!, secondSquare: middleRow[2]!, thirdSquare: bottomRow[2]!)
        let thirdColumn = BoardRow(firstSquare: topRow[3]!, secondSquare: middleRow[3]!, thirdSquare: bottomRow[3]!)
        return [firstRow, secondRow, thirdRow, topToBottomDiagonal, bottomToTopDiagnoal, firstColumn, secondColumn, thirdColumn]
    }
    
    func playTokenOnGameBoard (playedToken: PlayerToken, column: Int, row: Int) {
        switch row {
        case 1:
            topRow[column]?.layToken(token: playedToken)
        case 2:
            middleRow[column]?.layToken(token: playedToken)
        case 3:
            bottomRow[column]?.layToken(token: playedToken)
        default:
            print("Invalid play made!")
        }
    }
    
}
