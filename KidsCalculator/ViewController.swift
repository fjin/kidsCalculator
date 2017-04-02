//
//  ViewController.swift
//  KidsCalculator
//
//  Created by Fan Jin on 2/4/17.
//  Copyright © 2017 Fan Jin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var currentStatus:CalculatorState = CalculatorState.NEW_START
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func convertNumberToOperator(value:Int) ->String {
        var symbol:String?
        if(value == 10) {
            symbol = "."
        }
        else if(value == 11){
            symbol = "+"
        }
        else if(value == 12){
            symbol = "-"
        }
        else if(value == 13){
            symbol = "*"
        }
        else if(value == 14){
            symbol = "/"
        }
        else if(value == 17){
            symbol = "("
        }
        else if(value == 18){
            symbol = ")"
        }
        else {
            symbol = String(value)
        }
        
        return symbol!
        
    }
    
    @IBAction func buttonClicked(_ sender: UIButton){
        if(currentStatus == CalculatorState.ENTERING){
            resultLabel.text = resultLabel.text! + convertNumberToOperator(value: sender.tag)
        }
        else{
            resultLabel.text = convertNumberToOperator(value: sender.tag)
        }
        currentStatus = CalculatorState.ENTERING
    }
    
    @IBAction func equalsClicked(_ sender: UIButton){
        currentStatus = CalculatorState.NEW_START
        
        
        resultLabel.text = String(Double("\( resultLabel.text! )")!)
        
    }
    
    @IBAction func clearClicked(_ sender: UIButton){
        resultLabel.text = "0"
        currentStatus = CalculatorState.NEW_START
    }
    
    


}

