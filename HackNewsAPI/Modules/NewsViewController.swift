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
    
    let tableView = makeTableView()

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
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    @objc func btnAction() {
        print("btn tapped!")
    }
}

extension NewsViewController: NewsViewProtocol {
    func updateUI() {
        tableView.reloadData()
    }
    
    
}

// MARK: - Table view data source
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.hitsCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellID, for: indexPath) as! NewsCell
        cell.newsItem = NewsItemLayout(
            title: "Good bye \(indexPath.row) times!", author: "Kirill Neskoromnyy", url: "some url", action: #selector(btnAction)
        )
        return cell
    }
}

// MARK: - Table view delegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        K.cellHeight
    }
}
