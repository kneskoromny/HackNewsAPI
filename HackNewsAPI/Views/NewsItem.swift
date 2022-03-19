//
//  NewsItem.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 19.03.2022.
//

import UIKit
import LayoutKit

final class NewsItemLayout: InsetLayout<UIView> {
    
    public init(title: String, author: String, url: String, action: Selector) {
        
        let image = SizeLayout<UIImageView>(
            width: 50,
            height: 50,
            config: { imageView in
                imageView.contentMode = .scaleAspectFit
                imageView.image = UIImage(named: "murmansk")
            }
        )
        
        let titleLayout = LabelLayout(
            text: title,
            font: UIFont.systemFont(ofSize: 15)
        ) { label in
            label.textColor = K.Colors.dark
        }
        
        let authorLayout = LabelLayout(
            text: author,
            font: UIFont.systemFont(ofSize: 12)
        ) { label in
            label.textColor = K.Colors.light
        }
        
        let button = ButtonLayout(
            type: .system,
            title: "Перейти",
            font: UIFont.systemFont(ofSize: 12),
            contentEdgeInsets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            alignment: .center
        ) { btn in
            btn.backgroundColor = K.Colors.dark
            btn.setTitleColor(K.Colors.white, for: .normal)
            btn.layer.cornerRadius = 5
            
            btn.addTarget(nil, action: action, for: .touchUpInside)
        }
        
        super.init(
            insets: EdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            sublayout: StackLayout(
                axis: .horizontal,
                spacing: 20,
                sublayouts: [
                    image,
                    StackLayout(
                        axis: .vertical,
                        spacing: 8,
                        alignment: .center,
                        sublayouts: [titleLayout, authorLayout]
                    ),
                    button
                ]
            )
        )
    }
}
