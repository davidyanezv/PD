//
//  ListPresenter.swift
//  PD
//
//  Created by David on 5/7/20.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation

protocol ListPresenterProtocol {
    
    func loadSchedule(keyword: String?)
    
}

class ListPresenter: ListPresenterProtocol {
    
    weak var view: ListViewControllerProtocol!
    let dataManager = DataManager()
    var timer: Timer?
    var keyword: String?
    
    init(with view: ListViewControllerProtocol) {
        self.view = view
    }
    
    func loadSchedule(keyword: String? = nil) {
        self.keyword = keyword
        resetTimer()
    }
    
    func resetTimer() {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { [weak self] timer in
            self?.startSearch()
        }
    }
    
    func startSearch() {
        
        let count = keyword?.count ?? 0
        if count < 3 {
            keyword = nil
        }
        
        dataManager.search(keyword: keyword) { [weak self] (schedules) in
            DispatchQueue.main.async {
                //self?.view.hideLoader()
                self?.view.displayResult(schedules: schedules)
            }
        }
        
    }
    
}
