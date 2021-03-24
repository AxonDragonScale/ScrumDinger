//
//  HistoryView.swift
//  ScrumDinger
//
//  Created by Ronak Harkhani on 24/03/21.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeesList)
                
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeesList: String {
        ListFormatter.localizedString(byJoining: attendees)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView(history: History(attendees: ["Ronak", "Anish", "Omkar"],
                                     lengthInMinutes: 10,
                                     transcript: "Anish, Would you like to start today? Yeah, Sure, Yesterday I planned the renderer for the game engine and reviewed the editor design with the UI team."))
    }
}
