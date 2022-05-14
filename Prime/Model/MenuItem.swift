//
//  MenuItem.swift
//  Prime
//
//  Created by Omotayo on 13/05/2022.
//

import Foundation
import UIKit

struct MenuItem: Hashable {
    
    let identifier = UUID()
    let icon: UIImage
    let title: String
    let handle: () -> Void
    
    static func == (lhs: MenuItem, rhs: MenuItem) -> Bool {
        lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
