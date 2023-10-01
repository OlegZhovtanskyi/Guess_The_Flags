//
//  FlagsView.swift
//  Guess The Flags - UIKit version
//
//  Created by Oleg Zhovtanskyi on 24/09/2023.
//

import UIKit

struct FlagsView {
    var correctAnswer: Int?
    // MARK: - Vertical Stack
    var stackView = StackView()
    
    // MARK: - Labels
    var scoreLabel = Label(textAlignment: .right, textColor: .black, font: UIFont(name: "Copperplate", size: 20)!, text: nil)
    var questionLabel = Label(textAlignment: .center, textColor: .white, font: UIFont(name: "Copperplate", size: 25)!, text: nil)
    
    // MARK: - Buttons
    var firstButton = Buttons(tag: 0)
    var secondButton = Buttons(tag: 1)
    var thirdtButton = Buttons(tag: 2)
    
    mutating func setUpImageForButton() {
        let correct = Int.random(in: 0...2)
        correctAnswer = correct
        var flags = Data.shared.flags
        flags.shuffle()
        firstButton.btn.setImage(UIImage(named: flags[0]), for: .normal)
        secondButton.btn.setImage(UIImage(named: flags[1]), for: .normal)
        thirdtButton.btn.setImage(UIImage(named: flags[2]), for: .normal)
        
        questionLabel.label.text = "Select flag of: \(flags[correct])"
        scoreLabel.label.text = "Your score: \(Data.shared.userScore)"
    }
    
    
    // MARK: - Set up view func
    mutating func setUpView(view: UIView) {
        view.addSubview(stackView.stack)
        stackView.setUpStack(views: [scoreLabel.label, questionLabel.label, firstButton.btn, secondButton.btn, thirdtButton.btn])
        stackView.setUpConstraits(view)
        
        //Labels constraits
        NSLayoutConstraint.activate([
            scoreLabel.label.topAnchor.constraint(equalTo: stackView.stack.topAnchor, constant: 90),
            scoreLabel.label.trailingAnchor.constraint(equalTo: stackView.stack.trailingAnchor, constant: -30)])
        NSLayoutConstraint.activate([
            questionLabel.label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.label.topAnchor.constraint(equalTo: thirdtButton.btn.bottomAnchor, constant: 70)])
        
        // Buttons constraits
        NSLayoutConstraint.activate([
            firstButton.btn.topAnchor.constraint(equalTo: stackView.stack.topAnchor, constant: 150),
            firstButton.btn.widthAnchor.constraint(equalToConstant: 220),
            firstButton.btn.heightAnchor.constraint(equalToConstant: 123),
            firstButton.btn.centerXAnchor.constraint(equalTo: stackView.stack.centerXAnchor)])
        
        NSLayoutConstraint.activate([
            secondButton.btn.topAnchor.constraint(equalTo: firstButton.btn.bottomAnchor, constant: 50),
            secondButton.btn.widthAnchor.constraint(equalToConstant: 220),
            secondButton.btn.heightAnchor.constraint(equalToConstant: 123),
            secondButton.btn.centerXAnchor.constraint(equalTo: stackView.stack.centerXAnchor)])

        NSLayoutConstraint.activate([
            thirdtButton.btn.topAnchor.constraint(equalTo: secondButton.btn.bottomAnchor, constant: 50),
            thirdtButton.btn.widthAnchor.constraint(equalToConstant: 220),
            thirdtButton.btn.heightAnchor.constraint(equalToConstant: 123),
            thirdtButton.btn.centerXAnchor.constraint(equalTo: stackView.stack.centerXAnchor)])
    }
}
