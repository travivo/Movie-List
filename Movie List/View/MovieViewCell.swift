//
//  MovieViewCell.swift
//  Movie List
//
//  Created by aljon antiola on 6/22/23.
//

import UIKit

class MovieViewCell: UITableViewCell {

    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var onMyWatchlistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.moviePosterImageView.layer.cornerRadius = 5
        self.moviePosterImageView.layer.masksToBounds = true
    }

    func configureCell(movie: Movie) {
        self.titleLabel.text = movie.title! + "(" + movie.releaseYear! + ")"
        self.subtitleLabel.text = movie.duration! + " - " + movie.genre!
        self.moviePosterImageView.image = UIImage(named: movie.imageName!)
        
        if (PersistenceManager().watchList.contains(movie.movieId!)) {
            self.onMyWatchlistLabel.isHidden = false
        }
        else {
            self.onMyWatchlistLabel.isHidden = true
        }
       
    }
}
