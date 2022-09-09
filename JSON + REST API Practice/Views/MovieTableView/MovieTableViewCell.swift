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
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    
    func configure(with data: Movie, genres: [Genre], tvGenres: [Genre]) {
        
        if let movieName = data.name {
            movieTitle.text = movieName
        } else {
            movieTitle.text = data.title
        }
        
        userScore.text = "\(data.voteAverage)"
        movieType.text = data.mediaType
        movieLanguage.text = data.originalLanguage
        movieOverview.text = data.overview
        if let imagePath = data.posterPath {
            movieImage.downloaded(from: "https://image.tmdb.org/t/p/w200/\(imagePath)")
        } else {
            return
        }
        
        var genresString = ""
        
        for movieID in data.genreIDS {
            
            if movieType.text == "movie" {
            
            for (index, genre) in genres.enumerated() {

                    if movieID == genre.id {
                        genresString.append("\(genre.name). ")
                    }
                }
            } else if movieType.text == "tv" {
                for (index, genre) in tvGenres.enumerated() {
                    if movieID == genre.id {
                        genresString.append("\(genre.name). ")
                    }
                }
            }
        }
        movieGenre.text = String("\(genresString)".dropLast(2))
        
    }
}

