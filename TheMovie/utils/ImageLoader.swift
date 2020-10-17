////
////  ImageLoader.swift
////  TheMovie
////
////  Created by Erlanda mansaku on 12.10.20.
////  Copyright © 2020 Erlanda mansaku. All rights reserved.
////
//
//import UIKit
//import PKHUD
//
//public let _imageCache = NSCache<AnyObject,UIImage>()
//class ImageLoader: UIImageView{
//    
//    var imageCache = _imageCache
//   
//    func loadImage(with path:String){
//     if (!path.isEmpty && path != ""){
//        let url = URL(string: Config.baseImagePath + path)!
//         if let imageFromCache = imageCache.object(forKey: path as NSString)  {
//            self.image = imageFromCache
//            return
//        }
//        DispatchQueue.global(qos: .background).async {[weak self] in
//            guard let self = self else { return}
//            do{
//                let data = try Data(contentsOf: url)
//                guard let imgToCache = UIImage(data: data) else{ return}
//                self.imageCache.setObject(imgToCache, forKey: path as NSString)
//                DispatchQueue.main.async { [weak self] in
//                    self?.image = imgToCache
//                    self?.contentMode = .scaleToFill
//                }
//            }catch{
//                print(error.localizedDescription)
//                self.image = UIImage(named: "no_image")
//                self.contentMode = .scaleAspectFit
//            }
//        }
//     }else{
//        self.image = UIImage(named: "no_image")
//        self.contentMode = .scaleAspectFit
//        }
//        
//    }
//    
//    
//        
//   
////    var imageUrlString :String?
////    func loadImageUsingURLString(_ urlString : String){
////        imageUrlString = urlString
////        let url = URL(string: urlString)
////
////
////        image = nil
////        if let imageFromCache = imageCache.object(forKey: urlString as NSString)  {
////            self.image = imageFromCache
////            return
////        }
////        guard var urlComponents = URLComponents(url: url!, resolvingAgainstBaseURL: false) else{
////                  //completion(.failure(.invalidUrl))
////                  return
////              }
////        let queryItems = [URLQueryItem(name: "api_key", value: Config.apiKey)]
////
////              urlComponents.queryItems = queryItems
////              guard let finalURL = urlComponents.url else{
////                  //completion(.failure(.invalidUrl))
////                  return
////              }
////              print("final url \(finalURL)")
////
////        URLSession.shared.dataTask(with: finalURL,completionHandler:{ (data,response,error) in
////            if error != nil{
////                return
////            }
////            DispatchQueue.main.async(execute: {
////                let imageToCache = UIImage(data: data!)
////                if self.imageUrlString == urlString{
////                    self.image = imageToCache
////                }
////                guard let imgToCache = imageToCache else {return}
////                self.imageCache.setObject(imgToCache, forKey: urlString as NSString)
////            })
////        }).resume()
//        
//  //  }
//    
//}
