//
//  TableViewCell.swift
//  MidtermQ1App
//
//  Created by muxing lin on 3/18/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageContainer: UIImageView!
    
    @IBOutlet weak var lblImage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
