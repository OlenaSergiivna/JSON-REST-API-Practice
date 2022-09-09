//
//  GenresViewController.swift
//  JSON + REST API Practice
//
//  Created by user on 08.09.2022.
//

import UIKit

class GenresViewController: UIViewController {
    

    @IBOutlet weak var genresTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.genresTableView.reloadData()
    }
    
}


extension GenresViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  GlobalVariables.movieGenres.count
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
        content.text = GlobalVariables.movieGenres[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
}
