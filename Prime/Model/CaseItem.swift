//
//  File.swift
//  Prime
//
//  Created by Omotayo on 14/05/2022.
//

import Foundation

struct CaseItem: Hashable{
    
    let identifier = UUID()
    let date: Date
    let claimant: String
    let defendant: String
    let caseReferenceId: String
    var isActive: Bool = false
    
}
