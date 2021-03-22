//
//  ScrumDingerApp.swift
//  ScrumDinger
//
//  Created by Ronak Harkhani on 20/03/21.
//

import SwiftUI

@main
struct ScrumDingerApp: App {
    @ObservedObject private var data = ScrumData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $data.scrums) {
                    data.save()
                }
            }
            .onAppear {
                data.load()
            }
        }
    }
}
