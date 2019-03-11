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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // If returns false, the input text field will not accept the character
        return true
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

