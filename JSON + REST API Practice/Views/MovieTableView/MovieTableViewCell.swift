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
    
    func configure(with data: Movie, genres: [Genre]) {
        
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
        
        var genresArray: [String] = []
        
        for movieID in data.genreIDS {
            
            for (index, genre) in genres.enumerated() {
                
                if !genresArray.contains(where: { $0 == genre.name }) {
                    
                    if movieID == genre.id {
                        movieGenre.text! += "\(genre.name). "
                        genresArray.append(genre.name)
                        print(genresArray)
                }
                
                    
                }
            }
        }
    }
}

