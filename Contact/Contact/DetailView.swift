//
//  DetailView.swift
//  Contact
//
//  Created by Suleyman YAZICI on 31.08.2023.
//

import UIKit

class DetailView: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    
    var contact : Contacts? 
    override func viewDidLoad() {
        super.viewDidLoad()

        if let c = contact{
            nameLabel.text = contact?.contact_name
            noLabel.text = contact?.contact_no
        }
        
    }
}
