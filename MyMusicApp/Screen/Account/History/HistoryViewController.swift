//
//  HistoryViewController.swift
//  MyMusicApp
//
//  Created by Иван Станкин on 24.06.2023.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var headerTitles: [String] = ["Name 1", "Name 2"]
    var cellData: [String] = ["Data1", "Data2"]
    
    
    var testImage = UIImage(named: "image2")
    var testLabel1 = "Where is my mind"
    var testLabel2 = "Pixies"
    var testLabel3 = "14:55"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .maBackground
        
        setupViews()
        setupConstraints()
        setupTableView()
 
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "History"
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(HistoryTableViewHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        view.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
    }
}

extension HistoryViewController: UITableViewDelegate {
    
}

extension HistoryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HistoryTableViewCell
        cell.configureCell(image: testImage,
                           firstText: testLabel1,
                           secondText: testLabel2,
                           time: testLabel3)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 73
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! HistoryTableViewHeader
        header.configure(text: headerTitles[section])
        return header
    }
}
