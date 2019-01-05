//
//  DetailViewController.swift
//  ManishPractical
//
//  Created by Syon on 04/01/19.
//  Copyright © 2019 Syon. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    
    // properties
    var contentTitle: String?
    var contentType: String?
    var contentPoster: String?
    var contentYear: String?

    // MARK: Life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        guard let title = contentTitle else { return }
        guard let type = contentType else { return }
        guard let poster = contentPoster else { return }
        guard let year = contentYear else { return }
        
        self.lblTitle.text = title
        self.lblType.text = type
        self.lblYear.text = year
        
        // image url cache img
        let placeholder = UIImage(named: Constants.ImagesSet.placeholder)
        let url = ImageResource(downloadURL: URL(string: poster)!)
        imageView.kf.setImage(with: url, placeholder: placeholder)
    }
    
}
