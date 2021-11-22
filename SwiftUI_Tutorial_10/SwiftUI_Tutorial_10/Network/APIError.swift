//
//  APIError.swift
//  SwiftUI_Tutorial_10
//
//  Created by Ata Anıl Turgay on 19.11.2021.
//

import Foundation

public enum APIError: Error, CustomStringConvertible {
    
    case badURL
    case url(URLError?)
    case parsing(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        // user feedback
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong."
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong."
        }
    }
    
    public var description: String {
        //info for debugging
        switch self {
        case .unknown: return "unknown error"
        case .badURL: return "invalid URL"
        case .url(let error):
            return error?.localizedDescription ?? "url session error"
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "")"
        }
    }
}
