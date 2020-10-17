//
//  SearchMovieCell.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 13.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit
/**
    SEARCH MOVIEW CELL
 */
class SearchMovieCell: UITableViewCell {
    
    lazy var titleLabel:UILabel = {
     let titleLbl = UILabel()
     titleLbl.text = "Title 1"
     titleLbl.textColor = .white
     titleLbl.font = UIFont.boldSystemFont(ofSize: 17)
     return titleLbl
    }()
    
    lazy var movieImage:UIImageView = {
     let image = UIImageView()
     image.contentMode = .scaleToFill
     image.backgroundColor = ColorDesign.darkGrayColor
    return image
    }()
    
    lazy var containerView:UIView = {
      let simpleView = UIView()
      simpleView.backgroundColor = .black
      simpleView.layer.cornerRadius = 6
      return simpleView
      }()
    
    //Add child-view in superview
    fileprivate func addElementInSuperview() {
        containerView.addSubview(movieImage)
        containerView.addSubview(titleLabel)
        addSubview(containerView)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.backgroundColor = ColorDesign.darkGrayColor
            self.selectionStyle = .none
            addElementInSuperview()
            setUIConstraint()
    }
    
    //Populate view
    func updateView(title:String, path:String){
        titleLabel.text = title
        movieImage.loadImageUsingCache(withUrl: path)
    }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    //Autolayout constraint
    fileprivate func setUIConstraint() {
        containerView.setAnchor(top: topAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, paddingTop: 5, paddingLeft: 5, paddingRight: -5, paddingBottom: -5, width: self.frame.size.width/3 , height: 110 )
        movieImage.setAnchor(top: containerView.topAnchor, left: containerView.leadingAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 15, paddingRight: 0, paddingBottom: -10,width: 80, height: 100)
        titleLabel.setAnchor(top: containerView.topAnchor, left: movieImage.trailingAnchor, bottom: containerView.bottomAnchor, right: containerView.trailingAnchor, paddingTop: 10, paddingLeft: 15, paddingRight: -15, paddingBottom: -10)
     }
    
     //Cell Identifier
     class func getCellReuseId() -> String {
            return "searchMoveCellId"
     }
    
   
}
