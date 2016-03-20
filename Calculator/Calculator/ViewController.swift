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
        case "+":
            if operandStack.count >= 2 {
                displayValue = operandStack.removeLast() + operandStack.removeLast()
                enter()
            }
            
        case "-":
            if operandStack.count >= 2 {
                displayValue = -operandStack.removeLast() + operandStack.removeLast()
                enter()
            }
            
        case "*":
            if operandStack.count >= 2 {
                displayValue = operandStack.removeLast() + operandStack.removeLast()
                enter()
            }
            
        case "/":
            if operandStack.count >= 2 {
                let op1 = operandStack.removeLast()
                let op2 = operandStack.removeLast()
                displayValue = op1 / op2
                enter()
            }
        default:break
        }
        
        
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

