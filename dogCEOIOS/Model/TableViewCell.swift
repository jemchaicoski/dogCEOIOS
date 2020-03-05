//
//  TableViewCell.swift
//  dogCEOIOS
//
//  Created by Jonathan on 02/03/20.
//  Copyright © 2020 HBSIS. All rights reserved.
//
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var dogImage: UIImageView!
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogFavorite: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
