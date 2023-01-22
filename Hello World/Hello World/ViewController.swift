//
//  ViewController.swift
//  Hello World
//
//  Created by muxing lin on 1/21/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("view has been loaded")
        // Do any additional setup after loading the view.
    }


    @IBAction func pressButtonAction(_ sender: UIButton) {
        print("button was pressed")
        label1.text = "button is pressed"
    }
}

