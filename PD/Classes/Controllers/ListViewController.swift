//
//  ViewController.swift
//  PD
//
//  Created by David on 5/7/20.
//  Copyright © 2020 David. All rights reserved.
//

import UIKit

protocol ListViewControllerProtocol: class {
    func displayResult(schedules: [Schedule])
//    func showLoader()
//    func hideLoader()
}

class ListViewController: UIViewController {
   
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    lazy var presenter: ListPresenterProtocol = {
        return ListPresenter(with: self)
    }()
    var schedules: [Schedule] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Pager Duty"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UINib(nibName: ScheduleCell.identifier, bundle: nil), forCellReuseIdentifier: ScheduleCell.identifier)
        presenter.loadSchedule(keyword: nil)
        
    }
    
}

extension ListViewController: ListViewControllerProtocol {
    
    func displayResult(schedules: [Schedule]) {
        self.schedules = schedules
        tableView.reloadData()
    }
    
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScheduleCell.identifier) as! ScheduleCell
        let schedule = schedules[indexPath.row]
        cell.configure(schedule: schedule)
        return cell
    }
    
}

extension ListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.loadSchedule(keyword: searchText)
    }
    
}

