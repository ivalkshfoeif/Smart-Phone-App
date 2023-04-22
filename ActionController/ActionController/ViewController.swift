//
//  ViewController.swift
//  ActionController
//
//  Created by muxing lin on 4/20/23.
//

import UIKit

class ViewController: UIViewController {
    
    var txtField: UITextField!

    @IBOutlet weak var lblStock: UILabel!
    
    @IBAction func showAlertController(_ sender: Any) {
        let alertController = UIAlertController(title: "Alert Controller Title", message: "Alert Controller Message", preferredStyle: .alert)
        
        let OKButton = UIAlertAction(title: "OK", style: .default){ action in
            self.lblStock.text = self.txtField?.text
            print("I am in OK butrton")
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .default){
            action in print("I am in cancel butrton")
        }
        
        alertController.addTextField{ lblTextField in
            self.txtField = lblTextField
            lblTextField.placeholder = "Type Stock Value"
        }
        
        alertController.addAction(OKButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

