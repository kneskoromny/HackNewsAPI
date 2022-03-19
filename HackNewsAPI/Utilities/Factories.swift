//
//  Factories.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 18.03.2022.
//

import UIKit

func makeTableView() -> UITableView {
    let tv = UITableView()
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.register(NewsCell.self, forCellReuseIdentifier: K.cellID)
    return tv
}

func makeSpinner() -> UIActivityIndicatorView {
    let s = UIActivityIndicatorView()
    s.translatesAutoresizingMaskIntoConstraints = false
    s.style = .large
    s.startAnimating()
    return s
}

func makeBarButtonItem(in vc: UIViewController, withAction action: Selector) -> UIBarButtonItem {
    let bi = UIBarButtonItem(
        barButtonSystemItem: .search, target: vc, action: action)
    bi.tintColor = K.Colors.white
    return bi
}

func showAlert(
    in vc: UIViewController, completion: @escaping (String) -> Void) {
        let ac = UIAlertController(
            title: "Search",
            message: "Let's search something interesting right now!",
            preferredStyle: .alert
        )
        ac.addTextField { tf in
            tf.placeholder = "type query here"
        }
        let action = UIAlertAction(
            title: "Go ahead!", style: .default) { _ in
                guard let text = ac.textFields?.first?.text else { return }
                completion(text)
            }
        ac.addAction(action)
        vc.present(ac, animated: true, completion: nil)
        
    }
