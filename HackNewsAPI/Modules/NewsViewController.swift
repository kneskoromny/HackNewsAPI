//
//  ViewController.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 18.03.2022.
//

import UIKit
import LayoutKit

protocol NewsViewProtocol: AnyObject {
    
}

class NewsViewController: UIViewController {
    
    var presenter: NewsPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
//        presenter.getNews { result in
//            switch result {
//
//            case .success(let news):
//                print("hitsCount: \(news.hits.count)")
//            case .failure(let error):
//                print("error: \(error)")
//            }
//        }
        
        presenter.getNews(withQuery: "google") { result in
            switch result {
                
            case .success(let news):
                print("hitsCount: \(news.hits)")
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    
    func setupView() {
        let networkService = NetworkService()
        let presenter = NewsPresenter(
            view: self, networkService: networkService
        )
        self.presenter = presenter
    }
    
}

extension NewsViewController: NewsViewProtocol {
    
}
