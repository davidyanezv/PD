//
//  Schedule.swift
//  PD
//
//  Created by David on 5/7/20.
//  Copyright © 2020 David. All rights reserved.
//

// MARK: - Schedule
class Schedule: Codable {
    var id: String?
    var type: ScheduleType?
    var summary: String?
    var scheduleSelf, htmlURL: String?
    var name: String?
    var timeZone: TimeZone?
    var scheduleDescription: String?
    var escalationPolicies, users: [Entity]?
    var privilege: String?
    var teams: [Entity]?

    enum CodingKeys: String, CodingKey {
        case id, type, summary
        case scheduleSelf = "self"
        case htmlURL = "html_url"
        case name
        case timeZone = "time_zone"
        case scheduleDescription = "description"
        case escalationPolicies = "escalation_policies"
        case users, privilege, teams
    }

    init(id: String?, type: ScheduleType?, summary: String?, scheduleSelf: String?, htmlURL: String?, name: String?, timeZone: TimeZone?, scheduleDescription: String?, escalationPolicies: [Entity]?, users: [Entity]?, privilege: String?, teams: [Entity]?) {
        self.id = id
        self.type = type
        self.summary = summary
        self.scheduleSelf = scheduleSelf
        self.htmlURL = htmlURL
        self.name = name
        self.timeZone = timeZone
        self.scheduleDescription = scheduleDescription
        self.escalationPolicies = escalationPolicies
        self.users = users
        self.privilege = privilege
        self.teams = teams
    }
}

