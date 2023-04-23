//
//  TableViewCell.swift
//  FinalDemo
//
//  Created by muxing lin on 4/22/23.
//

import UIKit
class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageContainer: UIImageView!
    
    
    @IBOutlet weak var imageName: UILabel!
    
    @IBOutlet weak var imageLocation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
