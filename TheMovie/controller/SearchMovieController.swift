//
//  SearchMovieController.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 10.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit
import PKHUD

class SearchMovieController: UIViewController, MovieProtocol {
   
    var tableView:UITableView = UITableView()
    var searchController:UISearchController!
    var searchViewModel : SearchMovieViewModel = SearchMovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchViewModel.movieDelegate = self
        configureNavigationBar()
        configureTableView()
    }

    fileprivate func configureNavigationBar(){
        self.navigationItem.title = "Search"
        self.navigationController?.navigationBar.tintColor = .white
        self.view.backgroundColor = ColorDesign.darkGrayColor
        self.navigationController?.navigationBar.barStyle = .black
        configureSearchController()
    }
    
    fileprivate func configureTableView() {
       self.tableView.register(SearchMovieCell.self, forCellReuseIdentifier: SearchMovieCell.getCellReuseId())
       self.tableView.backgroundColor = ColorDesign.darkGrayColor
       self.view.addSubview(tableView)
       self.tableView.delegate = self
       self.tableView.dataSource = self
       self.tableView.separatorStyle = .none
       self.tableView.rowHeight = UITableView.automaticDimension
       self.tableView.estimatedRowHeight = 110
       self.tableView.addAnchor(to: view)
  }
    
    fileprivate func configureSearchController() {
       searchController = UISearchController(searchResultsController: nil)
       searchController.obscuresBackgroundDuringPresentation = false
       searchController.searchBar.placeholder = "Search movie..."
       searchController.hidesNavigationBarDuringPresentation = false
       searchController.searchBar.searchBarStyle = .minimal
       searchController.searchBar.tintColor = .white
       searchController.searchBar.barTintColor = .white
       searchController.searchBar.delegate = self
       searchController.searchBar.textfield?.textColor = .white
       searchController.searchBar.frame.size.height = 60
       searchController.searchBar.delegate = self
       navigationItem.searchController = searchController
       self.navigationItem.hidesSearchBarWhenScrolling = false
    }
}


extension SearchMovieController: UISearchBarDelegate{
  
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchViewModel.removeMovieList()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("search bar did begin editing....")
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("search bar did end editing....")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty && searchText != ""{
           Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
            self.searchViewModel.fetchMovieListFromServer(searchedText: searchText)
            }
        }else{
           self.searchViewModel.removeMovieList()
        }
    }
   
}

extension SearchMovieController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchViewModel.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        searchViewModel.configureCell(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieDetailVC(movieId: searchViewModel.movieList[indexPath.item].id, title: searchViewModel.movieList[indexPath.item].title ?? "")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func messageDisplay(value: String) {}
       
    func showIndicator(value: Bool) {}
       
    func viewReloadData() {self.tableView.reloadData()}
    
}
