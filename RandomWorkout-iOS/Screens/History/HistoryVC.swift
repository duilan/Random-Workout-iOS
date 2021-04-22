//
//  HistoryVC.swift
//  RandomWorkout-iOS
//
//  Created by Duilan on 20/04/21.
//

import UIKit

class HistoryVC: UIViewController {
    
    let historyTable = UITableView()
    
    let coreDataManager = CoreDataManager()
    var historyData: [History] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        configureHistoryTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyData = coreDataManager.fetchHistory()
        historyTable.reloadData()
    }
    
    func configureHistoryTable() {
        historyTable.dataSource = self
        historyTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(historyTable)
        historyTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            historyTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            historyTable.leftAnchor.constraint(equalTo: view.leftAnchor),
            historyTable.rightAnchor.constraint(equalTo: view.rightAnchor),
            historyTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension HistoryVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = historyData[indexPath.row].name
        return cell
    }
    
}
