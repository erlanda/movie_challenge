//
//  MoviesListViewModel.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 12.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit
import RxSwift

protocol MovieProtocol:class {
  func messageDisplay(value:String)
  func showIndicator(value:Bool)
  func viewReloadData()
}

public class MoviesListViewModel {
     
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
    let moviesList :PublishSubject<[Movie]> = PublishSubject()
    public let _fetchingMore : PublishSubject<Bool> = PublishSubject()
    
    //Fetch movies from server
    func fetchMovieListFromServer(){
        showIndicatorInMainThread(value: true)
        MovieService().getMovieList(page: "\(currentPage)") { [weak self] (result) in
            self?.fetchingMore = true
            self?.showIndicatorInMainThread(value: false)
            switch result{
            case .success(let response):
                self?.loadMoviesInMainThread(movies: response.results, totalPages: response.total_pages ?? 1)
            case .failure(let error):
                DispatchQueue.main.async {
                    if let delegate = self?.movieDelegate {
                     delegate.messageDisplay(value: error.localizedDescription)
                    }
                }
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
    fileprivate func loadMoviesInMainThread(movies:[Movie], totalPages:Int){
        DispatchQueue.main.async { [weak self] in
            self?.fetchingMore = false
            if (self?.currentPage ?? 1 > 1){
                self?.movieList.append(contentsOf: movies)
            }else{
                self?.totalPages = totalPages
                self?.movieList = movies
            }
        }
    }
    
    //Configure Movie Cell
    func configureMovieCell(indexPath:IndexPath,collectionView:UICollectionView)->UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.getCellReuseId(), for: indexPath) as! MovieCell
        cell.updateView(title: self.movieList[indexPath.row].title ?? "" , path: movieList[indexPath.row].poster_path ?? "")
        return cell
    }
    
    
    //Get more data from server when scroll/ change the page nr
    func loadMoreData(indexPath:IndexPath){
        let lastItem = self.movieList.count - 1
        if (indexPath.item == lastItem){
            if(!fetchingMore){
                if currentPage < totalPages{
                 currentPage += 1
                 self.fetchMovieListFromServer()
                }
             }
         }
    }
    
}
