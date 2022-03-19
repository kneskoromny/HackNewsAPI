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
