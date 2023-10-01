//
//  StackView.swift
//  Guess The Flags - UIKit version
//
//  Created by Oleg Zhovtanskyi on 01/10/2023.
//

import UIKit

struct StackView {
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = UIColor(red: 0.35, green: 0.25, blue: 0.66, alpha: 1.0)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    mutating func setUpStack(views: [UIView]) {
        views.forEach {
            stack.addSubview($0)
        }
    }
    
    mutating func setUpConstraits(_ view: UIView){
        stack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}



//[self.scoreLabel, self.firstButton, self.secondButton, self.thirdtButton, self.questionLabel].forEach { stack.addSubview($0)}



