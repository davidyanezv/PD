//
//  DataManagerswift.swift
//  PD
//
//  Created by David on 5/7/20.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation

class DataManager {
    
    func loadData() -> Data {
        let path = Bundle.main.path(forResource: "schedules", ofType: "json")
        let fileUrl = URL(fileURLWithPath: path!)
        let data = try! Data(contentsOf: fileUrl, options: .mappedIfSafe)
        return data
    }
    
    func search(keyword: String? = nil, completion: @escaping (_ schedules: [Schedule]) -> ()) {
        
        //simulate server call to fetch data
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2.0) { [weak self] in
            
            if let data = self?.loadData() {
                let response = try! JSONDecoder().decode(ScheduleResponse.self, from: data)
                
                //if keyword is present then try to filter otherwise pass all results
                if let key = keyword, let schedules = response.schedules {
                    let schedules = schedules.filter { (schedule) -> Bool in
                        if let name: String = schedule.name?.lowercased(), name.contains(key.lowercased()) {
                            return true
                        }
                        return false
                    }
                    completion(schedules)
                } else {
                    completion(response.schedules ?? [])
                }
                
            }
        
        }
        
    }
    
}
