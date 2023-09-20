//
//  Film.swift
//  Film Sepetim
//
//  Created by Suleyman YAZICI on 7.08.2023.
//

import Foundation

class Filmler{
    var movieId : Int?
    var movieName : String?
    var moviePrice : Double?
    var movieImage : String?
    
    init(movieId: Int?, movieName: String?, moviePrice: Double?, movieImage: String?) {
        self.movieId = movieId
        self.movieName = movieName
        self.moviePrice = moviePrice
        self.movieImage = movieImage
    }
    init(){
        
    }
    
}
