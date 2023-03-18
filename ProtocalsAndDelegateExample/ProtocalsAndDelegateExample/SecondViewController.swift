//
//  SecondViewController.swift
//  ProtocalsAndDelegateExample
//
//  Created by muxing lin on 3/18/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    
    @IBOutlet weak var txtStatus: UITextField!
    var setStatusDelegate: SetStatusDelegate?
    
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = "Welcome " + name

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setStatusAction(_ sender: Any) {
        guard let status = txtStatus.text else {return}
        
        setStatusDelegate?.setStatus(status: status)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
