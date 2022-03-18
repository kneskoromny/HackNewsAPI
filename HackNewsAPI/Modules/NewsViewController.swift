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
    
    let tableView = makeTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        setupView()
        configureLayout()
        
//        presenter.getNews { result in
//            switch result {
//
//            case .success(let news):
//                print("hitsCount: \(news.hits.count)")
//            case .failure(let error):
//                print("error: \(error)")
//            }
//        }
        
//        presenter.getNews(withQuery: "google") { result in
//            switch result {
//
//            case .success(let news):
//                print("hitsCount: \(news.hits)")
//            case .failure(let error):
//                print("error: \(error)")
//            }
//        }
    }
    
    func setupView() {
        let networkService = NetworkService()
        let presenter = NewsPresenter(
            view: self, networkService: networkService
        )
        self.presenter = presenter
    }
    
    func configureLayout() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}

extension NewsViewController: NewsViewProtocol {
    
}
// MARK: - Table view data source
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellID, for: indexPath) as! NewsCell
        
        return cell
    }
    
    
}
