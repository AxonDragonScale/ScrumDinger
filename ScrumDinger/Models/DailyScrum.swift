//
//  DailyScrum.swift
//  ScrumDinger
//
//  Created by Ronak Harkhani on 20/03/21.
//

import SwiftUI

struct DailyScrum: Identifiable {
    var id: UUID
    
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color) {
        self.id = id
        self.title = title
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.color = color
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
