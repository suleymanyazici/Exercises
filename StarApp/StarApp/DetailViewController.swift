//
//  DetailViewController.swift
//  StarApp
//
//  Created by Suleyman YAZICI on 1.07.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    var secilenStar : Star?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.text = secilenStar!.isim + " " + secilenStar!.soyisim
        image.image = secilenStar?.resim

        
    }
    

 

}
