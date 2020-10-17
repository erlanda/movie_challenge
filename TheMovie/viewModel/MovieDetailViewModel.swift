//
//  MovieDetailViewModel.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 15.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit


class MovieDetailViewModel {
    
    
var movie:MovieDetail = MovieDetail()
 weak var movieDelegate : MovieProtocol?

    
 func getMoviewById(movieId:Int){
  self.showIndicatorInMainThread(value: true)
   MovieService().getMovieById(id: movieId) { (result) in
    self.showIndicatorInMainThread(value: false)
       switch result{
       case .failure(let error):
        DispatchQueue.main.async {
            if let delegate = self.movieDelegate {
             delegate.messageDisplay(value: error.localizedDescription)
            }
        }
       case .success(let movieResponse):
        self.loadMovieDetailInMainThread(_movie: movieResponse)
       }
   }
 }
    
//Show loader view in main thread
  fileprivate func showIndicatorInMainThread(value:Bool){
       DispatchQueue.main.async { [weak self] in
        if let delegate = self?.movieDelegate { delegate.showIndicator(value: value)}
       }
   }
    
// Load data in main thread/ set in array
   fileprivate func loadMovieDetailInMainThread(_movie:MovieDetail){
       DispatchQueue.main.async { [weak self] in
        self?.movie = _movie
        if let delegate = self?.movieDelegate { delegate.viewReloadData() }
       }
   }
    
    
    //Configure tableview cell
    func configureTableViewCell(indexPath:IndexPath, tableView:UITableView)->UITableViewCell{
        
        if (movie.poster_path == nil && movie.backdrop_path == nil){
          let cell = tableView.dequeueReusableCell(withIdentifier: MovieOverviewCell.getCellReuseId(), for: indexPath) as! MovieOverviewCell
          cell.selectionStyle = .none
          cell.updateView(movieDetail: self.movie)
          return cell       
        }else{
        if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: HeaderMovieDetailCell.getCellReuseId(), for: indexPath) as! HeaderMovieDetailCell
                 cell.selectionStyle = .none
                 if let path =  movie.poster_path {
                        cell.updateView(imagePath:path)
                 }else if let backdropPath = movie.backdrop_path{
                     cell.updateView(imagePath:backdropPath)
                 }
                    return cell
                }else{
                   let cell = tableView.dequeueReusableCell(withIdentifier: MovieOverviewCell.getCellReuseId(), for: indexPath) as! MovieOverviewCell
                   cell.selectionStyle = .none
                   cell.updateView(movieDetail: self.movie)
                   return cell
                }
        }
        
    }
    
}
