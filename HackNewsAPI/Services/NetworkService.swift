//
//  NetworkService.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 18.03.2022.
//

import Foundation
import Moya

// MARK: - Protocol requirements
protocol NetworkServiceProtocol {
    var provider: MoyaProvider<API> { get }
    
    func fetchFirstPagePosts(completion: @escaping (Result<News, Error>) -> Void)
    func fetchFilteredStories(
        query: String, completion: @escaping (Result<News, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    var provider = MoyaProvider<API>()
    
    func fetchFirstPagePosts(completion: @escaping (Result<News, Error>) -> Void) {
        request(target: .frontPage, completion: completion)
    }
    
    func fetchFilteredStories(
        query: String, completion: @escaping (Result<News, Error>) -> Void) {
            request(target: .search(query: query), completion: completion)
    }
}
// MARK: - Protocol requirements implementation
extension NetworkService {
    private func request<T: Decodable>(
        target: API, completion: @escaping (Result<T, Error>) -> Void) {
        print(#function, "Current Thread: \(Thread.current)")
          provider.request(target) { result in
              switch result {
              case let .success(response):
                  do {
                      let results = try JSONDecoder().decode(T.self, from: response.data)
                      completion(.success(results))
                  } catch let error {
                      completion(.failure(error))
                  }
              case let .failure(error):
                  completion(.failure(error))
              }
          }
      }
}
