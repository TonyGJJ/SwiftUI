//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by Tony on 2019/12/27.
//  Copyright © 2019 Tony. All rights reserved.
//

import Foundation
import UIKit

enum CalculatorButtonItem {
    enum Operation: String {
        case plus = "+"
        case minus = "-"
        case divide = "÷"
        case multiply = "×"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Operation)
    case command(Command)
}

extension CalculatorButtonItem: Hashable {
    var title:String {
        switch self {
        case .digit(let value):
            return String(value)
        case .dot:
            return "."
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        }
    }
    
    var size: CGSize {
        if case .digit(let value) = self, value == 0 {
            return CGSize(width: 88 * 2 + 8, height: 88)
        }
        return CGSize(width: 88, height: 88)
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit, .dot:
            return "digit.background"
        case .op:
            return "operator.background"
        case .command:
            return "command.foreground"
        }
    }
}
