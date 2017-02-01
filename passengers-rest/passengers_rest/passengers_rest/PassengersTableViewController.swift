//
//  PassengersTableViewController.swift
//  passengers_rest
//
//  Created by Victor Yelnikoff on 30.01.17.
//  Copyright © 2017 Victor Yelnikoff. All rights reserved.
//

import UIKit

struct Passenger {
    let bonusMiles: Int
    let firstName: String
    let id: Int
    let name: String
    let passengerStatus: String
}

class PassengersTableViewController: UITableViewController {

    public var passengers: [Passenger] = []
    public var passengerDetailsTableViewController: PassengerDetailsTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passengersToPassengerDetails" {
            let controller = segue.destination as? PassengerDetailsTableViewController
            self.passengerDetailsTableViewController = controller
            
            print("SEGUING")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt i: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "passengerCell", for: i) as! PassengerTableViewCell
        let passenger = self.passengers[i.row]
        
        cell.fullName.text = passenger.firstName + " " + passenger.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.passengers.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt i: IndexPath) {
        print("PUSHED TABLE ROW")
        
        let passenger = self.passengers[i.row]
        
        self.passengerDetailsTableViewController?.passenger = passenger
    }
    
    private func loadData() {
        let url = URL(string: "http://angular.at/api/passenger")
//        let request = URLRequest(url: url!)
//        request.httpMethod = "POST"
//        GET by default
        
        print("GO")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String : Any]]
                
                for item in json {
                    let passenger = Passenger(
                        bonusMiles: item["bonusMiles"] as! Int,
                        firstName: item["firstName"] as! String,
                        id: item["id"] as! Int,
                        name: item["name"] as! String,
                        passengerStatus: item["passengerStatus"] as! String)
                    
                    self.passengers.append(passenger)
                }
                
                self.tableView.reloadData()
                
                print(self.passengers)
                
            } catch let error as Error {
                print(error)
            }
            
        }.resume()
    }

}
