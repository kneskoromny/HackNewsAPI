//
//  NewsPresenter.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 18.03.2022.
//

import Foundation

// MARK: - Protocol requirements
protocol NewsPresenterProtocol {
    var hitsCount: Int { get }
    
    func getHit(atIndexPath indexPath: IndexPath) -> Hit
    
    func getNews()
    func getNews(
        withQuery query: String, completion: @escaping (Result<News, Error>) -> Void)
}

class NewsPresenter {
    
    // MARK: - Dependencies
    weak var view: NewsViewProtocol?
    var networkService: NetworkServiceProtocol
    
    // MARK: - Data
    var hits = [Hit]()
    
    // MARK: - Initializers
    init(
        view: NewsViewProtocol, networkService: NetworkServiceProtocol
    ) {
        self.view = view
        self.networkService = networkService
    }
}

// MARK: - Protocol requirements implementation
extension NewsPresenter: NewsPresenterProtocol {
    var hitsCount: Int {
        hits.count
    }
    
    func getHit(atIndexPath indexPath: IndexPath) -> Hit {
        hits[indexPath.row]
    }
    
    func getNews() {
        networkService.fetchFirstPagePosts { result in
            
            switch result {
            case .success(let news):
                self.hits = news.hits
                DispatchQueue.main.async {
                    print(#function, "Current Thread: \(Thread.current)")
                    self.view?.updateUI()
                }
                
            case .failure(let error):
                print("\(K.AppErrors.fetchError): \(error)")
            }
        }
    }
    
    func getNews(withQuery query: String, completion: @escaping (Result<News, Error>) -> Void) {
        networkService.fetchFilteredStories(query: query, completion: completion)
    }
}
