//
//  HomeScreenViewController.swift
//  MyMusicApp
//
//  Created by Edward on 20.06.2023.
//

import UIKit
import SnapKit

//MARK: - Screen Sections Enum & TitileHeader String
enum SectionVarieble {
    case section1(model: [HomeScreenViewReusebleModel])
    case section2(model: [HomeScreenViewReusebleModel])
    case section3(model: [HomeScreenViewReusebleModel])
    
    var title : String {
        switch self {
        case .section1:
            return "New Song"
        case .section2:
            return "Popular album"
        case .section3:
            return "Recently Music"
        }
    }
}

class HomeScreenViewController: UIViewController {
    
    private var sections = [SectionVarieble]()
    
    let homeView = HomeScreenView()
    
    var newScreenDelegate: TabBarViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2")
        view.backgroundColor = .maBackground
        configureModels()
        setDelegate()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureViewFrame()
    }
    
    //MARK: - Configure ViewFrame
    private func configureViewFrame() {
        view.addSubview(homeView)
        
        homeView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        homeView.delegate = self
        homeView.collectionView.dataSource = self
        homeView.collectionView.delegate = self
    }
    
    private func configureModels() {
        
        let mainResult = [HomeScreenViewReusebleModel(trackName: "Levels", artistName: "Avici", imageCover: "imageimage"),HomeScreenViewReusebleModel(trackName: "Strobe", artistName: "Deadmau5", imageCover: "image2"),HomeScreenViewReusebleModel(trackName: "Ceremony", artistName: "Skrillex", imageCover: "imageimage3")]
        
        sections.append(.section1(model: mainResult))
        sections.append(.section2(model: mainResult))
        sections.append(.section3(model: mainResult))
        
        homeView.collectionView.reloadData()
    }
}

//MARK: - CollectionView DataSource/Delegate Extensions
extension HomeScreenViewController: UICollectionViewDataSource {
    
}

extension HomeScreenViewController: UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = sections[section]
        switch type {
        case .section1(let viewModels):
            return viewModels.count
        case .section2(let viewModels):
            return viewModels.count
        case .section3(let viewModels):
            return viewModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if newScreenDelegate == nil {
            print("fuck you NIL")
        } else {
            self.newScreenDelegate?.maximizeTopAnchorConstraintFunc()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = sections[indexPath.section]
        switch type {
        case .section1(model: let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:NewSongReusebleViewCell.identifire , for: indexPath) as? NewSongReusebleViewCell else {
                return UICollectionViewCell()
            }
            let indexData = model[indexPath.row]
            cell.configureCells(model: indexData)
            return cell
        case .section2(model: let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:PopularAlbumCollectionViewCell.identifire , for: indexPath) as? PopularAlbumCollectionViewCell else {
                return UICollectionViewCell()
            }
            let indexData = model[indexPath.row]
            cell.configureCells(model: indexData)
            return cell
        case .section3(model: let model):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:RecentlyTrackCollectionViewCell.identifire , for: indexPath) as? RecentlyTrackCollectionViewCell else {
                return UICollectionViewCell()
            }
            let indexData = model[indexPath.row]
            cell.configureCells(model: indexData)
            cell.trackNumberLbl.text = "0\(indexPath.row+1)"
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleHeaderCollectionReusableView.identifire, for: indexPath) as? TitleHeaderCollectionReusableView, kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let headerTitle = sections[indexPath.section].title
        header.configure(with: headerTitle )
        return header
    }
}

extension HomeScreenViewController: HomeScreenViewDelegate {
    
    func homeScreenView(_ view: HomeScreenView, didTapSearchButton button: UIButton) {
        let searVC = SearchViewController()
        //searVC.modalPresentationStyle = .fullScreen
        present(searVC, animated: true)
    }
    
}
