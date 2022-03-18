//
//  Model.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 18.03.2022.
//

import Foundation

// MARK: - News
struct News: Codable {
    let hits: [Hit]
}

// MARK: - Hit
struct Hit: Codable {
    let title: String?
    let url: String?
    let author: String?
}
