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
