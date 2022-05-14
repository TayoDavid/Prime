//
//  FolderCollectionViewCell.swift
//  Prime
//
//  Created by Omotayo on 14/05/2022.
//

import UIKit

class FolderCollectionViewCell: UICollectionViewCell {
    
    var caseItem: CaseItem?
    
    private var folderView: FolderView = {
        let view = FolderView()
        return view
    }()
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.alignment = .fill
        return view
    }()
    
    private var deliveryDate: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private var parties: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private var referenceId: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews(folderView, stackView, logoImageView)
        bringSubviewToFront(logoImageView)
        
        stackView.addArrangedSubviews(deliveryDate, parties, referenceId)
    
        folderView.frame = CGRect(
            x: 10,
            y: 10,
            width: contentView.width - 20,
            height: contentView.height - 20
        )
        stackView.frame = CGRect(
            x: folderView.left + 24,
            y: folderView.top + 36,
            width: folderView.width - 40,
            height: folderView.height - 64
        )
        logoImageView.frame = CGRect(
            x: stackView.right - 48,
            y: folderView.top + 40,
            width: 36,
            height: 36
        )
        
        guard let caseItem = caseItem else { return }
        if caseItem.isActive {
            folderView.color = Constants.selectedFolderColor.cgColor
            deliveryDate.textColor = .white
            parties.textColor = .white
            referenceId.textColor = .white
        }
    }
    
    func updateCell() {
        guard let caseItem = caseItem else {
            print("Something went wrong!")
            return
        }
        
        let defendantTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .bold)]
        let defendantString = NSAttributedString(string: caseItem.defendant, attributes: defendantTextAttributes)
        
        let claimantTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .medium)]
        let claimantString = NSAttributedString(string: "\(caseItem.claimant) v. ", attributes: claimantTextAttributes)
        
        let partiesString = NSMutableAttributedString(attributedString: claimantString)
        partiesString.append(defendantString)
        
        self.parties.attributedText = partiesString
        
        deliveryDate.text = "Delivered on \(caseItem.date.formattedDate())"
        referenceId.text = caseItem.caseReferenceId
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        folderView.frame = CGRect(
            x: 10,
            y: 10,
            width: contentView.width - 20,
            height: contentView.height - 20
        )
    }
}
