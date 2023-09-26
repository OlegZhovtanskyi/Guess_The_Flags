//
//  FlagsView.swift
//  Guess The Flags - UIKit version
//
//  Created by Oleg Zhovtanskyi on 24/09/2023.
//

import UIKit

var gameLogic = GameLogic()

struct FlagsView {
    // MARK: - Vertical Stack
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = UIColor(red: 0.35, green: 0.25, blue: 0.66, alpha: 1.0)
        stack.translatesAutoresizingMaskIntoConstraints = false
        [self.scoreLabel, self.firstButton, self.secondButton, self.thirdtButton, self.questionLabel].forEach { stack.addSubview($0)}
        return stack
    }()
    // MARK: - Label of user score
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .black
        label.font = UIFont(name: "Copperplate", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your score: \(gameLogic.userScore)"
        return label
    }()
    // MARK: - Images of flags
    
    private func flagsButtons(_ tag: Int) -> UIButton {
        lazy var button: UIButton = {
            let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.imageView?.contentMode = .scaleAspectFill
            btn.layer.borderWidth = 1
            btn.tag = tag
            return btn
        }()
        return button
    }
    
    lazy var firstButton = flagsButtons(1)
    lazy var secondButton = flagsButtons(2)
    lazy var thirdtButton = flagsButtons(3)
    
    mutating func setUpImageForButton() {
        var correctAnswer = Int.random(in: 0...2)
        var flags = gameLogic.flags
        flags.shuffle()
        firstButton.setImage(UIImage(named: flags[0]), for: .normal)
        secondButton.setImage(UIImage(named: flags[1]), for: .normal)
        thirdtButton.setImage(UIImage(named: flags[2]), for: .normal)
        
        questionLabel.text = "Select flag of: \(flags[correctAnswer])"
    }
    
    // MARK: - Question label
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .white
        label.font = UIFont(name: "Copperplate", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    

    // MARK: - Set up view func
    mutating func setUpView(view: UIView) {
        view.addSubview(stackView)
        
        //Stack constraits
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //Label constraits
        scoreLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 90).isActive = true
        scoreLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -30).isActive = true
        
        // Buttons constraits 640 × 427 pixels
        firstButton.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 150).isActive = true
        firstButton.widthAnchor.constraint(equalToConstant: 220).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: 123).isActive = true
        firstButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        
        secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 50).isActive = true
        secondButton.widthAnchor.constraint(equalToConstant: 220).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: 123).isActive = true
        secondButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        
        thirdtButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 50).isActive = true
        thirdtButton.widthAnchor.constraint(equalToConstant: 220).isActive = true
        thirdtButton.heightAnchor.constraint(equalToConstant: 123).isActive = true
        thirdtButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        
        questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        questionLabel.topAnchor.constraint(equalTo: thirdtButton.bottomAnchor, constant: 70).isActive = true
    }
}
