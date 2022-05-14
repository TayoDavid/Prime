//
//  SidebarViewController.swift
//  Prime
//
//  Created by Omotayo on 13/05/2022.
//

import UIKit

enum Section: Hashable {
    case main
}

class SidebarViewController: UIViewController {

    private var menuCollectionView:UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, MenuItem>!
    
    private var options = [MenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PRIME"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "SecondColor")!
        ]
        configureCollectionView()
        configureDataSource()
    }
    
    private func configureCollectionView() {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.backgroundColor = UIColor(named: "AppColor")
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        menuCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        view.addSubview(menuCollectionView)
        menuCollectionView.delegate = self
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<MenuCollectionViewCell, MenuItem> {
            cell, indexPath, item in
            
            cell.item = item
            
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, MenuItem>(collectionView: menuCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        prepareMenuItems()
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, MenuItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(options, toSection: .main)
        
        dataSource.apply(snapshot)
        
    }
    
    private func prepareMenuItems() {
        let menuOptions = [
            MenuItem(icon: UIImage(systemName: "square.grid.2x2")!, title: "Dashboard", handle: {
                print("Go to dashboard")
            }),
            MenuItem(icon: UIImage(systemName: "plus.square.fill")!, title: "Latest Judgments", handle: {
                print("Now to Latest Judgements")
            }),
            MenuItem(icon: UIImage(systemName: "bag")!, title: "Law Reports", handle: {
                
            }),
            MenuItem(icon: UIImage(systemName: "book")!, title: "Laws of Nigeria", handle: {
                
            }),
            MenuItem(icon: UIImage(systemName: "lineweight")!, title: "Civil Procedure Rules", handle: {
                
            }),
            MenuItem(icon: UIImage(systemName: "tray")!, title: "Index & Digest", handle: {
                
            }),
            MenuItem(icon: UIImage(systemName: "square.and.pencil")!, title: "Textbooks & Journals", handle: {
                
            }),
            MenuItem(icon: UIImage(systemName: "folder")!, title: "My Research Folder", handle: {
                
            }),
            MenuItem(icon: UIImage(systemName: "heart.text.square")!, title: "Words in Gold", handle: {
                
            }),
            MenuItem(icon: UIImage(systemName: "plus.app")!, title: "New Contents", handle: {
                
            }),
        ]
        
        options.append(contentsOf: menuOptions)
    }
}

extension SidebarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = dataSource.itemIdentifier(for: indexPath)
        item?.handle()
    }
}
