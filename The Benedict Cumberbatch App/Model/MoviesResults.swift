//
//  MoviesResults.swift
//  The Benedict Cumberbatch App
//
//  Created by Twinkle T on 2022-06-27.
//

import Foundation
class MoviesResults: Codable {
    let results: [CumberbatchMovies]
    let page:Int?
}
