//
//  File.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 19.03.2022.
//

import UIKit

extension UINavigationController {
    func makeAppearance() -> UINavigationBarAppearance {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = K.Colors.light
        appearance.titleTextAttributes = [
            .foregroundColor: K.Colors.white,
            .font: UIFont.systemFont(ofSize: 30),
            .kern: 2
        ]
        return appearance
    }
}
