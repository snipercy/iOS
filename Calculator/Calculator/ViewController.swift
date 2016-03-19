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
    
    var hasTypeingNum:Bool = false;
    

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if hasTypeingNum {
            display.text = display.text! + digit
        } else {
            display.text = digit
            hasTypeingNum = true
        }
    }
    
}

