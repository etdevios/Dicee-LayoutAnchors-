//
//  ViewController.swift
//  Dicee (LayoutAnchors)
//
//  Created by Eduard Tokarev on 24.01.2023.
//

import UIKit

class ViewController: UIViewController {
    private let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
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
        actionButton()
    }
    
    func actionButton() {
        rollButton.addTarget(self, action: #selector(buttonTapped), for: .primaryActionTriggered)
        
    }
    
    @objc private func buttonTapped() {
        leftDicee.image = diceArray.randomElement()
        rightDicee.image = diceArray.randomElement()
    }
    
    func applyStyle() {
        backgroundImageView.image = #imageLiteral(resourceName: "GreenBackground")
        
        verticalStackView.contentMode = .scaleToFill
        print(verticalStackView.contentMode)
        
        diceeLogo.image = #imageLiteral(resourceName: "DiceeLogo")
        applyStyleButton(rollButton)
        
        applyStyleDicee([
            leftDicee,
            rightDicee
        ])
        
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
            distribution: .equalCentering,
            alignment: .center
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
            
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
        alignment: UIStackView.Alignment = .fill
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
    
    func applyStyleDicee(
        _ imageView: [UIImageView],
        image: UIImage? = UIImage(named: "diamond")
    ){
        imageView.forEach { item in
            item.image = diceArray.randomElement()
        }
    }
    
    func applyStyleButton(_ button: UIButton) {
        button.setTitle("Roll", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6077903509, green: 0.1078070477, blue: 0.1244759932, alpha: 1)
    }
}

