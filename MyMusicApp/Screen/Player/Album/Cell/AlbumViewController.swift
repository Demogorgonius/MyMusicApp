//
//  AlbumViewController.swift
//  MyMusicApp
//
//  Created by Edward on 17.06.2023.
//

import UIKit
import CoreGraphics

class AlbumViewController: UIViewController {
    
    private let albumView = AlbumView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableViews()
        setupHierarchy()
        setConstrains()
    }
    
    func setupHierarchy() {
        view.backgroundColor = .maBackground
        view.addSubview(albumView.albumImage)
        view.addSubview(albumView.vStack)
        albumView.vStack.addArrangedSubview(albumView.songLabel)
        albumView.vStack.addArrangedSubview(albumView.artistLabel)
        view.addSubview(albumView.songText)
       // view.addSubview(albumView.showMoreButton)
        view.addSubview(albumView.separateImage)
        view.addSubview(albumView.suggestionLabel)
        view.addSubview(albumView.tableView)
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            
            albumView.albumImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            albumView.albumImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            albumView.albumImage.heightAnchor.constraint(equalToConstant: 250),
            albumView.albumImage.widthAnchor.constraint(equalToConstant: 250),
//            albumView.albumImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
//            albumView.albumImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
//            albumView.albumImage.heightAnchor.constraint(equalTo: albumView.albumImage.widthAnchor),
            
            albumView.vStack.topAnchor.constraint(equalTo: albumView.albumImage.bottomAnchor, constant: 20),
            albumView.vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            albumView.songText.topAnchor.constraint(equalTo: albumView.vStack.bottomAnchor, constant: 20),
            albumView.songText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            albumView.songText.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 48),

           // albumView.showMoreButton.topAnchor.constraint(equalTo: albumView.songText.bottomAnchor, constant: 20),
           // albumView.showMoreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),

            albumView.separateImage.topAnchor.constraint(equalTo: albumView.songText.bottomAnchor, constant: 14),
            albumView.separateImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            albumView.separateImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            albumView.suggestionLabel.topAnchor.constraint(equalTo: albumView.separateImage.bottomAnchor, constant: 14),
            albumView.suggestionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),

            albumView.tableView.topAnchor.constraint(equalTo: albumView.suggestionLabel.bottomAnchor, constant: 14),
            albumView.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            albumView.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            albumView.tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupTableViews() {
        albumView.tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "AlbumTableViewCell")
        albumView.tableView.dataSource = self
        albumView.tableView.delegate = self
    }
    
    func configTextFieldButton() {
        albumView.showMoreButton.setTitle("Show more", for: .normal)
        albumView.showMoreButton.setTitle("Show less", for: .selected)
        albumView.showMoreButton.addTarget(self, action: #selector(showMoreButtonTapped), for: .touchUpInside)
    }
    
    @objc func showMoreButtonTapped(_ sender: UIButton) {
           sender.isSelected = !sender.isSelected

//           if sender.isSelected {
//               albumView.songText.textContainer.maximumNumberOfLines = 0 // Показать все строки текста
//           } else {
//               albumView.songText.textContainer.maximumNumberOfLines = 3 // Вернуться к начальному количеству строк
//           }
      }
    
    func resizeImage(image: UIImage, scaleFactor: CGFloat) -> UIImage? {
        let size = image.size
        let scaledSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)
        
        UIGraphicsBeginImageContextWithOptions(scaledSize, false, 0.0)
        image.draw(in: CGRect(origin: CGPoint.zero, size: scaledSize))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
}

extension AlbumViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func formatNumber(_ number: Int) -> String {
        if number < 10 {
            return String(format: "0%d", number)
        } else {
            return String(number)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = albumView.tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell", for: indexPath) as? AlbumTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(numberText: String(formatNumber(indexPath.row + 1)), image: UIImage(named: "firstOnboarding") ?? nil, firstText: "Madonna", secondText: "Андрей Малахов")
       // cell.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 21
    }
}

extension AlbumViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
