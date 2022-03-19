//
//  NewsCell.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 18.03.2022.
//

import UIKit

final class NewsCell: UITableViewCell {

    var newsItem: NewsItemLayout? {
        didSet {
            addNewsItem()
        }
    }
    
    func addNewsItem() {
        let width = contentView.bounds.width
        
        if let arrangment = newsItem?.arrangement(
            width: width,
            height: K.cellHeight) {
            
            arrangment.makeViews(in: contentView)
        }
    }
}
