//
//  UIColor+Ext.swift
//  ChatApp
//
//  Created by eren  on 18/11/2023.
//

import UIKit

extension UIColor {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = UIColor(named: "ColorAppBlue")
    let text = UIColor(named: "ColorGray")
    let warmGrey0_7Alpha = UIColor(displayP3Red: 136/255, green: 136/255, blue: 136/255, alpha: 0.7)
}
