//
//  Labels.swift
//  Guess The Flags - UIKit version
//
//  Created by Oleg Zhovtanskyi on 01/10/2023.
//

import UIKit

struct Label {
    let textAlignment: NSTextAlignment
    let textColor: UIColor
    let font: UIFont
    let text: String?
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = textAlignment
        label.font = font
        label.textColor = textColor
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
