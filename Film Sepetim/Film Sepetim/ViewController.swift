//
//  ViewController.swift
//  Film Sepetim
//
//  Created by Suleyman YAZICI on 7.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var filmler = [Filmler]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Filmler"
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let film1 = Filmler(movieId: 1, movieName: "Archer", moviePrice: 15.99, movieImage: "archer")
        let film2 = Filmler(movieId: 2, movieName: "Avengers", moviePrice: 17.99, movieImage: "avengers")
        let film3 = Filmler(movieId: 3, movieName: "Dark", moviePrice: 20.99, movieImage: "dar")
        let film4 = Filmler(movieId: 4, movieName: "Drive", moviePrice: 25.99, movieImage: "drive")
        let film5 = Filmler(movieId: 5, movieName: "Freedom", moviePrice: 15.99, movieImage: "freedom")
        let film6 = Filmler(movieId: 6, movieName: "Gladiator", moviePrice: 15.99, movieImage: "gladiator")
        let film7 = Filmler(movieId: 7, movieName: "İnvisiable Man", moviePrice: 19.99, movieImage: "invisibleman")
        let film8 = Filmler(movieId: 8, movieName: "John Wick", moviePrice: 25.99, movieImage: "johnwick")
        let film9 = Filmler(movieId: 9, movieName: "Joker", moviePrice: 15.99, movieImage: "joker")
        let film10 = Filmler(movieId: 10, movieName: "Leon", moviePrice: 15.99, movieImage: "leon")
        let film11 = Filmler(movieId: 11, movieName: "Return Oh The Jedi", moviePrice: 55.99, movieImage: "returnofthejedi")
        let film12 = Filmler(movieId: 12, movieName: "Sweeney Todd", moviePrice: 15.99, movieImage: "sweeneytodd")
        let film13 = Filmler(movieId: 13, movieName: "The Last Mission", moviePrice: 18.99, movieImage: "thelastmission")
        let film14 = Filmler(movieId: 14, movieName: "The Last Of Us", moviePrice: 35.99, movieImage: "thelastofus")
        let film15 = Filmler(movieId: 15, movieName: "Titanic", moviePrice: 15.99, movieImage: "titanic")
        let film16 = Filmler(movieId: 16, movieName: "Uncharted", moviePrice: 15.99, movieImage: "uncharted")
        let film17 = Filmler(movieId: 17, movieName: "White Hause Down", moviePrice: 75.99, movieImage: "whitehausedown")
        
        filmler.append(film1)
        filmler.append(film2)
        filmler.append(film3)
        filmler.append(film4)
        filmler.append(film5)
        filmler.append(film6)
        filmler.append(film7)
        filmler.append(film8)
        filmler.append(film9)
        filmler.append(film10)
        filmler.append(film11)
        filmler.append(film12)
        filmler.append(film13)
        filmler.append(film14)
        filmler.append(film15)
        filmler.append(film16)
        filmler.append(film17)
        
        let tasarim : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let genislik = self.collectionView.frame.size.width
        tasarim.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        let hucreGenislik = (genislik - 30)/2
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.68)
        tasarim.minimumLineSpacing = 10
        tasarim.minimumInteritemSpacing = 10
        
        collectionView.collectionViewLayout = tasarim
        
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, FilmCollectionViewCellProtocol{
    func AddBasket(indexPath: IndexPath) {
        let veri = filmler[indexPath.item]
        print("Seçilen data ismi : \(veri.movieName!)")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmler.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let veri = filmler[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmCell", for: indexPath) as! FilmCollectionViewCell
        cell.movieNameLabel.text = veri.movieName
        cell.moviePriceLabel.text = "\(veri.moviePrice!) TL"
        cell.movieImageView.image = UIImage(named: veri.movieImage!)
        
        cell.cellProtocol = self
        cell.indexPath = indexPath
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
                
        return cell
    }
}
