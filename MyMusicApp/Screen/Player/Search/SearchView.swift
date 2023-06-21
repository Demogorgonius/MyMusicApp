//
//  SearchView.swift
//  MyMusicApp
//
//  Created by Edward on 20.06.2023.
//

import UIKit

final class SearchView {
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "backButtonMain"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var searchTextField: UISearchTextField = {
        let textField = UISearchTextField()
        textField.placeholder = "Search"
        textField.tintColor = .white
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.textColor = .white
        textField.returnKeyType = .search
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.maTextFieldBorder.cgColor
        textField.clearButtonMode = .always
        return textField
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionLayout.scrollDirection = .horizontal
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return collectionView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        return tableView
    }()
}

