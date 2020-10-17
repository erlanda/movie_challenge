//
//  HomeMovieCell.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 11.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit
import Cosmos

class HomeMovieCell: UICollectionViewCell {
    
    lazy var titleLabel:UILabel = {
     let titleLbl = UILabel()
     titleLbl.text = "Section title"
     titleLbl.translatesAutoresizingMaskIntoConstraints = false
     titleLbl.textColor = ColorDesign.whiteSmoke
     titleLbl.font = UIFont.boldSystemFont(ofSize: 25)
     return titleLbl
    }()
    
    lazy var collectionView :UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout:flowLayout)
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.getCellReuseId())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = ColorDesign.darkGrayColor
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.addSubview(collectionView)
        self.addSubview(titleLabel)
        setUIConstraint()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    class func getCellReuseId() -> String {
        return "homeFeedMoveCellId"
    }
    
    fileprivate func setUIConstraint() {
        titleLabel.setAnchor(top: topAnchor, left: leadingAnchor, bottom: nil, right: trailingAnchor, paddingTop: 5, paddingLeft: 20, paddingRight: 0, paddingBottom: 20)
        collectionView.setAnchor(top: titleLabel.bottomAnchor, left: leadingAnchor, bottom: bottomAnchor, right: trailingAnchor, paddingTop: 25, paddingLeft: 8, paddingRight: 0, paddingBottom: 0)
        
    }
    
    
}

extension HomeMovieCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.getCellReuseId(), for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 150, height: frame.height - 30 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,left: 10,bottom: 0,right: 10)
    }
    
    
}
