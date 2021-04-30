//
//  noteTableViewCell.swift
//  CopyApp
//
//  Created by Irina Perepelkina on 29.04.2021.
//  Copyright © 2021 Irina Perepelkina. All rights reserved.
//

import UIKit

class noteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
