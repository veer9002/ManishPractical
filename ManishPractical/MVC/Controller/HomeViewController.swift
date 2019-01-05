//
//  ViewController.swift
//  ManishPractical
//
//  Created by Syon on 03/01/19.
//  Copyright © 2019 Syon. All rights reserved.
//
// URL for reference: http://www.omdbapi.com/?s=Batman&page=1&apikey=eeefc96f

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // properties
    var collectionArray = [Search]()
    var index = 1
    let formatter = DateFormatter()
    let date = Date()
    
    // MARK: Life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "yyyy"
        fetchData()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            collectionView.reloadData()
        } else {
//            print("Portrait")
        }
    }
 
    // MARK: Custom Methods
    // Get the results from API
    func fetchData() {
        let urlString = Constants.Urls.baseUrl + Constants.EndPoints.search + Constants.EndPoints.page + "\(index)" + Constants.EndPoints.apiKey + Constants.APIKey.omdbApiKey
//        print(urlString)
        
        if Reachability.isConnectedToNetwork() {
            APIManager.shared.getMoviesAPI(urlString: urlString) { (movies) in
                if self.index == 1  {
                    self.collectionArray = movies
                    self.collectionView.reloadData()
                } else {
                    self.collectionArray.append(contentsOf: movies)
                    self.collectionView.reloadData()
                    print(self.collectionArray.count)
                }
            }
        } else {
            self.alert(message: "Internet is not connected!", title: "Connectivity error")
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.cellName, for: indexPath) as! MoviesCell
        cell.lblTitle.text = collectionArray[indexPath.row].Title
        cell.lblType.text = collectionArray[indexPath.row].Type
        
        // image caching using Kingfisher lib
        let placeholder = UIImage(named: Constants.ImagesSet.placeholder)
        let imageUrl = collectionArray[indexPath.row].Poster
        let resource = ImageResource(downloadURL: URL(string: imageUrl)!, cacheKey: "\(indexPath.row)")
        cell.celIImage.kf.setImage(with: resource, placeholder: placeholder)
        
        if let someDateTime = formatter.date(from: collectionArray[indexPath.row].Year) {
            let dateDifference = date.offsetLong(from: someDateTime)
            cell.lblYears.text = dateDifference
        }
        
        return cell
    }
    
    // Paginated loading for more items
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if indexPath.row == collectionArray.count - 1 {
            // load more data (fetch api)
            index += 1
            fetchData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected at indexpath \(indexPath.row)")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.contentTitle = collectionArray[indexPath.row].Title
        detailVC.contentType = collectionArray[indexPath.row].Type
        detailVC.contentPoster = collectionArray[indexPath.row].Poster
        detailVC.contentYear = collectionArray[indexPath.row].Year
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        return CGSize(width: collectionWidth/2 - 1, height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
