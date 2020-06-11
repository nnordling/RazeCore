//
//  Networking.swift
//  RazeCore
//
//  Created by Niclas Nordling on 2020-06-11.
//

import Foundation

extension RazeCore {
    public class Networking {
        
        /// Responsible for handling networking calls.
        /// - Warning: Must create before using any public APIs
        public class Manager {
            public init() {}
            
            private let session = URLSession.shared
            
            public func loadData(from url: URL, completion: @escaping (NetworkResult<Data>) -> Void) {
                let task = session.dataTask(with: url) { (data, response, error) in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completion(result)
                }
                task.resume()
            }
        }
        
        public enum NetworkResult<Value> {
            case success(Value)
            case failure(Error?)
        }
    }
}
