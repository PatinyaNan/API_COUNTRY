//
//  TableViewCell.swift
//  tableViewApi
//
//  Created by champis on 28/3/2562 BE.
//  Copyright © 2562 sdfler. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var textName: UILabel!
    @IBOutlet weak var textRegion: UILabel!
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var textCapital: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
