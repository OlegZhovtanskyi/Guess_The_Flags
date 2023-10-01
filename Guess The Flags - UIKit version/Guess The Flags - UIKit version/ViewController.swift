//
//  ViewController.swift
//  Guess The Flags - UIKit version
//
//  Created by Oleg Zhovtanskyi on 24/09/2023.
//

import UIKit

final class ViewController: UIViewController {
    private var flagsView = FlagsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flagsView.setUpView(view: view)
        flagsView.setUpImageForButton()
    }
    
    override func loadView() {
        super.loadView()
        [flagsView.firstButton.btn,
         flagsView.secondButton.btn,
         flagsView.thirdtButton.btn].forEach {$0.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)}
    }
    
    @objc func buttonTapped(sender: UIButton) {
        if sender.tag == flagsView.correctAnswer {
            Data.shared.userScore += 1
            if Data.shared.userScore == 10 {
                showAlert(title: "Good job, you've already got 10 points.",
                          message: "Do you want to start the game again?",
                          actionTitle: "Yes")
                Data.shared.userScore = 0
                flagsView.setUpImageForButton()
            }
            flagsView.setUpImageForButton()
        } else {
            showAlert(title: "Wrong",
                      message: "Try again",
                      actionTitle: "Ok")
        }
    }
    
    private func showAlert(title: String, message: String, actionTitle: String){
        let vc = UIAlertController(title: title, message: message, preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: actionTitle, style: .cancel))
        present(vc, animated: true)
    }
}
