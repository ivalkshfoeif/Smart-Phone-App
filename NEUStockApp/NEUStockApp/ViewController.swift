//
//  ViewController.swift
//  NEUStockApp
//
//  Created by muxing lin on 3/18/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {
    
    @IBOutlet weak var txtStockSymbol: UITextField!
    
    @IBOutlet weak var lblStockPrice: UILabel!
    
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var companyName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getStockPrice(_ sender: Any) {
        guard let symbol = txtStockSymbol.text else {return};
        
        let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"
        AF.request(url).responseJSON { response in
            SwiftSpinner.hide()
            if response.error != nil {
                print("Error in response")
                return
            }
            print(response.data!)
            guard let rawData = response.data else {return}
            guard let data = JSON(rawData).array else {return}
            
            
            guard let stock = data.first else {return}
            
            print(stock)
            let name = stock["companyName"]
            let price = stock["price"]
            let website = stock["website"]
            
            print(name)
            print(price)
            print(website)
            
            self.lblStockPrice.text = "Price = \(price)$"
            self.website.text = "Website = \(website)"
            self.companyName.text = "Company Name = \(name)"
            
        }
    }
}

