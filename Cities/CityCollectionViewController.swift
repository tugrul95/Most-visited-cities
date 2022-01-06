//
//  CityCollectionViewController.swift
//  Cities
//
//  Created by Macbook on 05.01.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class CityCollectionViewController: UICollectionViewController {
    
    @IBAction func unwindToMain(segue: UIStoryboardSegue){
        // when tapped to x button, it closes controller
    }
    
    // declare cities array
    private var cities : [City] = [ City(image: "colosseum", name: "Roma"),
                                    City(image: "greatwall", name: "Huairou"),
                                    City(image: "kremlin", name: "Moscow"),
                                    City(image: "stonehenge", name: "London"),
                                    City(image: "tajmahal", name: "Delhi")]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return the number of items
        return cities.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! CityCollectionViewCell
    
        // Configure the cell
        
        let city = cities[indexPath.row]
        cell.cityImageView.image = UIImage(named: city.image)
        cell.cityNameLabel.text = city.name
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPaths = collectionView.indexPathsForSelectedItems{
                let destinationController = segue.destination as! CityDetailViewController
                destinationController.city = cities[indexPaths[0].row]
                collectionView.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
    
}
