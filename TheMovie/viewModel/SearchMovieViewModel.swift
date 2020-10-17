//
//  SearchMovieViewModel.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 14.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit


class SearchMovieViewModel {
    weak var movieDelegate : MovieProtocol?
    var currentPage:Int = 1
    var totalPages:Int = 1
    var fetchingMore = false
      
    var movieList : [Movie] = [Movie]() {
      didSet{
          DispatchQueue.main.async { [weak self] in
           if let delegate = self?.movieDelegate { delegate.viewReloadData() }
          }
      }
    }
    
    //Fetch movies from server
      func fetchMovieListFromServer(searchedText:String){
           showIndicatorInMainThread(value: true)
           MovieService().searchMovie(searchedKeyword: searchedText) { [weak self] (result) in
            self?.showIndicatorInMainThread(value: false)
                switch result{
                 case .success(let response):
                    self?.loadMoviesInMainThread(movies: response.results)
                 case .failure(let error):
                     print(error)
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
      fileprivate func loadMoviesInMainThread(movies:[Movie]){
          DispatchQueue.main.async { [weak self] in
            self?.movieList.removeAll()
             self?.movieList = movies
          }
      }
    
    func removeMovieList(){
        DispatchQueue.main.async { [weak self] in
         self?.movieList.removeAll()
            if let delegate = self?.movieDelegate { delegate.viewReloadData()}
       }
    }
      
      //Configure Movie Cell
    func configureCell(tableView:UITableView, indexPath:IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchMovieCell.getCellReuseId(), for: indexPath) as! SearchMovieCell
        // cell.alpha = 0
        cell.updateView(title: movieList[indexPath.row].title ?? "", path: movieList[indexPath.row].poster_path ?? "")
       

      return cell
    }
}
