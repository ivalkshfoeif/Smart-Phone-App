//
//  ViewController.swift
//  MidtermQ1App
//
//  Created by muxing lin on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let arr = ["The Colosseum","The Great Wall of China", "The Taj Mahal", "Christ the Redeemer", "Machu Picchu", "Chichén Itzá", "Petra"]
    
    
    var name = ""
    

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        
        cell.imageContainer.image = UIImage(named: arr[indexPath.row])
        
        cell.lblImage.text = arr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arr[indexPath.row])
        name = arr[indexPath.row]
        
        performSegue(withIdentifier: "segueSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.name = name
        }
    }


}

