//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Hesham on 10/19/17.
//  Copyright © 2017 Hesham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var poundLabel: UILabel!
    @IBOutlet weak var yenLabel: UILabel!
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    let poundRate = 0.69
    let yenRate = 113.94
    let euroRate = 0.89
    var dollarAmount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertCurrency(_ sender: UIButton) {
        
        if let amount = Double(inputTextField.text!){
            dollarAmount = amount
        }
        poundLabel.text = "\(dollarAmount * poundRate)"
        yenLabel.text = "\(yenRate * dollarAmount)"
        euroLabel.text = "\(poundRate * dollarAmount)"
        dollarAmount = 0.0
    }
    //called when return key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //called when user taps away from the textfield
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func clearTextField(_ sender: UIButton) {
        inputTextField.text = ""
        zeroLabels()
    }
    func zeroLabels(){
        poundLabel.text = "0.0"
        yenLabel.text = "0.0"
        euroLabel.text = "0.0"
    }
    //lets test commit command of the version control
}

