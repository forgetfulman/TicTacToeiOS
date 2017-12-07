//
//  TicTacToeGame.swift
//  TicTacToe
//
//  Created by Chris Taylor on 14/07/2017.
//  Copyright © 2017 Chris Taylor. All rights reserved.
//

import UIKit

class TicTacToeGame {
    
    //MARK: Properties
    
    var gameName: String
    var playerX: Player
    var playerO: Player
    var currentGameStatus: GameStatus
    
    //MARK: Initialization
    
    init(name: String, playerX: Player, playerO: Player) {
        self.gameName = name
        self.playerO = playerO
        self.playerX = playerX
        self.currentGameStatus = GameStatus.notStarted
    }
    
    func evaluateGameStatus (gameBoard: TicTacToeGameBoard) -> GameStatus {
        var allSquaresPlayed: Bool = true
        for boardLine in gameBoard.boardLines() {
            let rowPlayedCount = boardLine.rowSquares().flatMap { boardSquare in return boardSquare.token }.count
            allSquaresPlayed = allSquaresPlayed && rowPlayedCount == 3
            var lineSquares = Set<PlayerToken>()
            boardLine.rowSquares().forEach { (boardSquare) in if boardSquare.token != nil { lineSquares.insert(boardSquare.token!) } }
            if rowPlayedCount == 3 && lineSquares.count == 1 {
                return lineSquares.first == PlayerToken.X ? GameStatus.xWon : GameStatus.oWon
            }
        }
        return allSquaresPlayed ? GameStatus.Draw : GameStatus.playing
    }
}
