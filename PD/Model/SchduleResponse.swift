//
//  SchduleResponse.swift
//  PD
//
//  Created by David on 5/7/20.
//  Copyright © 2020 David. All rights reserved.
//

class ScheduleResponse: Codable {
    var schedules: [Schedule]?
    var limit, offset: Int?
    var more: Bool?

    init(schedules: [Schedule]?, limit: Int?, offset: Int?, more: Bool?) {
        self.schedules = schedules
        self.limit = limit
        self.offset = offset
        self.more = more
    }
}

