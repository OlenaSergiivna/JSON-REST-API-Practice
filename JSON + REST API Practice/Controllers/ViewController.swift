//
//  ViewController.swift
//  JSON + REST API Practice
//
//  Created by user on 05.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var deviceAray = Company()
    
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
    }
}

