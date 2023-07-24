//
//  MoviesViewModel.swift
//  Movie List
//
//  Created by aljon antiola on 6/22/23.
//

import UIKit
import Foundation

enum SortType {
    case titleAscending
    case titleDescending
    case releasedDateAscending
    case releasedDateDescending
}

class MoviesViewModel {
    
    var movies = [Movie]()
    var currentSortType: SortType
    
    init() {
        self.currentSortType = .titleAscending
    }
    
    func sortData(type: SortType) -> [Movie] {
        switch type {
        case .titleAscending:
            movies = movies.sorted(by: {$0.title! < $1.title!})
            break
        case .titleDescending:
            movies = movies.sorted(by: {$0.title! > $1.title!})
            break
        case .releasedDateAscending:
            movies = movies.sorted(by: {$0.getDate()! > $1.getDate()!})
            break
        case .releasedDateDescending:
            movies = movies.sorted(by: {$0.getDate()! < $1.getDate()!})
            break
        }
        
        currentSortType = type
        
      return movies
    }
    
    func populateData() {
        
        if movies.isEmpty == false {
            return
        }
        
        // 1
        var movie1 = Movie()
        movie1.title = "Tenet"
        movie1.movieId = "1"
        movie1.imageName = "Tenet"
        movie1.description = "Armed with only one word, Tenet, and fighting for the survival of the entire world, a Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time."
        movie1.rating = "7.8"
        movie1.duration = "2h 30min"
        movie1.genre = "Action, Sci-Fi"
        movie1.releaseDate = "3 September 2020"
        if let releaseDate = movie1.releaseDate {
            movie1.releaseYear =  String(releaseDate.suffix(4))
        }
        movie1.trailerLink = "https://www.youtube.com/watch?v=LdOM0x0XDMo"
            
        // 2
        var movie2 = Movie()
        movie2.title = "Spider-Man: Into the Spider-Verse"
        movie2.imageName = "SpiderMan"
        movie2.movieId = "2"
        movie2.description = "Teen Miles Morales becomes the Spider-Man of his universe, and must join with five spider-powered individuals from other dimensions to stop a threat for all realities."
        movie2.rating = "8.4"
        movie2.duration = "1h 57min"
        movie2.genre = "Action, Animation, Adventure"
        movie2.releaseDate = "14 December 2018"
        if let releaseDate = movie2.releaseDate {
            movie2.releaseYear =  String(releaseDate.suffix(4))
        }
        movie2.trailerLink = "https://www.youtube.com/watch?v=tg52up16eq0"

        // 3
        var movie3 = Movie()
        movie3.title = "Knives Out"
        movie3.movieId = "3"
        movie3.imageName = "KnivesOut"
        movie3.description = "A detective investigates the death of a patriarch of an eccentric, combative family."
        movie3.rating = "7.9"
        movie3.duration = "2h 10min"
        movie3.genre = "Comedy, Crime, Drama"
        movie3.releaseDate = "27 November 2019"
        if let releaseDate = movie3.releaseDate {
            movie3.releaseYear =  String(releaseDate.suffix(4))
        }
        movie3.trailerLink = "https://www.youtube.com/watch?v=qGqiHJTsRkQ"
        
        // 4
        var movie4 = Movie()
        movie4.title = "Guardians of the Galaxy"
        movie4.imageName = "GuardiansofTheGalaxy"
        movie4.movieId = "4"
        movie4.description = "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe."
        movie4.rating = "8.0"
        movie4.duration = "2h 1min"
        movie4.genre = "Action, Adventure, Comedy"
        movie4.releaseDate = "1 August 2014"
        if let releaseDate = movie4.releaseDate {
            movie4.releaseYear =  String(releaseDate.suffix(4))
        }
        movie4.trailerLink = "https://www.youtube.com/watch?v=d96cjJhvlMA"
        
        // 5
        var movie5 = Movie()
        movie5.title = "Avengers: Age of Ultron"
        movie5.movieId = "5"
        movie5.imageName = "Avengers"
        movie5.description = "When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it's up to Earth's mightiest heroes to stop the villainous Ultron from enacting his terrible plan."
        movie5.rating = "7.3"
        movie5.duration = "2h 21min"
        movie5.genre = "Action, Adventure, Sci-Fi"
        movie5.releaseDate = "1 May 2015"
        if let releaseDate = movie5.releaseDate {
            movie5.releaseYear =  String(releaseDate.suffix(4))
        }
        movie5.trailerLink = "https://www.youtube.com/watch?v=tmeOjFno6Do"
        
        movies.removeAll()
        movies.append(movie1)
        movies.append(movie2)
        movies.append(movie3)
        movies.append(movie4)
        movies.append(movie5)
        
        movies = sortData(type: currentSortType)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieViewCell") as! MovieViewCell
        cell.selectionStyle = .none
        cell.configureCell(movie: movie)
        
        return cell
    }
}
