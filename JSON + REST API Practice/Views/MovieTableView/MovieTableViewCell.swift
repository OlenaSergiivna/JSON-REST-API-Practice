//
//  MovieTableViewCell.swift
//  JSON + REST API Practice
//
//  Created by user on 07.09.2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var userScore: UILabel!
    
    @IBOutlet weak var movieType: UILabel!
    
    @IBOutlet weak var movieLanguage: UILabel!
    
    @IBOutlet weak var movieOverview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    func configure(with data: Movie) {
        
        if let movieName = data.name {
            movieTitle.text = movieName
        } else {
            movieTitle.text = data.title
        }
        
        userScore.text = "\(data.voteAverage)"
        movieType.text = data.mediaType
        movieLanguage.text = data.originalLanguage
        movieOverview.text = data.overview
    }
}
