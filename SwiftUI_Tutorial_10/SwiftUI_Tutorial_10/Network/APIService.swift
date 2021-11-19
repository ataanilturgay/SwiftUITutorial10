//
//  APIService.swift
//  SwiftUI_Tutorial_10
//
//  Created by Ata Anıl Turgay on 19.11.2021.
//

import Foundation

public typealias JSON = [String: Any]
public typealias HTTPHeaders = [String: String]

/// 0e51d390-56d3-4149-97d8-5e7369619880

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public class APIClient {
    static let shared = APIClient()
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
  
    func fetchTodoList(url: URL?,
                        completion: @escaping(Result<[TodoModel], APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let todoList = try decoder.decode([TodoModel].self, from: data)
                    completion(Result.success(todoList))
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
}
