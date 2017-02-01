//
//  PassengersTableViewController.swift
//  swift-rest
//
//  Created by Victor Yelnikoff on 30.01.17.
//  Copyright © 2017 Victor Yelnikoff. All rights reserved.
//

import UIKit

class PassengersTableViewController: UITableViewController {

    var api: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // api call
        self.api = ["one", "two", "three", "four"]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.api.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt i: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: i) as! PassengerTableViewCell
        
        cell.title.text = self.api[i.row]
        
        return cell
    }
}
