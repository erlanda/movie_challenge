//
//  SearchMovieCellViewModel.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 14.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit

protocol MovieCellViewModel {
    
    var movieItem : Movie   { get }
    var imagePath  :String  { get }
    var movieTitle :String  { get }
    
}

extension Movie : MovieCellViewModel{
    
    var movieItem: Movie {
        return self
    }
    
    var imagePath: String {
        return poster_path ?? ""
    }
    
    var movieTitle: String {
        return title ?? ""
    }
    
}
