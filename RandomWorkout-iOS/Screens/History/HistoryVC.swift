//
//  HistoryVC.swift
//  RandomWorkout-iOS
//
//  Created by Duilan on 20/04/21.
//

import UIKit

final class HistoryVC: UIViewController {
    
    private let historyTable = UITableView(frame: .zero, style: .insetGrouped)
    private let coreDataManager = CoreDataManager()
    private var historyData: [History] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        configureHistoryTable()
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyData = coreDataManager.fetchHistory()
        historyTable.reloadData()
    }
    
    private func configureHistoryTable() {
        view.addSubview(historyTable)
        historyTable.dataSource = self
        historyTable.delegate = self
        historyTable.rowHeight = 100
        historyTable.backgroundColor = .systemGroupedBackground
        historyTable.register(HistoryCell.self , forCellReuseIdentifier: HistoryCell.reuseID)
        
        historyTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            historyTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            historyTable.leftAnchor.constraint(equalTo: view.leftAnchor),
            historyTable.rightAnchor.constraint(equalTo: view.rightAnchor),
            historyTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension HistoryVC: UITableViewDataSource, UITableViewDelegate {
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        historyTable.setEditing(editing, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.performBatchUpdates({
                coreDataManager.delete(historyData[indexPath.row])
                historyData.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            }, completion: nil )
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if historyData.isEmpty {
            DispatchQueue.main.async {
                self.historyTable.backgroundView = RWEmptyView(message: "Let's go! \n Do some exercise")
            }
        } else {
            historyTable.backgroundView = nil
        }
        return historyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryCell.reuseID , for: indexPath) as! HistoryCell
        cell.set(with: historyData[indexPath.row]) 
        return cell
    }
    
}
