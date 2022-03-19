//
//  Constants.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 18.03.2022.
//

import UIKit

enum K {
    
    static let appName = "Hacker News"
    static let cellID = "NewsCell"
    static let cellHeight: CGFloat = 70
    
    enum Colors {
        static let white = UIColor.systemBackground
        static let light = UIColor.systemGray4
        static let dark = UIColor.label
    }
    
    enum API {
        static let base = "http://hn.algolia.com/api/v1"
        static let path = "/search"
        
        enum QueryValue {
            static let frontPage = "front_page"
            static let story = "story"
        }
    }
    
    enum AppErrors {
        static let fetchError = "An error occurred while loading data"
    }
}
