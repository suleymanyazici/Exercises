//
//  CellView.swift
//  Contact
//
//  Created by Suleyman YAZICI on 30.08.2023.
//

import UIKit

class CellView: UITableViewCell {
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
