//
//  NewsItem.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 19.03.2022.
//

import UIKit
import LayoutKit

final class NewsItemLayout: InsetLayout<UIView> {
    
    public init(hit: Hit) {
        
        let image = SizeLayout<UIImageView>(
            width: 50,
            height: 50,
            config: { imageView in
                imageView.contentMode = .scaleAspectFit
                imageView.image = UIImage(named: "murmansk")
            }
        )
        
        let titleLayout = LabelLayout(
            text: hit.title ?? "No title",
            font: UIFont.systemFont(ofSize: 15)
        ) { label in
            label.textColor = K.Colors.dark
        }
        
        let authorLayout = LabelLayout(
            text: hit.author ?? "No author",
            font: UIFont.systemFont(ofSize: 12)
        ) { label in
            label.textColor = K.Colors.light
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
                        alignment: .fillLeading,
                        sublayouts: [titleLayout, authorLayout]
                    )
                ]
            )
        )
    }
}
