//
//  MovieCell.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 12.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit
import Cosmos

/**
  HOME-FEED MOVIE CELL
 */
class MovieCell: UICollectionViewCell {
    
 
    lazy var titleLabel:UILabel = {
          let titleLbl = UILabel()
          titleLbl.text = "Title 1"
          titleLbl.textColor = ColorDesign.orangeColor
          titleLbl.font = UIFont.boldSystemFont(ofSize: 18)
          return titleLbl
      }()
    
        lazy var simpleView:UIView = {
            let simpleView = UIView()
            simpleView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            return simpleView
        }()
    
      lazy var image:UIImageView = {
          let image = UIImageView()
          image.contentMode = .scaleToFill
          return image
      }()
      
    override init(frame: CGRect) {
            super.init(frame:frame)
        self.backgroundColor = ColorDesign.darkGrayColor
            addElementInSuperView()
            setUIConstraint()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Add child-view in superview
    fileprivate func addElementInSuperView() {
       self.addSubview(image)
       image.addSubview(simpleView)
       simpleView.addSubview(titleLabel)
    }
    
    //Autolayout constraint
    fileprivate func setUIConstraint() {
        image.addAnchor(to: self)
        image.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        simpleView.setAnchor(top: nil, left: image.leadingAnchor, bottom: image.bottomAnchor, right: image.trailingAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 10, width: 10, height: 55)
        titleLabel.setAnchor(top: simpleView.topAnchor, left: simpleView.leadingAnchor, bottom: simpleView.bottomAnchor, right: simpleView.trailingAnchor, paddingTop: 5, paddingLeft: 5, paddingRight: -5, paddingBottom: -15)
    }
    
    //Cell Identifier
    class func getCellReuseId() -> String {
        return "moveCellId"
    }
    
    //Populate view
    func updateView(title:String, path:String){
       self.titleLabel.text = title
       self.image.loadImageUsingCache(withUrl: path)
    }
}
