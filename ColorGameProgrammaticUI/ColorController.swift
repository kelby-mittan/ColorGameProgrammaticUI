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
    
    private let gameModel = ColorGuessingModel()

    private var color = UIColor()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let color = gameModel.getNewColor()
        mainView.backgroundColor = .white
        mainView.colorView.backgroundColor = color
        
        mainView.redButton.addTarget(self, action: #selector(redButtonPressed(_:)), for: .touchUpInside)
    }
    
    @objc
    private func redButtonPressed(_ sender: UIButton) {
        gameModel.isDominant(guess: <#T##UIColor#>)
    }


}

