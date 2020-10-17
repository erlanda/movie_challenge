//
//  Endpoints.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 11.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import Foundation

enum Endpoints :String, CaseIterable{
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    var description:String{
        switch self {
            case .nowPlaying: return "Now Playing"
            case .upcoming: return "Upcoming"
            case .topRated: return "Top Rated"
            case .popular: return "Popular"
        
        }
    }
}
