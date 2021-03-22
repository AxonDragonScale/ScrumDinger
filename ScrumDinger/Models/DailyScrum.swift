//
//  DailyScrum.swift
//  ScrumDinger
//
//  Created by Ronak Harkhani on 20/03/21.
//

import SwiftUI

struct DailyScrum: Identifiable, Codable {
    var id: UUID
    
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
    var history: [History]
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color, history: [History] = []) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
        self.history = history
    }
}

extension DailyScrum {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = .random
    }
    
    var data: Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color)
    }
    
    mutating func update(from data: Data) {
        self.title = data.title
        self.attendees = data.attendees
        self.lengthInMinutes = Int(data.lengthInMinutes)
        self.color = data.color
    }
}

extension DailyScrum {
    static var previewData: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Divya", "Surbhi"], lengthInMinutes: 10, color: Color("Design")),
            DailyScrum(title: "App Dev", attendees: ["Ronak", "Anish", "Omkar"], lengthInMinutes: 15, color: Color("App Dev")),
            DailyScrum(title: "Web Dev", attendees: ["Shravan", "Ankit", "Deepak", "Aditya"], lengthInMinutes: 20, color: Color("Web Dev"))
        ]
    }
}
