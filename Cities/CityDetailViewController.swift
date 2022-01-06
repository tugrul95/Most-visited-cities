//
//  CityDetailViewController.swift
//  Cities
//
//  Created by Macbook on 05.01.2021.
//

import UIKit
// created the class and added city property
class CityDetailViewController: UIViewController {
    
    var city: City?
    
    @IBOutlet var cityImageView:UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // load the image if it exists
        cityImageView.image = UIImage(named: city?.image ?? "")
        
    }

}
