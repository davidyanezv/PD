//
//  EscalationPolicy.swift
//  PD
//
//  Created by David on 5/7/20.
//  Copyright © 2020 David. All rights reserved.
//

import Foundation

class Entity: Codable {
    var id: String?
    var type: EntityType?
    var summary: String?
    var escalationPolicySelf, htmlURL: String?

    enum CodingKeys: String, CodingKey {
        case id, type, summary
        case escalationPolicySelf = "self"
        case htmlURL = "html_url"
    }

    init(id: String?, type: EntityType?, summary: String?, escalationPolicySelf: String?, htmlURL: String?) {
        self.id = id
        self.type = type
        self.summary = summary
        self.escalationPolicySelf = escalationPolicySelf
        self.htmlURL = htmlURL
    }
}

enum EntityType: String, Codable {
    case escalationPolicyReference = "escalation_policy_reference"
    case teamReference = "team_reference"
    case userReference = "user_reference"
}

enum TimeZone: String, Codable {
    case americaLosAngeles = "America/Los_Angeles"
    case australiaSydney = "Australia/Sydney"
    case europeLondon = "Europe/London"
}

enum ScheduleType: String, Codable {
    case schedule = "schedule"
}
