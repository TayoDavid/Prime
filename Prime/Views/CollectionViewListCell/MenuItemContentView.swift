//
//  MenuItemContentView.swift
//  Prime
//
//  Created by Omotayo on 13/05/2022.
//

import UIKit

class MenuItemContentView: UIView, UIContentView {
    
    private var currentConfiguration: MenuContentConfiguration!
    
    var configuration: UIContentConfiguration {
        get {
            currentConfiguration
        }
        set {
            guard let newConfig = newValue as? MenuContentConfiguration else { return }
            apply(configuration: newConfig)
        }
    }
    
    let titleLabel = UILabel()
    let iconImageView = UIImageView()
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    init(configuration: MenuContentConfiguration) {
        super.init(frame: .zero)
        setupAllViews()
        apply(configuration: configuration)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func apply(configuration: MenuContentConfiguration) {
        guard currentConfiguration != configuration else { return }
        currentConfiguration = configuration
        
        titleLabel.text = configuration.title
        titleLabel.textColor = configuration.titleColor
        
        if let fontWeight = configuration.fontWeight {
            titleLabel.font = UIFont.systemFont(ofSize: titleLabel.font.pointSize, weight: fontWeight)
        }
        
        if let iconColor = configuration.iconColor,
           let iconWeight = configuration.iconWeight {
            let iconConfig = UIImage.SymbolConfiguration(weight: iconWeight)
            var icon = configuration.icon?.withConfiguration(iconConfig)
            icon = icon?.withTintColor(iconColor, renderingMode: .alwaysOriginal)
            iconImageView.image = icon
        }
    }
    
    private func setupAllViews() {
        addSubview(stackView)
        
        let stackViewConstraint = [
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 56)
        ]
        
        let iconConstraint = [
            iconImageView.widthAnchor.constraint(equalToConstant: 36),
            iconImageView.heightAnchor.constraint(equalToConstant: 36)
        ]
        
        NSLayoutConstraint.activate(iconConstraint + stackViewConstraint)
        
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(titleLabel)
    }
}
