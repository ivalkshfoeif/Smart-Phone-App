//
//  ViewController.swift
//  ProtocalsAndDelegateExample
//
//  Created by muxing lin on 3/18/23.
//

import UIKit

class ViewController: UIViewController, SetStatusDelegate {
    
    
    
    /*
     1. Create a swift file has a protocal
     2. This protocal will have the functions that would have to be implemented when someone conforms to it
     3. In the second VC we will add an optinal variable for the protocol
     4. In the second VC wehnever an action is taken we will call the protocal function
     5. In the first VC conform to the protocol
     6. You would have to implement the function defined in the protocol
     7. In the function do your implementation (Update UI
     8. When we are going to second VC, start listning to the second VC's variable defined in step 3
     
     
     */


    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gotoSecondVC(_ sender: Any) {
        performSegue(withIdentifier: "sequeSecondVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sequeSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.setStatusDelegate = self
            guard let name = txtName.text else {return}
            secondVC.name = name
        }
    }
    
    func setStatus(status: String) {
        lblStatus.text = "My Status is: \(status)"
    }
    
    
}

