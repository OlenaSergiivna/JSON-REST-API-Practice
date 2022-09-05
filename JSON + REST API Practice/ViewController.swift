//
//  ViewController.swift
//  JSON + REST API Practice
//
//  Created by user on 05.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var deviceString: String? = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.requestFromLocal { data in
            self.deviceString = data
            print(self.deviceString?.description)
        }
        
    }


}

