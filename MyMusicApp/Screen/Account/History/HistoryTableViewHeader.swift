//
//  HistoryTableViewHeader.swift
//  MyMusicApp
//
//  Created by Иван Станкин on 24.06.2023.
//

import UIKit
import SnapKit

class HistoryTableViewHeader: UITableViewHeaderFooterView {
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Date goes here"
        label.textAlignment = .left
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .maBackground
        addSubview(headerLabel)
        setupConstraints()
    }
    
    func configure(text: String) {
        headerLabel.text = text
    }
    
    private func setupConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
        }
    }
    
}
