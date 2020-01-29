//
//  MainView.swift
//  ColorGameProgrammaticUI
//
//  Created by Kelby Mittan on 1/28/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    let colorTitle = "Color Guessing Game"
    
    public lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = colorTitle
        title.font = title.font.withSize(35)
        title.textAlignment = .center
        title.backgroundColor = .systemYellow
        return title
    }()
    
    public lazy var colorView: UIView = {
        let color = UIView()
        color.backgroundColor = .systemYellow
        return color
    }()
    
    public lazy var stackView: UIStackView = {
        let stack = UIStackView()
        return stack
    }()
    
    public lazy var redButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        return button
    }()
    
    public lazy var greenButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        return button
    }()
    
    public lazy var blueButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        setupTitleLabelConstraints()
        setupColorViewConstraints()
        setupStackView()
    }
    
    private func setupTitleLabelConstraints() {
        // add message label to the main view
        addSubview(titleLabel) // returns the message label we created above
        
        // set constraints for the messageLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupColorViewConstraints() {
        addSubview(colorView)
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            
            colorView.widthAnchor.constraint(equalTo: titleLabel.widthAnchor, multiplier: 1),
            
            colorView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4),
            
            colorView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupStackView() {
        addSubview(stackView)
        addSubview(redButton)
        addSubview(greenButton)
        addSubview(blueButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        redButton.translatesAutoresizingMaskIntoConstraints = false
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(redButton)
        stackView.addArrangedSubview(greenButton)
        stackView.addArrangedSubview(blueButton)
        
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 50
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: colorView.widthAnchor, multiplier: 1),
            stackView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
        ])
    }

}
