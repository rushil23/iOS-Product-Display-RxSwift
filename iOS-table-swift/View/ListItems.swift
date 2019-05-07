//
//  ListItems.swift
//  iOS-table-swift
//
//  Created by Rushil on 1/17/19.
//  Copyright © 2019 Rushil. All rights reserved.
//

import UIKit

class ListItems: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var CellImage: UIImageView!
    @IBOutlet weak var CellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


