//
//  ViewController.swift
//  JSON + REST API Practice
//
//  Created by user on 05.09.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var trendyMoviesTableView: UITableView!

    var deviceAray = Company()
    var trendyMovies: [MovieRealm] = []
    
    var pageCount = 1
       
    var displayStatus = "standby"
    
    var totalPagesCount = 3
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        let nibMovieCell = UINib(nibName: "MovieTableViewCell", bundle: nil)
        trendyMoviesTableView.register(nibMovieCell, forCellReuseIdentifier: "MovieTableViewCell")
        
        let nibActivityCell = UINib(nibName: "LoadingCell", bundle: nil)
        trendyMoviesTableView.register(nibActivityCell, forCellReuseIdentifier: "LoadingCell")

        NetworkManager.shared.requestFromLocal { [weak self]  data in
            self?.deviceAray = data
//            print(self?.deviceAray.companyDescription ?? "empty")
//            print(self?.deviceAray.listOfData?.first?.modelNumber ?? 0)
//            print(self?.deviceAray.listOfData?.first?.countries.last! ?? "empty")
//            print(self?.deviceAray.listOfData?.last?.priceDevice.regions.first?.nameRegion ?? "empty")
//            print(self?.deviceAray.listOfData?.last?.priceDevice.regions.last?.priceRegion ?? 0)
        }
        
        
        NetworkManager.shared.requestTrendyMovies(page: pageCount) { [weak self] data in
            deleteAll()
            saveInRealm(movies: data)
            
            let result = getFromRealm()
            print(result.count)
            
            self?.trendyMovies = result
            
            
            print("array - \(String(describing: self?.trendyMovies.count))")
            
            DispatchQueue.main.async {
                self?.trendyMoviesTableView.reloadData()
            }
        }
        
        
        
        NetworkManager.shared.requestMovieGenres { [weak self] data in
            GlobalVariables.movieGenres = data
            
            DispatchQueue.main.async {
                self?.trendyMoviesTableView.reloadData()
            }
        }
        
        NetworkManager.shared.requestTVGenres { [weak self] data in
            GlobalVariables.tvGenres = data
            
            DispatchQueue.main.async {
                self?.trendyMoviesTableView.reloadData()
            }
        }
        
    }
    
    
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return trendyMovies.count
        } else if section == 1 {
            return 1
        } else {
            return 0
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            guard let cell = trendyMoviesTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: trendyMovies[indexPath.row], genres: GlobalVariables.movieGenres, tvGenres: GlobalVariables.tvGenres)
            return cell

            
        } else {

            let cell  = trendyMoviesTableView.dequeueReusableCell(withIdentifier: "LoadingCell", for: indexPath) as! LoadingCell
            cell.activityIndicator.startAnimating()
            return cell
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        } else {
            return 55
        }
        
    }
    
    
    
//        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
        //print(trendyMovies.count)
        //print("IndexPath: \(indexPath.row) - Items in array: \(trendyMovies.count) - 10 = \(trendyMovies.count - 10)")
        
//        if indexPath.row == trendyMovies.count - 10, !isLoading {
//            loadMoreData()
//        }
    // }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if ((indexPath.row == self.trendyMovies.count - 1) && displayStatus == "standby" && totalPagesCount > pageCount) {
            loadMoreData()
            
            pageCount += 1
            
            getNewMovies(status: &displayStatus, page: pageCount) { [weak self] data, status in
                
                self?.displayStatus = status
                print("data - \(data.count)")
                
                
                saveInRealm(movies: data)
                let result = getFromRealm()
                print("realm - \(result.count)")
                
                for movie in result {
                    if let trendyMovies = self?.trendyMovies {
                        if trendyMovies.contains(where: {movie.id == $0.id}) {
                            continue
                        } else {
                            self?.trendyMovies.append(movie)
                        }
                    }
                    
                }
                print("array - \(String(describing: self?.trendyMovies.count))")
                
                DispatchQueue.main.async {
                    self?.trendyMoviesTableView.reloadData()
                }
            }

        }
            
        
    }
    

    func loadMoreData() {
        print("Loading more data...")

    }
}


