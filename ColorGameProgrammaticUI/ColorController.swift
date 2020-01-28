//
//  ViewController.swift
//  ColorGameProgrammaticUI
//
//  Created by Kelby Mittan on 1/28/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class ColorController: UIViewController {

    private let mainView = MainView()

    var randomRed = CGFloat.random(in: 0...1)
    var randomGreen = CGFloat.random(in: 0...1)
    var randomBlue = CGFloat.random(in: 0...1)
    var correctGuess = true
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.backgroundColor = .white
        mainView.colorView.backgroundColor = getRandomColor()
    }

    private func getRandomColor() -> UIColor {
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: CGFloat.random(in: 0.8...1))
    }

}

