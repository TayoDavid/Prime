//
//  DetailViewController.swift
//  Prime
//
//  Created by Omotayo on 13/05/2022.
//

import UIKit
//import

class DetailViewController: UIViewController {
    
    enum CaseSection: Int, CaseIterable {
        case main
        
        func columnCount(for width: CGFloat) -> Int {
            let widthMode = width > 1200
            return widthMode ? 5 : 4
        }
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<CaseSection, CaseItem>!
    private var cases = [CaseItem]()
    
    let navigationBarView: UINavigationBar = {
        let navBar = UINavigationBar(frame: .zero)
        navBar.backgroundColor = UIColor(named: "AppColor")!
        return navBar
    }()
    
    var foldersCollectionView: UICollectionView!
    
    // MARK: - NAVIGATION VIEWS
    
    let searchContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white.withAlphaComponent(0.16)
        return view
    }()
    
    let searchStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 12
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = true
        return view
    }()
    
    let searchIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "magnifyingglass")
        view.tintColor = .white
        return view
    }()

    let searchField: UITextField = {
        let field = UITextField()
        field.borderStyle = .none
        field.placeholder = "Search cases and files"
        field.attributedPlaceholder = NSAttributedString(string: "Search cases and files",
                                         attributes: [NSAttributedString.Key.foregroundColor: Constants.appColor])
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.buttonColor
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let historyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Constants.selectedFolderColor
        button.setTitle("History", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle")
        imageView.tintColor = .white
        return imageView
    }()
    
    
    // MARK: - CASE DETAIL VIEWS
    
    let caseContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.isHidden = true
        return view
    }()
    
    let caseStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.spacing = 24
        return view
    }()
    
    let caseHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.appColor
        return view
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "ESSSEN & NOR V. MOHAMMED (2005, CA)"
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("CLOSE", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let caseContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let principalLabel: UILabel = {
        let label = UILabel()
        label.text = "Principal"
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let refContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.refBGColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let refLabel: UILabel = {
        let label = UILabel()
        label.text = "(2020) LPELR-50514(CA)"
        label.textColor = Constants.refColor
        label.font = UIFont.systemFont(ofSize: 17)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let caseDetailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = """
        APPEAL - FORMULATION OF ISSUE(S) FOR DETERMINATION - Whether Court can suo motu formulate/re-formulate issue(s) arising from ground(s) of appeal for determination of an appeal
        "In Chabasaya vs. Anwasi (2010) 10 NWLR (1201) 163 it was held by the Supreme Court that: - "... The law permits an appellate Court to ignore some or all issues in the briefs of argument and formulate its own issues, the way it deems them to be material once they are distilled from the grounds of appeal." In the earlier case of Sha vs. Kwan (2000) 8 NWLR (670) 685 @ 700, the apex Court had stated that:- "The Court of Appeal is at liberty and possess the jurisdiction to modify or reject all or any of the issues formulated by the parties and frame its own issues or, to reframe the issues by the parties if, in its views, such issues will not lead to proper determination of the appeal." "The Court of Appeal is at liberty and possess such issues will not lead to proper determination of the appeal."See also Onochie vs. Odogwu (2006) 6 NWLR (975) 65, Governor Ekiti State vs. Olubunmo (2017) 3 NWLR (1551) 1 @ 23." Per GARBA ,J.C.A ( Pp. 4-5, paras. F-D ).
        """
        return label
    }()
    
    let buttonsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buttonStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewSummaryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View Summary", for: .normal)
        button.setTitleColor(Constants.appColor, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = Constants.inactiveColor.cgColor
        return button
    }()
    
    let readJudgementButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Read Full Judgement", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Constants.selectedFolderColor
        return button
    }()
    
    let bellContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.selectedFolderColor
        return view
    }()
    
    let bellImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "bell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let notifLabelContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let notifLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = Constants.selectedFolderColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - METHODS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarView.delegate = self
        populateCases()
        configureCollectionView()
        configureDataSource()
        
        closeButton.addTarget(self, action: #selector(closeCaseDetail), for: .touchUpInside)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.backgroundColor = .systemBackground
        view.addSubview(navigationBarView)
        
        navigationBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navigationBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBarView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationBarView.heightAnchor.constraint(equalToConstant: 74),
        ])
        
        configureNavItems()
        configureCaseInfoView()
        configureBell()
    }
    
    @objc func closeCaseDetail() {
        self.bellContainer.isHidden = false
        self.caseContainerView.isHidden = true
    }
    
}

extension DetailViewController {
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let numberOfColumn = CaseSection.main.columnCount(for: layoutEnvironment.container.effectiveContentSize.width)
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.24), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: numberOfColumn)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10
            return section
        }
        return layout
    }
    
    private func configureCollectionView() {
        foldersCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        foldersCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(foldersCollectionView)
        foldersCollectionView.delegate = self
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<FolderCollectionViewCell, CaseItem> {
            cell, indexPath, item in
            cell.caseItem = item
            cell.updateCell()
        }
        
        dataSource = UICollectionViewDiffableDataSource<CaseSection, CaseItem>(collectionView: foldersCollectionView) {
            collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<CaseSection, CaseItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cases)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func populateCases() {
        let someCases = [
            CaseItem(date: Date.now, claimant: "Mailantarki", defendant: "Tongo", caseReferenceId: "(2019) LPELR - 42466 (SC)", isActive: true),
            CaseItem(date: Date.now, claimant: "Mailantarki", defendant: "Tongo", caseReferenceId: "(2019) LPELR - 42466 (SC)"),
            CaseItem(date: Date.now, claimant: "Mailantarki", defendant: "Tongo", caseReferenceId: "(2019) LPELR - 42466 (SC)"),
            CaseItem(date: Date.now, claimant: "Mailantarki", defendant: "Tongo", caseReferenceId: "(2019) LPELR - 42466 (SC)"),
            CaseItem(date: Date.now, claimant: "Mailantarki", defendant: "Tongo", caseReferenceId: "(2019) LPELR - 42466 (SC)"),
            CaseItem(date: Date.now, claimant: "Mailantarki", defendant: "Tongo", caseReferenceId: "(2019) LPELR - 42466 (SC)"),
            CaseItem(date: Date.now, claimant: "Mailantarki", defendant: "Tongo", caseReferenceId: "(2019) LPELR - 42466 (SC)"),
            CaseItem(date: Date.now, claimant: "Mailantarki", defendant: "Tongo", caseReferenceId: "(2019) LPELR - 42466 (SC)"),
            CaseItem(date: Date.now, claimant: "Mailantarki", defendant: "Tongo", caseReferenceId: "(2019) LPELR - 42466 (SC)"),
        ]
        
        cases.append(contentsOf: someCases)
    }
}

extension DetailViewController: UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        UIBarPosition.topAttached
    }
}

extension DetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.caseContainerView.isHidden = false
        self.bellContainer.isHidden = true
    }
}
