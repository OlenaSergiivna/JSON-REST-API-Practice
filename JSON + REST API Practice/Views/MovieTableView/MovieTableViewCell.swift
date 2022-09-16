//
//  MovieTableViewCell.swift
//  JSON + REST API Practice
//
//  Created by user on 07.09.2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var secondContentView: UIView!
    
    @IBOutlet weak var movieGenre: UILabel!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var userScore: UILabel!
    
    @IBOutlet weak var movieType: UILabel!
    
    @IBOutlet weak var movieLanguage: UILabel!
    
    @IBOutlet weak var movieOverview: UILabel!
    
    @IBOutlet weak var movieImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.secondContentView.layer.cornerRadius = 20
        self.movieImage.layer.cornerRadius = 5
        self.userScore.layer.masksToBounds = true
        self.userScore.layer.cornerRadius = 5
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    
    func configure(with data: MovieRealm, genres: [Genre], tvGenres: [Genre]) {
        
        // MARK: Configuring movie name
        
        if let movieName = data.name {
            movieTitle.text = movieName
        } else {
            movieTitle.text = data.title
        }
        
        
        // MARK: Configuring movie type, language, overview, image and user score
        
        userScore.text = "★ \(round((data.voteAverage * 100))/100)"
        movieType.text = data.mediaType
        movieLanguage.text = data.originalLanguage
        movieOverview.text = data.overview
        
        if let imagePath = data.posterPath {
            movieImage.downloaded(from: "https://image.tmdb.org/t/p/w200/\(imagePath)")
        } else {
            return
        }
        
        
        // MARK: Configuring movie genre
        
        var genresString = ""
        
        for movieID in data.genreIDS {
            
            if movieType.text == "movie" {
            
            for genre in genres {

                    if movieID == genre.id {
                        genresString.append("\(genre.name). ")
                    }
                }
                
            } else if movieType.text == "tv" {
        
                for genre in tvGenres {
                    if movieID == genre.id {
                        genresString.append("\(genre.name). ")
                    }
                }
            }
        }
        
        movieGenre.text = String("\(genresString)".dropLast(2))
        
    }
}

