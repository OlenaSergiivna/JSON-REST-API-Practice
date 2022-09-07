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
        
        NetworkManager.shared.requestTrendyMovies { data in
            self.trendyMovies = data
//            print(self.trendyMovies.last.name/title)
//            print(self.trendyMovies.last?.voteAverage)
//            print(self.trendyMovies.last?.mediaType)
//            print(self.trendyMovies.last?.originalLanguage)
//            print(self.trendyMovies.last?.overview)

            
            
            
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.trendyMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    
}
