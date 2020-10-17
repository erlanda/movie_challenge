//
//  MovieDetailVC.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 12.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit
import Cosmos

class MovieDetailVC:UIViewController, MovieProtocol{
   
    var movieId:Int?
    var tableView:UITableView = UITableView()
    var movieDetailViewModel :MovieDetailViewModel = MovieDetailViewModel()
    
    init(movieId:Int,title:String){
        self.movieId = movieId
        super.init(nibName: nil, bundle: nil)
        self.navigationItem.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let movieId = self.movieId else {
            return
        }
        movieDetailViewModel.movieDelegate = self
        movieDetailViewModel.getMoviewById(movieId: movieId)
        configureTableView()
        
    }

    fileprivate func tableViewDelegate() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // Register custom tableview cell
    fileprivate func registerCustomTableViewCell() {
        self.tableView.register(HeaderMovieDetailCell.self, forCellReuseIdentifier: HeaderMovieDetailCell.getCellReuseId())
        self.tableView.register(MovieOverviewCell.self, forCellReuseIdentifier: MovieOverviewCell.getCellReuseId())
    }
    
    // Set style tableview
    fileprivate func tableViewStyle() {
        self.tableView.backgroundColor = ColorDesign.darkGrayColor
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 300
    }
    
    // Configure tableview
    fileprivate func configureTableView() {
        registerCustomTableViewCell()
        tableViewStyle()
        view.addSubview(tableView)
        tableViewDelegate()
        tableView.addAnchor(to: view)
    }
    
}

extension MovieDetailVC: UITableViewDelegate, UITableViewDataSource{
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if(movieDetailViewModel.movie.backdrop_path == nil && movieDetailViewModel.movie.poster_path == nil){
            return 1
        }else{
            return 2
        }
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.movieDetailViewModel.configureTableViewCell(indexPath: indexPath, tableView: self.tableView)
     }
    
    func messageDisplay(value: String) {}
       
    func showIndicator(value: Bool) {}
       
    func viewReloadData() {self.tableView.reloadData()}
    
}




