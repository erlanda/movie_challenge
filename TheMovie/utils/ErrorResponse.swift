//
//  ErrorResponse.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 11.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import Foundation

enum ErrorResponse:Error, CustomNSError{
    case apiError
    case invalidUrl
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String{
        switch self {
            case .apiError: return "Failed to fetch data"
            case .invalidUrl: return "Invalid url"
            case .invalidResponse: return "Invalid response"
            case .noData: return "No data"
            case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any]{
       return [NSLocalizedDescriptionKey:localizedDescription]
    }
}
