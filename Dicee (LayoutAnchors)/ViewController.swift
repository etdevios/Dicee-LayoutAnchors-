//
//  ViewController.swift
//  Dicee (LayoutAnchors)
//
//  Created by Eduard Tokarev on 24.01.2023.
//

import UIKit

class ViewController: UIViewController {
    private let backgroundImageView = UIImageView()
    
    private let verticalStackView = UIStackView()
    private let viewForDiceeLogo = UIView()
    private let viewForRollButton = UIView()
    
    private let diceeLogo = UIImageView()
    private let rollButton = UIButton()
    
    private let horizontalStackView = UIStackView()
    private let viewLeading = UIView()
    private let leftDicee = UIImageView()
    private let viewCenter = UIView()
    private let rightDicee = UIImageView()
    private let viewTrailing = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyle()
        applyLayout()
    }
    
    func applyStyle() {
        backgroundImageView.image = UIImage(named: "GreenBackground")
        diceeLogo.image = UIImage(named: "DiceeLogo")
        
        applyStyleButton(rollButton)
        
        leftDicee.image = UIImage(named: "DiceSix")
        rightDicee.image = UIImage(named: "DiceOne")
    }
    
    func applyLayout() {
        arrangeStackView(
            verticalStackView,
            subviews: [
                viewForDiceeLogo,
                viewForRollButton
            ])
        
        viewForDiceeLogo.addSubview(diceeLogo)
        viewForRollButton.addSubview(rollButton)
        
        [diceeLogo, rollButton].forEach() { item in
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        arrangeStackView(
            horizontalStackView,
            subviews: [
                viewLeading,
                leftDicee,
                viewCenter,
                rightDicee,
                viewTrailing
            ],
            axis: .horizontal,
            distribution: .equalCentering
        )
        
        [backgroundImageView, verticalStackView, horizontalStackView].forEach() { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            horizontalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            horizontalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            diceeLogo.centerXAnchor.constraint(equalTo: viewForDiceeLogo.centerXAnchor),
            diceeLogo.centerYAnchor.constraint(equalTo: viewForDiceeLogo.centerYAnchor),
            
            rollButton.centerXAnchor.constraint(equalTo: viewForRollButton.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: viewForRollButton.centerYAnchor),
            rollButton.heightAnchor.constraint(equalToConstant: 60),
            rollButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 125),
            
            leftDicee.heightAnchor.constraint(equalToConstant: 120),
            rightDicee.heightAnchor.constraint(equalToConstant: 120),
            leftDicee.widthAnchor.constraint(equalToConstant: 120),
            rightDicee.widthAnchor.constraint(equalToConstant: 120),
            
            viewLeading.topAnchor.constraint(equalTo: horizontalStackView.topAnchor),
            leftDicee.leadingAnchor.constraint(equalTo: viewLeading.trailingAnchor),
            viewCenter.leadingAnchor.constraint(equalTo: leftDicee.trailingAnchor),
            viewCenter.topAnchor.constraint(equalTo: horizontalStackView.topAnchor),
            rightDicee.leadingAnchor.constraint(equalTo: viewCenter.trailingAnchor),
            viewTrailing.topAnchor.constraint(equalTo: horizontalStackView.topAnchor),
            viewTrailing.leadingAnchor.constraint(equalTo: rightDicee.trailingAnchor),
            viewTrailing.trailingAnchor.constraint(equalTo: horizontalStackView.trailingAnchor)
        ])
    }
    
    func arrangeStackView(
        _ stackView: UIStackView,
        subviews: [UIView],
        spacing: CGFloat = 0,
        axis: NSLayoutConstraint.Axis = .vertical,
        distribution: UIStackView.Distribution = .fillEqually,
        alignment: UIStackView.Alignment = .center
    ){
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.distribution = distribution
        stackView.alignment = alignment
        
        subviews.forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(item)
        }
    }
    
    func applyStyleLabel(
        _ label: UILabel,
        text: String = "I Am Rich",
        font: UIFont? = UIFont(name: "Helvetica Neue", size: 40),
        textColor: UIColor = .white
    ){
        label.text = text
        label.font = font
        label.textColor = textColor
    }
    
    func applyStyleImageView(
        _ imageView: UIImageView,
        image: UIImage? = UIImage(named: "diamond")
    ){
        imageView.image = image
    }
    
    func applyStyleButton(_ button: UIButton) {
        button.setTitle("Roll", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6077903509, green: 0.1078070477, blue: 0.1244759932, alpha: 1)
    }
}

