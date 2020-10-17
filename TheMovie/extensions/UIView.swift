//
//  UIView.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 12.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit

extension UIView{
    
    func setAnchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop:CGFloat, paddingLeft:CGFloat, paddingRight:CGFloat, paddingBottom:CGFloat, width:CGFloat = 0, height:CGFloat = 0){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let bottom = bottom{
            self.bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom).isActive = true
        }
        if let right = right{
            self.trailingAnchor.constraint(equalTo: right, constant: paddingRight).isActive = true
        }
        if let left = left{
            self.leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if width != 0 {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        var safeTopAnchor :NSLayoutYAxisAnchor{
            if #available(iOS 11.0, *){
                return safeAreaLayoutGuide.topAnchor
            }
            return topAnchor
        }
        var safeLeftAnchor :NSLayoutXAxisAnchor{
            if #available(iOS 11.0, *){
                return safeAreaLayoutGuide.leftAnchor
            }
            return leftAnchor
        }
        var safeRightAnchor :NSLayoutXAxisAnchor{
            if #available(iOS 11.0, *){
                return safeAreaLayoutGuide.rightAnchor
            }
            return rightAnchor
        }
        var safeBottomAnchor :NSLayoutYAxisAnchor{
            if #available(iOS 11.0, *){
                return safeAreaLayoutGuide.bottomAnchor
            }
            return bottomAnchor
        }
        
    }
    
    
    func addAnchor(to superView:UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
    }
}


extension UISearchBar{
    var textfield :UITextField?{
        return subviews.first?.subviews.compactMap{ $0 as? UITextField }.first
    }
    
}
let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        if (!urlString.isEmpty && urlString != ""){
        let url = URL(string: Config.baseImagePath + urlString)
        if url == nil {return}
        self.image = nil

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }

        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .white)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.addAnchor(to: self)

        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                activityIndicator.removeFromSuperview()
            }
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                }
            }

        }).resume()
        }else{
            self.image = UIImage(named: "no_image")
        }
    }
}


extension UIImage{
    func getCropRatio() -> CGFloat{
        let widthRatio = CGFloat(self.size.width / self.size.height)
        return widthRatio
    }
}
extension UICollectionView {
func reloadWithAnimation() {
    self.reloadData()
    let collectionWidth = self.bounds.size.width
    let cells = self.visibleCells
    var delayCounter = 0
    for cell in cells {
        cell.transform = CGAffineTransform(translationX: collectionWidth, y: 0)
    }
    for cell in cells {
        UIView.animate(withDuration: 1.5, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveLinear, animations: {
            cell.transform = CGAffineTransform.identity
        }, completion: nil)
        delayCounter += 1
    }
}
}
