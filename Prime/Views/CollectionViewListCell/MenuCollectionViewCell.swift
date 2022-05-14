//
//  MenuCollectionViewCell.swift
//  Prime
//
//  Created by Omotayo on 14/05/2022.
//

import UIKit



class MenuCollectionViewCell: UICollectionViewListCell {
    
    var item: MenuItem?
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var newConfig = MenuContentConfiguration().updated(for: state)
        
        newConfig.title = item?.title
        newConfig.icon = item?.icon
        
        var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
        backgroundConfig.backgroundColor = UIColor(named: "AppColor")

        var focusedBGConfig = UIBackgroundConfiguration.listPlainCell()
        focusedBGConfig.backgroundColor  = .white
        
        if isSelected {
            backgroundConfiguration = focusedBGConfig
        } else {
            backgroundConfiguration = backgroundConfig
        }
        
        contentConfiguration = newConfig
    }
}
