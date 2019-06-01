//
//  ViewController.swift
//  calculator
//
//  Created by swaraj yogesh papadkar on 11/05/19.
//  Copyright © 2019 swaraj yogesh papadkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen : Double = 0
    var prevNum : Double = 0
    var op : Int = 0
    var performMath = false
    
    
    @IBOutlet weak var labelButton: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        
        labelButton.text = labelButton.text! + "."
        
    }
    
    @IBAction func numbersPressed(_ sender: UIButton) {
        
        if performMath == true {
            
            labelButton.text = String(sender.tag-1)
            numberOnScreen = Double(labelButton.text!)!
            performMath = false
        }
        else {
        
            labelButton.text = labelButton.text! + String(sender.tag-1)
            numberOnScreen = Double(labelButton.text!)!
        }
    }
    
    @IBAction func ops(_ sender: UIButton) {
        
        if labelButton.text != "" && sender.tag != 12 && sender.tag != 18 && sender.tag != 17 {
            
            prevNum = Double(labelButton.text!)!
            if sender.tag == 13 {
                labelButton.text = "+"
            }
            else if sender.tag == 14 {
                labelButton.text = "-"
            }
            else if sender.tag == 15 {
                labelButton.text = "X"
            }
            else if sender.tag == 16 {
                labelButton.text = "/"
            }
            else if sender.tag == 17 {
                labelButton.text = "%"
            }
            performMath = true
            op = sender.tag
        }
        else if sender.tag == 12 {
            
            if op == 13 {
                labelButton.text = String(prevNum + numberOnScreen)
            }
            else if op == 14 {
                labelButton.text = String(prevNum - numberOnScreen)
            }
            else if op == 15 {
                labelButton.text = String(prevNum * numberOnScreen)
            }
            else if op == 16 {
                labelButton.text = String(prevNum / numberOnScreen)
            }
        }
        else if sender.tag == 17 {
            labelButton.text = String(numberOnScreen/100)
        }
        else if sender.tag == 18 {
            labelButton.text = ""
            prevNum = 0
            numberOnScreen = 0
            op = 0
        }
        
    }
    

}

