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
    
    tv.backgroundColor = .magenta
    return tv
}
