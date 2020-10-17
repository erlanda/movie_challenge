//
//  MovieAPI.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 11.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import Foundation

protocol MovieAPI {
    
    func getMovieList(page:String, completion: @escaping(Result<MovieResponse,ErrorResponse>)->())
    func getMovieById(id :Int, completion: @escaping(Result<MovieDetail,ErrorResponse>)->())
    func searchMovie(searchedKeyword :String, completion: @escaping(Result<MovieResponse,ErrorResponse>)->())
}


/**
    MOVIE SERVICE
 */
class MovieService:MovieAPI{
      
    /**
            GET MOVE BY ID
     */
    func getMovieById(id: Int, completion: @escaping (Result<MovieDetail, ErrorResponse>) -> ()) {
        guard let url = URL(string: "\(Config.baseUrlApi)/movie/\(id)") else{
            completion(.failure(.invalidUrl))
            return
        }
        ARestService.sharedInstance.loadUrlSession(url: url, completion: completion)
    }
    
    
    /**
                FERTCH MOVIES
     */
    func getMovieList(page:String, completion: @escaping (Result<MovieResponse, ErrorResponse>) -> ()) {
        guard let url = URL(string: "\(Config.baseUrlApi)/discover/movie") else{
         completion(.failure(.invalidUrl))
            return
        }
        ARestService.sharedInstance.loadUrlSession(url: url, params: ["page":page], completion: completion)
      }
    
    
    
    /**
            SEARCH MOVIES
     */
    func searchMovie(searchedKeyword: String, completion: @escaping (Result<MovieResponse, ErrorResponse>) -> ()) {
        guard let url = URL(string: "\(Config.baseUrlApi)/search/movie") else{
            completion(.failure(.invalidUrl))
            return
         }
        ARestService.sharedInstance.loadUrlSession(url: url, params: ["query":searchedKeyword], completion: completion)
    }
}
