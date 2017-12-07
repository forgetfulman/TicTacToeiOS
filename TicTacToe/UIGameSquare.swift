//
//  UIGameSquare.swift
//  TicTacToe
//
//  Created by Chris Taylor on 13/08/2017.
//  Copyright © 2017 Chris Taylor. All rights reserved.
//

import UIKit

class UIGameSquare: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        UIColor.orange.setFill()
        path.fill()
    }

}
