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
    var loggedData = [Log]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        milesTextField.delegate = self
        gallonsTextField.delegate = self
        
        loggedData = Log.loadAllLogs()
        
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
    
    func calculateGasMileage(miles: Double, gallonsUsed: Double) -> Double {
        return miles / gallonsUsed
    }
    
    
    @IBAction func didTapLogButton(_ sender: UIButton) {
    
        // Calculates the MPG based on the current user input

        let miles = Double(milesTextField.text ?? "0.0")
        let gallonsUsed = Double(gallonsTextField.text ?? "0.0")
        
        guard let milesUnwrapped = miles else {
            print("Error: cannot convert miles text field value \(milesTextField.text ?? "0.0") into double")
            return
        }
        guard let gallonsUsedUnwrapped = gallonsUsed else {
            print("Error: cannot convert gallons text field value \(gallonsTextField.text ?? "0.0") into double")
            return
        }
        
        let calculatedGasMileage = calculateGasMileage(miles: milesUnwrapped, gallonsUsed: gallonsUsedUnwrapped).rounded(to: 2)
        
        guard calculatedGasMileage.isFinite else {
            averageMPGLabel.text = "Average: Tesla!"
            return
        }
        
        let log = Log(date: Date(), miles: milesUnwrapped, gallons: gallonsUsedUnwrapped)
        loggedData.append(log)
        _ = Log.saveAllLogs(logs: loggedData)
        
        averageMPGLabel.text = "Average: \(calculatedGasMileage) MPG"
        
    }
    
    @IBAction func seeLogTableButton(_ sender: UIButton) {
        print("Tapped log table")
        if let vc = storyboard?.instantiateViewController(withIdentifier: "LogTable") as? LogTableViewController {
            vc.loggedData = loggedData
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
