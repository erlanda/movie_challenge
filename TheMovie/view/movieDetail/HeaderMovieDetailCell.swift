//
//  HeaderMovieDetailCell.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 13.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit
import Cosmos

class HeaderMovieDetailCell:UITableViewCell{
    
    lazy var moviePosterPathImg :UIImageView = {
       let headerView = UIImageView()
        headerView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        headerView.contentMode = .scaleAspectFill
        headerView.clipsToBounds = true
        headerView.backgroundColor = ColorDesign.darkGrayColor
        headerView.translatesAutoresizingMaskIntoConstraints = false
       return headerView
    }()
    
     //Populate view
    func updateView(imagePath: String){
        self.moviePosterPathImg.loadImageUsingCache(withUrl: imagePath)
    }
    
    //Add child-view in superview
    fileprivate func addElementInSuperview() {
        self.addSubview(moviePosterPathImg)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = ColorDesign.darkGrayColor
        addElementInSuperview()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     //Autolayout constraint
    fileprivate func setupLayout(){
    let margins = self.layoutMarginsGuide
    moviePosterPathImg.setAnchor(top: margins.topAnchor, left: margins.leadingAnchor, bottom: margins.bottomAnchor, right: margins.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0,width: UIScreen.main.bounds.width - 30 ,  height: UIScreen.main.bounds.width )
    }
    
    //Cell Identifier
    class func getCellReuseId() -> String {
        return "headerMovieDetailCellId"
    }
}

