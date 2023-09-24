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
    }


}

