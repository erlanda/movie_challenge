//
//  ARestService.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 15.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import Foundation


class ARestService {

    static let sharedInstance = ARestService()
    private init(){}
    private let apiKey = "4d634b93235fd36edf08c24da392b294"
    private let baseApiUrl = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    
    
    /**
          START   URLSession
     */
     func loadUrlSession<C:Codable>(url :URL, params:[String:String]? = nil, completion: @escaping(Result<C, ErrorResponse>) -> ()){
          guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else{
              completion(.failure(.invalidUrl))
              return
          }
          var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
          if let params = params{
              queryItems.append(contentsOf: params.map{URLQueryItem(name: $0.key, value: $0.value)})
          }
          urlComponents.queryItems = queryItems
          guard let finalURL = urlComponents.url else{
              completion(.failure(.invalidUrl))
              return
          }
          print("final url \(finalURL)")
          urlSession.dataTask(with: finalURL){(data, response, error) in
              if(error != nil){
                  completion(.failure(.apiError))
              }
              guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else{
                  self.executeCompletionHandler(with: .failure(.invalidResponse), completion: completion)
                  return
              }
              guard let data = data else{
                  self.executeCompletionHandler(with: .failure(.noData), completion: completion)
                  return
              }
              do {
                  let decodeResponse = try JSONDecoder().decode(C.self, from: data)
                  self.executeCompletionHandler(with: .success(decodeResponse), completion: completion)
              }catch{
                  self.executeCompletionHandler(with: .failure(.serializationError), completion: completion)
              }
          }.resume()
      }
      
      
    /**
                EXECUTE COMPLETION HANDLER IN MAIN THREAD
     */
      private func executeCompletionHandler<C:Codable>(with result: Result<C, ErrorResponse>, completion: @escaping(Result <C,  ErrorResponse>) -> ()){
          DispatchQueue.main.async {
              completion(result)
          }
      }
}
