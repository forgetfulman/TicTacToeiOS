//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Chris Taylor on 11/07/2017.
//  Copyright © 2017 Chris Taylor. All rights reserved.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    
    var playerX: Player!
    var playerO: Player!
    var game: TicTacToeGame!
    var gameBoard: TicTacToeGameBoard!
    
    override func setUp() {
        super.setUp()
        playerX = Player.init(name: "Player X", token: PlayerToken.X)
        playerO = Player.init(name: "Player O", token: PlayerToken.X)
        game = TicTacToeGame.init(name: "Test Game", playerX: playerX, playerO: playerO)
        gameBoard = TicTacToeGameBoard.init()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: Player Class Tests
    func testPlayerInitializationSucceeds() {
        XCTAssertNotNil(playerX)
    }
    
    //MARK: Game Class Tests
    func testGameInitializationSucceeds() {
        XCTAssertNotNil(game)
    }
    
    func testGameResultIsADraw() {
        let topRowMoves = [1: PlayerToken.X, 2: PlayerToken.O, 3: PlayerToken.X]
        let middleRowMoves = [1: PlayerToken.O, 2: PlayerToken.O, 3: PlayerToken.X]
        let bottomRowMoves = [1: PlayerToken.X, 2: PlayerToken.X, 3: PlayerToken.O]
        layGameBoardForTesting(topRowMoves: topRowMoves, middleRowMoves: middleRowMoves, bottomRowMoves: bottomRowMoves)
        XCTAssertTrue(game.evaluateGameStatus(gameBoard: gameBoard) == GameStatus.Draw)
    }
    
    func testPlayerXWonOnColumn() {
        let topRowMoves = [1: PlayerToken.X, 2: PlayerToken.O, 3: PlayerToken.X]
        let middleRowMoves = [1: PlayerToken.X, 2: PlayerToken.O, 3: PlayerToken.O]
        let bottomRowMoves = [1: PlayerToken.X, 2: PlayerToken.X, 3: PlayerToken.O]
        layGameBoardForTesting(topRowMoves: topRowMoves, middleRowMoves: middleRowMoves, bottomRowMoves: bottomRowMoves)
        XCTAssertTrue(game.evaluateGameStatus(gameBoard: gameBoard) == GameStatus.xWon)
    }
    
    func testPlayerYWonOnDiagonal() {
        let topRowMoves = [1: PlayerToken.O, 2: PlayerToken.X, 3: PlayerToken.X]
        let middleRowMoves = [1: PlayerToken.X, 2: PlayerToken.O, 3: PlayerToken.O]
        let bottomRowMoves = [1: PlayerToken.X, 2: PlayerToken.X, 3: PlayerToken.O]
        layGameBoardForTesting(topRowMoves: topRowMoves, middleRowMoves: middleRowMoves, bottomRowMoves: bottomRowMoves)
        XCTAssertTrue(game.evaluateGameStatus(gameBoard: gameBoard) == GameStatus.oWon)
    }
    
    func testPlayerXWonOnRow() {
        let topRowMoves = [1: PlayerToken.X, 2: PlayerToken.X, 3: PlayerToken.X]
        let middleRowMoves = [1: PlayerToken.X, 2: PlayerToken.O, 3: PlayerToken.O]
        let bottomRowMoves = [1: PlayerToken.O, 2: PlayerToken.X, 3: PlayerToken.O]
        layGameBoardForTesting(topRowMoves: topRowMoves, middleRowMoves: middleRowMoves, bottomRowMoves: bottomRowMoves)
        XCTAssertTrue(game.evaluateGameStatus(gameBoard: gameBoard) == GameStatus.xWon)
    }
    
    func testStillPlaying() {
        let topRowMoves = [1: PlayerToken.X, 3: PlayerToken.O]
        let middleRowMoves = [1: PlayerToken.O, 2: PlayerToken.X, 3: PlayerToken.O]
        let bottomRowMoves = [1: PlayerToken.X, 2: PlayerToken.O]
        layGameBoardForTesting(topRowMoves: topRowMoves, middleRowMoves: middleRowMoves, bottomRowMoves: bottomRowMoves)
        XCTAssertTrue(game.evaluateGameStatus(gameBoard: gameBoard) == GameStatus.playing)
    }
    
    func layGameBoardForTesting(topRowMoves: [Int : PlayerToken], middleRowMoves: [Int : PlayerToken], bottomRowMoves: [Int : PlayerToken]) {
        var rowNumber = 1
        for rows in [topRowMoves, middleRowMoves, bottomRowMoves] {
            for row in rows  {
                gameBoard.playTokenOnGameBoard(playedToken: row.value, column: row.key, row: rowNumber)
            }
            rowNumber += 1
        }
    }
    
    //MARK: Game Board Tests
    func testPlayerTokenPlacedOnBoardSquare() {
        gameBoard.playTokenOnGameBoard(playedToken: PlayerToken.O, column: 1, row: 1)
        XCTAssertTrue(gameBoard.topRow[1]!.token! == PlayerToken.O)
    }
    
    func test1stColumnRenderedCorrectly() {
        let topRowMoves = [1: PlayerToken.X]
        let middleRowMoves = [1: PlayerToken.O]
        let bottomRowMoves = [1: PlayerToken.O]
        layGameBoardForTesting(topRowMoves: topRowMoves, middleRowMoves: middleRowMoves, bottomRowMoves: bottomRowMoves)
        XCTAssertTrue(gameBoard.topRow[1]!.token! == PlayerToken.X
            && gameBoard.middleRow[1]!.token! == PlayerToken.O
            && gameBoard.bottomRow[1]!.token! == PlayerToken.O)
    }
    
    func testTopToBottomDiagnalRenderedCorrectly() {
        let topRowMoves = [1: PlayerToken.X]
        let middleRowMoves = [2: PlayerToken.O]
        let bottomRowMoves = [3: PlayerToken.O]
        layGameBoardForTesting(topRowMoves: topRowMoves, middleRowMoves: middleRowMoves, bottomRowMoves: bottomRowMoves)
        XCTAssertTrue(gameBoard.topRow[1]!.token! == PlayerToken.X
            && gameBoard.middleRow[2]!.token! == PlayerToken.O
            && gameBoard.bottomRow[3]!.token! == PlayerToken.O)
    }
    
}

