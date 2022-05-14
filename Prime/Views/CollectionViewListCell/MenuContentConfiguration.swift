//
//  MenuContentConfiguration.swift
//  Prime
//
//  Created by Omotayo on 13/05/2022.
//

import Foundation
import UIKit

struct MenuContentConfiguration: UIContentConfiguration, Hashable {
    
    var title: String?
    var icon: UIImage?
    var titleColor: UIColor?
    var iconColor: UIColor?
    var backgroundColor: UIColor?
    var fontWeight: UIFont.Weight?
    var iconWeight: UIImage.SymbolWeight?
    
    
    func makeContentView() -> UIView & UIContentView {
        return MenuItemContentView(configuration: self)
    }
    
    func updated(for state: UIConfigurationState) -> Self {
        guard let state = state as? UICellConfigurationState else { return self }
        
        var updatedConfig = self
        if state.isSelected {
            updatedConfig.titleColor = UIColor(named: "ActiveColor")
            updatedConfig.iconColor = UIColor(named: "ActiveColor")
            updatedConfig.backgroundColor = .white
            updatedConfig.fontWeight = .medium
            updatedConfig.iconWeight = .medium
        } else {
            updatedConfig.titleColor = UIColor(named: "InactiveColor")
            updatedConfig.iconColor = UIColor(named: "InactiveColor")
            updatedConfig.backgroundColor = UIColor(named: "AppColor")
            updatedConfig.fontWeight = .regular
            updatedConfig.iconWeight = .regular
        }
        
        return updatedConfig
    }
}
