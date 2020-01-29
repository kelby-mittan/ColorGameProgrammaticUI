//
//  ViewController.swift
//  ColorGameProgrammaticUI
//
//  Created by Kelby Mittan on 1/28/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

enum RGB {
    case red
    case green
    case blue
}

class ColorController: UIViewController {
    
    private let mainView = MainView()
    private var color = UIColor()
    
    private var randomRed = CGFloat.random(in: 0...1)
    private var randomGreen = CGFloat.random(in: 0...1)
    private var randomBlue = CGFloat.random(in: 0...1)
    private var maxColor = CGFloat()
    private var maxColorString = String()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        color = ranColorGenerator()
        mainView.backgroundColor = .white
        mainView.colorView.backgroundColor = color
        
        mainView.redButton.addTarget(self, action: #selector(redButtonPressed(_:)), for: .touchUpInside)
        mainView.greenButton.addTarget(self, action: #selector(greenButtonPressed(_:)), for: .touchUpInside)
        mainView.blueButton.addTarget(self, action: #selector(blueButtonPressed(_:)), for: .touchUpInside)
    }
    
    private func ranColorGenerator() -> UIColor {
        randomRed = CGFloat.random(in: 0...1)
        randomGreen = CGFloat.random(in: 0...1)
        randomBlue = CGFloat.random(in: 0...1)
        let colorArr = [randomRed, randomGreen, randomBlue]
        maxColor = colorArr.max() ?? 0
        
        if maxColor == randomRed {
            maxColorString = "red"
        } else if maxColor == randomGreen {
            maxColorString = "green"
        } else {
            maxColorString = "blue"
        }
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: CGFloat.random(in: 0.5...1))
    }
    
    @objc
    private func redButtonPressed(_ sender: UIButton) {
        if maxColorString == "red" {
            print("correct")
            color = ranColorGenerator()
            mainView.colorView.backgroundColor = color
        } else {
            print("wrong")
        }
    }
    
    @objc
    private func greenButtonPressed(_ sender: UIButton) {
        if maxColorString == "green" {
            print("correct")
            color = ranColorGenerator()
            mainView.colorView.backgroundColor = color
        } else {
            print("wrong")
        }
//        checkColor()
    }

    @objc
    private func blueButtonPressed(_ sender: UIButton) {
        if maxColorString == "blue" {
            print("correct")
            color = ranColorGenerator()
            mainView.colorView.backgroundColor = color
        } else {
            print("wrong")
        }
//        checkColor()
    }
    
    
}

