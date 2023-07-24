//
//  Movie.swift
//  Movie List
//
//  Created by aljon antiola on 6/22/23.
//

import UIKit

struct Movie {
    var title: String?
    var movieId: String?
    var imageName: String?
    var description: String?
    var rating: String?
    var duration: String?
    var genre: String?
    var releaseDate: String?
    var releaseYear: String?
    var trailerLink: String?
    
    init(movieId:String? = nil, title: String? = nil, imageName: String? = nil, description: String? = nil, rating: String? = nil, duration: String? = nil, genre: String? = nil, releaseDate: String? = nil, releaseYear: String? = nil, trailerLink: String? = nil) {
        self.movieId = movieId
        self.title = title
        self.imageName = imageName
        self.description = description
        self.rating = rating
        self.duration = title
        self.genre = description
        self.releaseDate = rating
        self.releaseYear = title
        self.trailerLink = description
    }
    
    func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM YYYY"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self.releaseDate!)
    }
}
