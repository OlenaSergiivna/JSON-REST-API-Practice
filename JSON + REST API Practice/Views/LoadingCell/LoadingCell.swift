//
//  LoadingCell.swift
//  JSON + REST API Practice
//
//  Created by user on 18.09.2022.
//

import UIKit

class LoadingCell: UITableViewCell {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.clear
        activityIndicator.color = UIColor.white
    }

    
}
