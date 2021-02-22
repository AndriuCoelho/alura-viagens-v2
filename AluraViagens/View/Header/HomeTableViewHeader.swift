//
//  HomeTableViewHeader.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 25/01/21.
//

import UIKit

class HomeTableViewHeader: UIView {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerView: UIView!
    
    // MARK: - Attributes
    
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - Methods
    
    func setup() {
        headerView.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
        headerView.layer.cornerRadius = 500
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        bannerView.layer.cornerRadius = 10
        bannerView.layer.masksToBounds = true
    }
}
