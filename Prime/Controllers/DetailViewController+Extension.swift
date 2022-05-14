//
//  DetailViewController+Extension.swift
//  Prime
//
//  Created by Omotayo on 14/05/2022.
//

import Foundation
import UIKit

extension DetailViewController {
    func configureNavItems() {
        navigationBarView.addSubviews(searchContainer, historyButton, avatarImageView)
        
        searchContainer.addSubviews(searchStackView)
        searchStackView.addArrangedSubviews(searchIcon, searchField, searchButton)
        navigationBarView.bringSubviewToFront(searchContainer)
        
        searchContainer.frame = CGRect(x: 56, y: 20, width: 400, height: 44)
        historyButton.frame = CGRect(x: searchContainer.right + 20, y: 20, width: 100, height: 44)
        avatarImageView.frame = CGRect(x: navigationBarView.width - 80, y: 20, width: 44, height: 44)
        
        searchStackView.frame = CGRect(x: 12, y: 4, width: searchContainer.width - 24, height: 36)
        
        searchContainer.layer.roundCorners(corners: .allCorners, radius: 6)
        searchButton.layer.roundCorners(corners: .allCorners, radius: 6)
        historyButton.layer.roundCorners(corners: .allCorners, radius: 6)
        
        let searchIconConstraint = [
            searchIcon.widthAnchor.constraint(equalToConstant: 24),
            searchIcon.heightAnchor.constraint(equalToConstant: 24),
            searchIcon.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor)
        ]
        let searchFieldConstraint = [
            searchField.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor),
        ]
        let searchButtonConstraint = [
            searchButton.widthAnchor.constraint(equalToConstant: 80)
        ]
        
        let constraints = searchIconConstraint + searchFieldConstraint + searchButtonConstraint

        NSLayoutConstraint.activate(constraints)
    }
    
    func configureCaseInfoView() {
        view.addSubview(caseContainerView)
        caseContainerView.addSubview(caseStackView)

        caseStackView.addArrangedSubviews(caseHeaderView, scrollView, buttonsContainerView)

        caseHeaderView.addSubviews(headerLabel, closeButton)
        
        scrollView.addSubview(caseContentView)
        caseContentView.addSubviews(principalLabel, refContainerView, caseDetailLabel)
        refContainerView.addSubview(refLabel)

        buttonsContainerView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubviews(viewSummaryButton, readJudgementButton)

        caseContainerView.layer.shadowOffset = CGSize(width: -4, height: -4)
        caseContainerView.layer.shadowRadius = 5
        caseContainerView.layer.shadowOpacity = 0.3
        
        caseContainerView.frame = CGRect(x: view.width - 480, y: 74, width: 480, height: view.height - 74)
        caseStackView.frame = caseContainerView.bounds
        
        closeButton.layer.roundCorners(corners: .allCorners, radius: 6)
        viewSummaryButton.layer.roundCorners(corners: .allCorners, radius: 6)
        readJudgementButton.layer.roundCorners(corners: .allCorners, radius: 6)
        refContainerView.layer.roundCorners(corners: .allCorners, radius: 6)
        
        NSLayoutConstraint.activate([
            caseHeaderView.heightAnchor.constraint(equalToConstant: 100),
            headerLabel.leadingAnchor.constraint(equalTo: caseHeaderView.leadingAnchor, constant: 24),
            headerLabel.centerYAnchor.constraint(equalTo: caseHeaderView.centerYAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -32),
            
            closeButton.trailingAnchor.constraint(equalTo: caseHeaderView.trailingAnchor, constant: -24),
            closeButton.widthAnchor.constraint(equalToConstant: 80),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.centerYAnchor.constraint(equalTo: caseHeaderView.centerYAnchor),
            
            buttonsContainerView.heightAnchor.constraint(equalToConstant: 100),
            buttonsContainerView.leadingAnchor.constraint(equalTo: caseStackView.leadingAnchor),
            buttonsContainerView.trailingAnchor.constraint(equalTo: caseStackView.trailingAnchor),
            
            buttonStackView.leadingAnchor.constraint(equalTo: buttonsContainerView.leadingAnchor, constant: 24),
            buttonStackView.heightAnchor.constraint(equalToConstant: 56),
            buttonStackView.topAnchor.constraint(equalTo: buttonsContainerView.topAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: buttonsContainerView.trailingAnchor, constant: -24),

            viewSummaryButton.heightAnchor.constraint(equalToConstant: 56),
            readJudgementButton.widthAnchor.constraint(equalTo: viewSummaryButton.widthAnchor),
            
            caseContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            caseContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            caseContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            caseContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            principalLabel.topAnchor.constraint(equalTo: caseContentView.topAnchor, constant: 24),
            principalLabel.leadingAnchor.constraint(equalTo: caseContentView.leadingAnchor, constant: 24),
            
            refContainerView.topAnchor.constraint(equalTo: principalLabel.bottomAnchor, constant: 24),
            refContainerView.leadingAnchor.constraint(equalTo: principalLabel.leadingAnchor),
            
            refLabel.leadingAnchor.constraint(equalTo: refContainerView.leadingAnchor, constant: 24),
            refLabel.trailingAnchor.constraint(equalTo: refContainerView.trailingAnchor, constant: -24),
            refLabel.topAnchor.constraint(equalTo: refContainerView.topAnchor, constant: 12),
            refLabel.bottomAnchor.constraint(equalTo: refContainerView.bottomAnchor, constant: -12),

            caseDetailLabel.topAnchor.constraint(equalTo: refContainerView.bottomAnchor, constant: 24),
            caseDetailLabel.leadingAnchor.constraint(equalTo: principalLabel.leadingAnchor),
            caseDetailLabel.trailingAnchor.constraint(equalTo: caseContainerView.trailingAnchor, constant: -24)
        ])
    }
    
    func configureBell() {
        view.addSubview(bellContainer)
        bellContainer.addSubviews(bellImageView, notifLabelContainer)
        notifLabelContainer.addSubview(notifLabel)
        
        bellContainer.frame = CGRect(x: view.right - 100, y: view.bottom - 100, width: 64, height: 64)
        bellContainer.layer.cornerRadius = 28
        notifLabelContainer.layer.cornerRadius = 12
        
        bellContainer.layer.shadowOffset = CGSize(width: 2, height: 4)
        bellContainer.layer.shadowRadius = 5
        bellContainer.layer.shadowOpacity = 0.3
        
        NSLayoutConstraint.activate([
            bellImageView.widthAnchor.constraint(equalToConstant: 32),
            bellImageView.heightAnchor.constraint(equalToConstant: 32),
            bellImageView.centerYAnchor.constraint(equalTo: bellContainer.centerYAnchor),
            bellImageView.centerXAnchor.constraint(equalTo: bellContainer.centerXAnchor),
            
            notifLabelContainer.leadingAnchor.constraint(equalTo: bellContainer.leadingAnchor, constant: -6),
            notifLabelContainer.topAnchor.constraint(equalTo: bellContainer.topAnchor, constant: -6),
            notifLabelContainer.widthAnchor.constraint(equalToConstant: 24),
            notifLabelContainer.heightAnchor.constraint(equalToConstant: 24),
            
            notifLabel.centerXAnchor.constraint(equalTo: notifLabelContainer.centerXAnchor),
            notifLabel.centerYAnchor.constraint(equalTo: notifLabelContainer.centerYAnchor)
        ])
    }
}
