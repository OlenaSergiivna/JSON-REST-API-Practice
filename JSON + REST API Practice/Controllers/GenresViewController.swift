//
//  GenresViewController.swift
//  JSON + REST API Practice
//
//  Created by user on 08.09.2022.
//

import UIKit

class GenresViewController: UIViewController {
    
    var genres: [Genre] = []

    @IBOutlet weak var genresTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.requestMovieGenres { data in
            self.genres = data
            self.genresTableView.reloadData()
        }
        
    }
    
}


extension GenresViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(genres.count)
     return  genres.count
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = genres[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
}
