//
//  PassengerDetailsTableViewController.swift
//  passengers_rest
//
//  Created by Victor Yelnikoff on 30.01.17.
//  Copyright © 2017 Victor Yelnikoff. All rights reserved.
//

import UIKit

class PassengerDetailsTableViewController: UITableViewController {
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var bonusMiles: UILabel!
    @IBOutlet weak var passengerStatus: UILabel!
    
    public var passenger: Passenger?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.firstName.text = self.passenger?.firstName
        self.lastName.text = self.passenger?.name
        self.bonusMiles.text = String(describing: (self.passenger?.bonusMiles)!)
        self.passengerStatus.text = self.passenger?.passengerStatus
    }
}
