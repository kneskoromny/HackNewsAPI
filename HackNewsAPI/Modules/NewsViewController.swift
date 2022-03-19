//
//  ViewController.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 18.03.2022.
//

import UIKit
import LayoutKit

protocol NewsViewProtocol: AnyObject {
    func updateUI()
}

class NewsViewController: UIViewController {
    
    var presenter: NewsPresenterProtocol!
    
    private let tableView = makeTableView()
    private let spinner = makeSpinner()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setupView()
        configureLayout()
        
        presenter.getNews()
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
        view.addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        tableView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension NewsViewController: NewsViewProtocol {
    func updateUI() {
        tableView.reloadData()
        spinner.stopAnimating()
        spinner.isHidden = true
    }  
}

// MARK: - Table view data source
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.hitsCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellID, for: indexPath) as! NewsCell
        let hit = presenter.getHit(atIndexPath: indexPath)
        cell.newsItem = NewsItemLayout(hit: hit)
        
        return cell
    }
}

// MARK: - Table view delegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        K.cellHeight
    }
}
