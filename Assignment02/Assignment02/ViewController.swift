//
//  ViewController.swift
//  Assignment02
//
//  Created by muxing lin on 2/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let restaurant = ["Zaika", "Hotpot", "Zeeks Pizza", "NEU"]
    
    let food = [["Food1-Zaika", "Food2-Zaika", "Food3-Zaika", "Food4-Zaika"], ["Food1-Hotpot", "Food2-Hotpot", "Food3-Hotpot"],["Food1-Zeeks Pizza", "Food2-Zeeks Pizza", "Food3-Zeeks Pizza", "Food4-Zeeks Pizza", "Food5-Zeeks Pizza"],["Food1-NEU", "Food2-NEU"]]
    
    @IBOutlet weak var tblViewTop: UITableView!
    
    @IBOutlet weak var tblViewBottom: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tblViewTop {
            return restaurant.count
        } else {
            if let selectedRestaurantIndex = tblViewTop.indexPathForSelectedRow?.row {
                return food[selectedRestaurantIndex].count
            }
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tblViewTop {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = restaurant[indexPath.row]
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "footItemCell", for: indexPath)
            if let selectedRestaurantIndex = tblViewTop.indexPathForSelectedRow?.row {
                cell.textLabel?.text = food[selectedRestaurantIndex][indexPath.row]
            }
            return cell
            
        }
        
        

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblViewTop {
            let selectedRestaurant = restaurant[indexPath.row]
            let selectedFoodItems = food[indexPath.row]
            tblViewBottom.reloadData()
        }
    }
    

    
}

