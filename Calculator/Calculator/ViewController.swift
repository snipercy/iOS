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
    
    var hasTypeingNum:Bool = false
    
    @IBAction func operate(sender: UIButton) {
        let op = sender.currentTitle!
        switch op {
        case "+": performOperation(plus)
        case "-": performOperation(minus)
        case "*": performOperation(mutiply)
        case "/": performOperation(divid)
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
    
    func plus(op1: Double, op2: Double) -> Double {
        return op1 + op2
    }
    
    func mutiply(op1: Double, op2: Double) -> Double {
        return op1 * op2
    }
    
    func divid(op1: Double, op2: Double) ->Double {
        return op2 / op1;
    }
    
    func minus(op1: Double, op2: Double) ->Double {
        return op2 - op1
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if hasTypeingNum  {
            display.text = display.text! + digit
        } else {
            display.text = digit
            hasTypeingNum = true
        }
    }
    
    // Array 动态数组，数组大小以2为倍数增长
    // 同c++中std::vector<T> 类似
    var operandStack = Array<Double>()
    
    // enter button
    @IBAction func enter() {
        hasTypeingNum = false;
        operandStack.append(displayValue)
        
        // for debug
        print("operandStack=", operandStack.last!)
        print("array size : ", operandStack.capacity)
    }
    
    // clear button
    @IBAction func clear()
    {
        operandStack.removeAll()
        // print("new array size : ", operandStack.capacity) -> 0
        
        display.text = "0"
        hasTypeingNum = false
    }
    
    var displayValue:Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            hasTypeingNum = false
        }
    }
    
    
}

