//
//  NewsPresenter.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 18.03.2022.
//

import Foundation

// MARK: - Protocol requirements
protocol NewsPresenterProtocol {
    func getNews(completion: @escaping (Result<News, Error>) -> Void)
    func getNews(
        withQuery query: String, completion: @escaping (Result<News, Error>) -> Void)
}

class NewsPresenter {
    // MARK: - Dependencies
    weak var view: NewsViewProtocol?
    var networkService: NetworkServiceProtocol
    
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
    func getNews(completion: @escaping (Result<News, Error>) -> Void) {
        networkService.fetchFirstPagePosts(completion: completion)
    }
    
    func getNews(withQuery query: String, completion: @escaping (Result<News, Error>) -> Void) {
        networkService.fetchFilteredStories(query: query, completion: completion)
    }
}
