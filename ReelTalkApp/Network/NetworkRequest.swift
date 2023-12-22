//
//  NetworkRequest.swift
//  ReelTalkApp
//
//  Created by Cameron Zakkour on 12/18/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
}

class Webservice {
    func fetchData<T: Decodable>(from url: URL, headers: [String: String], completion: @escaping (Result<T, Error>) -> Void) {
            
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = headers
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                
                // check the network for any errors
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                // check for response status code
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                    let error = NSError(domain: "HTTPError", code: statusCode, userInfo: nil)
                    completion(.failure(error))
                    return
                }
                
                // check for any data
                guard let data = data else {
                    let error = NSError(domain: "NoDataError", code: 0, userInfo: nil)
                    completion(.failure(error))
                    return
                }
                
                // decodes the data
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
}
