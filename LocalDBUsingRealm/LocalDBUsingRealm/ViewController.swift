//
//  ViewController.swift
//  LocalDBUsingRealm
//
//  Created by muxing lin on 4/20/23.
//

import UIKit
import RealmSwift 

class ViewController: UIViewController {
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // print(Realm.Configuration.defaultConfiguration)
        testFunction()
        getValues()
        // Do any additional setup after loading the view.
    }
    
    func getValues(){
        do {
            let stocks = realm.objects(StockPrice.self)
            
            print(stocks)
            
        } catch let error as NSError{
            print("Unable to get")
        }
    }
    
    func testFunction(){
        let tsla: StockPrice = StockPrice()
        tsla.symbol = "TSLA"
        tsla.price = 301.23
        tsla.volume = 123234335
        
        let msft: StockPrice = StockPrice()
        msft.symbol = "MSFT"
        msft.price = 401.23
        msft.volume = 924323433
        
        do {
            try! realm.write {
                realm.add(msft, update: .modified)
            }
        }catch let error as NSError {
            print("Unable to write")
        }
        

    }

}

