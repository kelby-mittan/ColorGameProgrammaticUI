//
//  ViewController.swift
//  ColorGameProgrammaticUI
//
//  Created by Kelby Mittan on 1/28/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

struct AppKey {
    static let appScoreKey = "app score"
}

class ColorController: UIViewController {
    
    private let mainView = MainView()
    private var color = UIColor()
    
    private var randomRed = CGFloat.random(in: 0...1)
    private var randomGreen = CGFloat.random(in: 0...1)
    private var randomBlue = CGFloat.random(in: 0...1)
    private var maxColor = CGFloat()
    private var maxColorString = String()
    private var score = 0
    var highScore = Int()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        color = ranColorGenerator()
        mainView.backgroundColor = .white
        mainView.colorView.backgroundColor = color
        updateUI()
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
    
    private func updateUI() {
        mainView.scoreLabel.text = "Score: \(score.description)"
        if let score = UserDefaults.standard.object(forKey: AppKey.appScoreKey) as? Int {
            mainView.highScoreLabel.text = "High Score: \(score.description)"
        }
        mainView.redButton.addTarget(self, action: #selector(redButtonPressed(_:)), for: .touchUpInside)
        mainView.greenButton.addTarget(self, action: #selector(greenButtonPressed(_:)), for: .touchUpInside)
        mainView.blueButton.addTarget(self, action: #selector(blueButtonPressed(_:)), for: .touchUpInside)
        mainView.resetButton.addTarget(self, action: #selector(resetButtonPressed(_:)), for: .touchUpInside)
    }
    
    private func setHighScore(score: Int) {
        if score >= highScore {
            highScore = score
            UserDefaults.standard.set(highScore, forKey: AppKey.appScoreKey)
        }
        
    }
    
    @objc
    private func redButtonPressed(_ sender: UIButton) {
        if maxColorString == "red" {
            print("correct")
            color = ranColorGenerator()
            mainView.colorView.backgroundColor = color
            score += 10
            mainView.scoreLabel.text = "Score: \(score.description)"
        } else {
            mainView.scoreLabel.text = "Game Over!!! Score: \(score.description)"
            setHighScore(score: score)
            score = 0
            mainView.redButton.isEnabled = false
            mainView.greenButton.isEnabled = false
            mainView.blueButton.isEnabled = false
        }
    }
    
    @objc
    private func greenButtonPressed(_ sender: UIButton) {
        if maxColorString == "green" {
            print("correct")
            color = ranColorGenerator()
            mainView.colorView.backgroundColor = color
            score += 10
            mainView.scoreLabel.text = "Score: \(score.description)"
        } else {
            setHighScore(score: score)
            mainView.scoreLabel.text = "Game Over!!! Score: \(score.description)"
            score = 0
            mainView.redButton.isEnabled = false
            mainView.greenButton.isEnabled = false
            mainView.blueButton.isEnabled = false
        }
    }
    
    @objc
    private func blueButtonPressed(_ sender: UIButton) {
        if maxColorString == "blue" {
            print("correct")
            color = ranColorGenerator()
            mainView.colorView.backgroundColor = color
            score += 10
            mainView.scoreLabel.text = "Score: \(score.description)"
        } else {
            mainView.scoreLabel.text = "Game Over!!! Score: \(score.description)"
            setHighScore(score: score)
            score = 0
            mainView.redButton.isEnabled = false
            mainView.greenButton.isEnabled = false
            mainView.blueButton.isEnabled = false
        }
    }
    
    @objc
    private func resetButtonPressed(_ sender: UIButton) {
        color = ranColorGenerator()
        if let score = UserDefaults.standard.object(forKey: AppKey.appScoreKey) as? Int {
            mainView.highScoreLabel.text = "High Score: \(score.description)"
        }
        mainView.colorView.backgroundColor = color
        mainView.scoreLabel.text = "Score: \(score.description)"
        mainView.redButton.isEnabled = true
        mainView.greenButton.isEnabled = true
        mainView.blueButton.isEnabled = true
    }
    
    
}

