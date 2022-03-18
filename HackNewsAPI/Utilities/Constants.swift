//
//  Constants.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 18.03.2022.
//

import UIKit

enum K {
    static let appName = "Hacker News"
    
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
}
