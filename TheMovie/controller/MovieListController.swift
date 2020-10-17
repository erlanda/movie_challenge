//
//  MovieListController.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 10.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit


class MovieListController :UICollectionViewController, MovieProtocol{
    
    var movieViewModel : MoviesListViewModel = MoviesListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupNavigationController()
         self.movieViewModel.movieDelegate = self
         movieViewModel.fetchMovieListFromServer()
         self.collectionView.backgroundColor = ColorDesign.darkGrayColor
         collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.getCellReuseId())
    }
    
    //configure navigationbar
    fileprivate func setupNavigationController(){
        self.navigationItem.title = "Movies"
        self.view.backgroundColor = ColorDesign.darkGrayColor
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}


extension MovieListController : UICollectionViewDelegateFlowLayout {
    //nr of rows
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieViewModel.movieList.count
    }
    //configure collectionview cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return movieViewModel.configureMovieCell(indexPath: indexPath, collectionView: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 20, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    //Go to movie detail vc
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(MovieDetailVC(movieId: movieViewModel.movieList[indexPath.item].id, title: movieViewModel.movieList[indexPath.item].title  ?? ""), animated: false)
    }
    //Fetch more data
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        movieViewModel.loadMoreData(indexPath: indexPath)
    }
    
    func messageDisplay(value: String) {}
       
    func showIndicator(value: Bool) {}
       
    func viewReloadData() {self.collectionView.reloadData()}
    
    
}
