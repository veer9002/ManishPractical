//
//  MoviesCell.swift
//  ManishPractical
//
//  Created by Syon on 03/01/19.
//  Copyright © 2019 Syon. All rights reserved.
//

/*
 Response reference
{
    "Title": "Batman Begins",
    "Year": "2005",
    "imdbID": "tt0372784",
    "Type": "movie",
    "Poster": "https://m.media-amazon.com/images/M/MV5BZmUwNGU2ZmItMmRiNC00MjhlLTg5YWUtODMyNzkxODYzMmZlXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_SX300.jpg"
}
*/

import Foundation

struct Movies: Decodable {
    let Search: [Search]
    let totalResults: String
    let Response: String
}

struct Search: Decodable {
    let Title: String
    let Year: String
    let `Type`: String
    let Poster: String
}



