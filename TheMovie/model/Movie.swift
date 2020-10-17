//
//  Movie.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 11.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import Foundation

struct Movie:Codable {
    
    var poster_path:String?
    var adult : Bool?
    var overview:String?
    var release_date : String?
    var genre_ids : [Int]?
    var id :Int
    var original_title:String?
    var original_language :String?
    var title:String?
    var backdrop_path:String?
    var popularity :Double?
    var vote_count:Int?
    var video :Bool?
    var vote_average:Double?
}

struct MovieResponse:Codable {
    var page:Int?
    var results:[Movie]
    var total_results:Int?
    var total_pages:Int?
}
