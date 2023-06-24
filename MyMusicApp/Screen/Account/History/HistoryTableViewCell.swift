//
//  HistoryTableViewCell.swift
//  MyMusicApp
//
//  Created by Иван Станкин on 24.06.2023.
//

import UIKit
import SnapKit

class HistoryTableViewCell: UITableViewCell {
    
    lazy var coverImage: UIImageView = {
        let image = UIImageView()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 3
        return image
    }()
    
    lazy var songLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 8, weight: .regular)
        label.textAlignment = .right
        return label
    }()
    
    lazy var viewBG: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    func configureCell(image: UIImage?, firstText: String?, secondText: String?, time: String?) {
        coverImage.image = image
        songLabel.text = firstText
        artistLabel.text = secondText
        timeLabel.text = "\(time!) pm"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(viewBG)
        addSubview(coverImage)
        addSubview(songLabel)
        addSubview(artistLabel)
        addSubview(timeLabel)
    }
    
    private func setupConstraints() {
        
        viewBG.snp.makeConstraints { make in
            make.height.equalToSuperview().offset(-10)
            make.width.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
       
        coverImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(24)
            make.height.width.equalTo(40)
        }
        
        songLabel.snp.makeConstraints { make in
            make.leading.equalTo(coverImage.snp.trailing).offset(16)
            make.top.equalTo(coverImage.snp.top)
        }
        
        artistLabel.snp.makeConstraints { make in
            make.leading.equalTo(coverImage.snp.trailing).offset(16)
            make.bottom.equalTo(coverImage.snp.bottom)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(coverImage.snp.bottom)
            make.trailing.equalToSuperview().offset(-20)
        }
        
    }
    
}
