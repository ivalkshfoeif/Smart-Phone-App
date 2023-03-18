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
            let symbol = stock["symbol"]
            let price = stock["price"]
            let volume = stock["volume"]
            
            print(symbol)
            print(price)
            print(volume)
            
            self.lblStockPrice.text = "Price = \(price)$"
            
        }
    }
}

