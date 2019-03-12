//
//  ViewController.swift
//  MilageCalculator
//
//  Created by Will Laxson on 3/9/19.
//  Copyright © 2019 Will Laxson. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var milesTextField: UITextField!
    @IBOutlet weak var gallonsTextField: UITextField!
    @IBOutlet weak var averageMPGLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        milesTextField.delegate = self
        gallonsTextField.delegate = self
        
        
    }
    // If returns false, the input text field will not accept the character
    // Returns false if not a number or a number with one decimal point.
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        let newCharacters = CharacterSet(charactersIn: string)
        
        let decimalDigitsAndDecimal = CharacterSet.decimalDigitsAndDecimals
        
        if currentText.contains(".") && string.contains(".") {
            return false
        }
        
        if (string.components(separatedBy: ".").count > 2) {
            return false
        }
        
        if updatedText.count <= 6 && decimalDigitsAndDecimal.isSuperset(of: newCharacters) {
            return true
        }
        
        return false
    }
    
    
    @IBAction func didTapLogButton(_ sender: UIButton) {
        print("Tapped log button")
    }
    
    @IBAction func seeLogTableButton(_ sender: UIButton) {
        print("Tapped log table")
        if let vc = storyboard?.instantiateViewController(withIdentifier: "LogTable") as? LogTableViewController {
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}

extension CharacterSet {
    // Extending character set in order to provide decimals too
    
    static var decimalDigitsAndDecimals: CharacterSet {
        get {
            var decimalDigitsAndDecimal = CharacterSet.decimalDigits
            decimalDigitsAndDecimal.insert(charactersIn: ".")
            return decimalDigitsAndDecimal
        }
        
    }
}
