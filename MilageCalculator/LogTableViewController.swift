//
//  LogTableViewController.swift
//  MilageCalculator
//
//  Created by Will Laxson on 3/9/19.
//  Copyright © 2019 Will Laxson. All rights reserved.
//

import UIKit

class LogTableViewController: UITableViewController {
    var loggedData = [Log]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return loggedData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogCell", for: indexPath)
        cell.detailTextLabel?.text = "detail test"
        cell.textLabel?.text = String(loggedData[indexPath.row].miles)
        
        return cell
    }
    
    
}
