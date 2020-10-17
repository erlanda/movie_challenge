//
//  MovieDetail.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 11.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import Foundation

struct MovieDetail: Codable {

    var id                      : Int?
    var adult                   : Bool?
    var belongs_to_collection   : BelongsToCollection?
    var budget                  : Int?
    var genres                  : [Genre]?
    var homepage                : String?
    var imdb_id                 : String?
    var original_language       : String?
    var original_title          : String?
    var overview                : String?
    var popularity              : Double?
    var poster_path             : String?
    var production_companies    : [ProductionCompany]?
    var production_countries    : [ProductionCountry]?
    var release_date            : String?
    var revenue                 : Int?
    var runtime                 : Int?
    var spoken_languages        : [SpokenLanguage]?
    var status                  : String?
    var tagline                 : String?
    var title                   : String?
    var video                   : Bool?
    var vote_average            : Double?
    var vote_count              : Int?
    var backdrop_path           : String?

    
    //All genres in one string
    var genreText :String {
       var genreText = ""
        if let _genres = genres{
           for item in _genres{
               if let name = item.name{
                   if genreText == ""{
                       genreText = name
                   }else{ genreText = genreText + ", " + name}
               }
           }
        }
        return genreText
    }
    
    var ratingText:(scoreNr:Int,scoreText:String){
        var scoreNr = 0
        var scoreText = ""
        if let voteAv = vote_average{
            let rating = Int(voteAv)
            if rating > 0 {
                scoreText = "\(rating)/10"
                scoreNr = rating
            }
            
        }
       return (scoreNr, scoreText)
    }
    
}


struct BelongsToCollection : Codable{
    var id            : Int?
    var name          : String?
    var poster_path   : String?
    var backdrop_path : String?
}
    

