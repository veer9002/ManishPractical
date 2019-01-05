//
//  Constants.swift
//  ManishPractical
//
//  Created by Syon on 03/01/19.
//  Copyright © 2019 Syon. All rights reserved.
//

import Foundation

// URL for reference: http://www.omdbapi.com/?s=Batman&page=1&apikey=eeefc96f

struct Constants {
    
    struct CellIdentifier {
        static let cellName = "Cell"
    }
    
    struct ImagesSet {
        static let placeholder = "placeholder"
    }
    
    struct Urls {
        static let baseUrl = "http://www.omdbapi.com"
    }
    
    struct APIKey {
        static let omdbApiKey = "eeefc96f"
    }

    struct EndPoints {
        static let search = "/?s=Batman&"
        static let page = "page="
        static let apiKey = "&apikey="
    }

}

