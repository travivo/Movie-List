//
//  DetailViewController.swift
//  Movie List
//
//  Created by aljon antiola on 6/22/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releasedDateLabel: UILabel!
    @IBOutlet weak var addToWatchlistLabel: UILabel!
    @IBOutlet weak var addToWatchlistButton: UIButton!
    
    @IBOutlet weak var watchTrailerButton: UIButton!
    var movie = Movie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = movie.title
        self.rateLabel.text = movie.rating
        self.moviePosterImageView.image = UIImage(named: movie.imageName!)
        self.moviePosterImageView.layer.cornerRadius = 5
        self.descriptionLabel.text = movie.description
        self.genreLabel.text = movie.genre
        self.releasedDateLabel.text = movie.releaseDate
        self.watchTrailerButton.layer.borderWidth = 1.0
        self.watchTrailerButton.layer.borderColor = UIColor.darkGray.cgColor
        self.watchTrailerButton.layer.cornerRadius = self.watchTrailerButton.frame.height/2
        
        if (PersistenceManager().watchList.contains(movie.movieId!)) {
            self.addToWatchlistLabel.text = "REMOVE FROM WATCHLIST"
        }
        else {
            self.addToWatchlistLabel.text = "+ ADD TO WATCHLIST"
        }
        
    }


    @IBAction func addToWatchlistTapped(_ sender: Any) {
        if (PersistenceManager().watchList.contains(movie.movieId!)) {
            PersistenceManager().removeFromWatchList(movieId: movie.movieId!)
            self.addToWatchlistLabel.text = "+ ADD TO WATCHLIST"
        }
        else {
            PersistenceManager().addToWatchList(movieId: movie.movieId!)
            self.addToWatchlistLabel.text = "REMOVE FROM WATCHLIST"
        }
    }
    
    
    @IBAction func watchTrailerTapped(_ sender: Any) {
        guard let url = URL(string: movie.trailerLink!) else { return }
        UIApplication.shared.open(url)
    }
}
