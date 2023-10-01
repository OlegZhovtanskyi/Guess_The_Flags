//
//  Buttons.swift
//  Guess The Flags - UIKit version
//
//  Created by Oleg Zhovtanskyi on 01/10/2023.
//

import UIKit

struct Buttons {
    let tag: Int
    
    lazy var btn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.imageView?.contentMode = .scaleAspectFill
        btn.layer.borderWidth = 1
        btn.tag = tag
        return btn
    }()
}
