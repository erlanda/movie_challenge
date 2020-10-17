//
//  MovieOverviewCell.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 13.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit
import Cosmos

class MovieOverviewCell:UITableViewCell{
    
    lazy var simpleView:UIView = {
        let simpleView = UIView()
        simpleView.translatesAutoresizingMaskIntoConstraints = false
        simpleView.backgroundColor = ColorDesign.orangeColor
        return simpleView
    }()
    lazy var titleDescription:UILabel = {
       let titleLbl = UILabel()
       titleLbl.text = "Overview"
       titleLbl.translatesAutoresizingMaskIntoConstraints = false
       titleLbl.textColor = .white
       titleLbl.font = UIFont.boldSystemFont(ofSize: 22)
       return titleLbl
    }()
    
       lazy var starRate:CosmosView = {
          let star = CosmosView()
          star.settings.updateOnTouch = false
          star.settings.filledColor = ColorDesign.orangeColor
          star.settings.emptyColor = ColorDesign.orangeColor
          star.settings.starMargin = 1.5
          star.settings.starSize = 23
          star.settings.textFont = UIFont.systemFont(ofSize: 16)
          star.settings.emptyBorderColor = .black
          star.settings.filledBorderColor = .black
          star.settings.textColor = ColorDesign.orangeColor
          star.translatesAutoresizingMaskIntoConstraints = false
          return star
     }()
    
      lazy var summaryMovie:UITextView = {
          let descriptionLbl = UITextView()
          descriptionLbl.textColor = .lightGray
          descriptionLbl.isSelectable = false
          descriptionLbl.isEditable = false
          descriptionLbl.isScrollEnabled = false
          descriptionLbl.textAlignment = .left
          descriptionLbl.backgroundColor = ColorDesign.darkGrayColor
          return descriptionLbl
     }()
    lazy var overviewMovie:UITextView = {
          let descriptionLbl = UITextView()
          descriptionLbl.textColor = .lightGray
          descriptionLbl.font = UIFont.boldSystemFont(ofSize: 18)
          descriptionLbl.isSelectable = false
          descriptionLbl.isEditable = false
          descriptionLbl.isScrollEnabled = false
          descriptionLbl.textAlignment = .left
          descriptionLbl.backgroundColor = ColorDesign.darkGrayColor
         return descriptionLbl
     }()
    
    lazy var genresText:UILabel = {
      let titleLbl = UILabel()
      titleLbl.text = "Comedy"
      titleLbl.translatesAutoresizingMaskIntoConstraints = false
      titleLbl.textColor = .lightGray
      titleLbl.font = UIFont.boldSystemFont(ofSize: 16)
      return titleLbl
    }()
    
    func updateView(movieDetail:MovieDetail){
        genresText.text = movieDetail.genreText
        starRate.settings.totalStars = movieDetail.ratingText.0
        starRate.text = movieDetail.ratingText.1
        overviewMovie.text = movieDetail.overview ?? ""
        setupSummaryMovie(status: movieDetail.status ?? "", tagline: movieDetail.tagline ?? "")
    }
    
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubiews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
      //Add child-view in superview
    fileprivate func addSubiews() {
      self.backgroundColor = ColorDesign.darkGrayColor
      self.addSubview(genresText)
        self.addSubview(starRate)
      self.addSubview(simpleView)
      self.addSubview(titleDescription)
      self.addSubview(overviewMovie)
      self.addSubview(summaryMovie)
    }
      
     //Autolayout constraint
    fileprivate func setupLayout(){
        
        genresText.setAnchor(top: topAnchor, left: leadingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 7, paddingLeft: 13, paddingRight: 0, paddingBottom: 0)
        
        starRate.setAnchor(top: genresText.bottomAnchor, left: leadingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 7, paddingLeft: 13, paddingRight: 0, paddingBottom: 0)
//        starRate.centerYAnchor.constraint(equalTo: simpleView.centerYAnchor).isActive = true
//        starRate.leadingAnchor.constraint(equalTo: simpleView.leadingAnchor, constant: 7).isActive = true
        
        titleDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        titleDescription.topAnchor.constraint(equalTo: starRate.bottomAnchor, constant: 15).isActive = true
        
        simpleView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        simpleView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16).isActive = true
        simpleView.topAnchor.constraint(equalTo:titleDescription.bottomAnchor, constant: 5).isActive = true
        simpleView.widthAnchor.constraint(equalTo: titleDescription.widthAnchor , constant: 10).isActive = true
       
        overviewMovie.setAnchor(top: simpleView.bottomAnchor, left: leadingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 10, paddingLeft: 16, paddingRight: -16, paddingBottom: 0)
        summaryMovie.setAnchor(top: overviewMovie.bottomAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, paddingTop: 10, paddingLeft: 16, paddingRight: -16, paddingBottom: -10)
    }
    
    class func getCellReuseId() -> String {
     return "moveOverviewCellId"
    }
    
    
    func setupSummaryMovie(status : String, tagline:String){
        
        let attributedText = NSMutableAttributedString()
        if status.count != 0 {
            attributedText.append(NSAttributedString(string: "Status: ", attributes: [NSAttributedString.Key.font :UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor : UIColor.white]))
            attributedText.append(NSAttributedString(string: status + " \n \n", attributes: [NSAttributedString.Key.font :UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.lightGray]))
        }
        if tagline.count != 0 {
            attributedText.append(NSAttributedString(string: "Tagline \n", attributes: [NSAttributedString.Key.font :UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor : ColorDesign.orangeColor]))
            
            attributedText.append(NSAttributedString(string: tagline, attributes: [NSAttributedString.Key.font :UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.lightGray]))
        }
        summaryMovie.attributedText = attributedText
        
    }
}
