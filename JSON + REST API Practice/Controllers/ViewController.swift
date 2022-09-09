//
//  ViewController.swift
//  JSON + REST API Practice
//
//  Created by user on 05.09.2022.
//

import UIKit
    
class ViewController: UIViewController {
    
    @IBOutlet weak var trendyMoviesTableView: UITableView!
 
    var deviceAray = Company()
    var trendyMovies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        NetworkManager.shared.requestFromLocal { data in
            self.deviceAray = data
            print(self.deviceAray.companyDescription ?? "empty")
            print(self.deviceAray.listOfData?.first?.modelNumber ?? 0)
            print(self.deviceAray.listOfData?.first?.countries.last! ?? "empty")
            print(self.deviceAray.listOfData?.last?.priceDevice.regions.first?.nameRegion ?? "empty")
            print(self.deviceAray.listOfData?.last?.priceDevice.regions.last?.priceRegion ?? 0)
        }
        
        
        NetworkManager.shared.requestTrendyMovies { [self] data in
            self.trendyMovies = data
            
            let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
            self.trendyMoviesTableView.register(nib, forCellReuseIdentifier: "MovieTableViewCell")
            self.trendyMoviesTableView.reloadData()
        }
        
        NetworkManager.shared.requestMovieGenres { data in
            GlobalVariables.movieGenres = data
            self.trendyMoviesTableView.reloadData()
        }
        
        NetworkManager.shared.requestTVGenres { data in
            GlobalVariables.tvGenres = data
            self.trendyMoviesTableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.trendyMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = trendyMoviesTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell else {
                  return UITableViewCell()
              }
              
        cell.configure(with: trendyMovies[indexPath.row], genres: GlobalVariables.movieGenres, tvGenres: GlobalVariables.tvGenres)
              return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
