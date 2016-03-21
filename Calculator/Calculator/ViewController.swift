//
//  ViewController.swift
//  Calculator
//
//  Created by cy on 16/3/18.
//  Copyright © 2016年 c. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var hasTypingNum:Bool = false
    
    @IBAction func operate(sender: UIButton) {
        if hasTypingNum {
            enter()
        }
        
        let op = sender.currentTitle!
        switch op {
        case "+": performOperation( {(op1: Double, op2: Double) -> Double in
            return op1 + op2
        })
        case "-": performOperation() {$1 - $0}
        case "*": performOperation {$0 * $1}
        case "/": performOperation({$1 / $0})
        case "√": performOperation {sqrt($0)}
        default:break
        } // switch
    }
    
    // operation是函数，在swift中函数也是一中类型
    // 该函数有两个double参数，返回值为double
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    // 函数的多态性
    // 函数的参数个数不同
    @nonobjc
    func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if hasTypingNum  {
            display.text = display.text! + digit
        } else {
            display.text = digit
            hasTypingNum = true
        }
    }
    
    // Array 动态数组，数组大小以2为倍数增长
    // 同c++中std::vector<T> 类似
    var operandStack = Array<Double>()
    
    // enter button
    @IBAction func enter() {
        hasTypingNum = false;
        operandStack.append(displayValue)
        
        // for debug
        print("operandStack=", operandStack)
        print("array size : ", operandStack.capacity)
    }
    
    // clear button
    @IBAction func clear()
    {
        operandStack.removeAll()
        // print("new array size : ", operandStack.capacity) -> 0
        
        display.text = "0"
        hasTypingNum = false
    }
    
    var displayValue:Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            hasTypingNum = false
        }
    }
    
    
}

