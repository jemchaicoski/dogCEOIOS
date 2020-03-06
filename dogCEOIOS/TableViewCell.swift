//
//  TableViewCell.swift
//  dogCEOIOS
//
//  Created by Jonathan on 02/03/20.
//  Copyright © 2020 HBSIS. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var buttonFavorite: UIButton!
    @IBOutlet weak var nomeRaca: UILabel!
    @IBOutlet weak var imagemRaca: UIImageView!
    
    weak var delegate : TableViewCellDelegate?
    
    var raca: Dog?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.buttonFavorite.addTarget(self, action: #selector(getter: buttonFavorite), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
@IBAction func subscribeButtonTapped(_ sender: UIButton){
    // ask the delegate (in most case, its the view controller) to
    // call the function 'subscribeButtonTappedFor' on itself.
    if let raca = raca, let delegate = delegate { self.delegate?.TableViewCell(self, subscribeButtonTappedFor: raca) }
    raca!.favorito = !(raca!.favorito)
    
    }
}

 protocol TableViewCellDelegate: AnyObject { func TableViewCell(_ TableViewCell: TableViewCell, subscribeButtonTappedFor cell: Dog)
    
}




