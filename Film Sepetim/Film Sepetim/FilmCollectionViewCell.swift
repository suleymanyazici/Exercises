//
//  FilmCollectionViewCell.swift
//  Film Sepetim
//
//  Created by Suleyman YAZICI on 7.08.2023.
//

import UIKit

protocol FilmCollectionViewCellProtocol{
    func AddBasket(indexPath : IndexPath)
}

class FilmCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var moviePriceLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    
    var cellProtocol : FilmCollectionViewCellProtocol?
    var indexPath : IndexPath?
    
    @IBAction func addBasketButton(_ sender: Any) {
        
        cellProtocol?.AddBasket(indexPath: indexPath!)
    
    }
}
