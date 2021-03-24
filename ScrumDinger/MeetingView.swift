//
//  MeetingView.swift
//  ScrumDinger
//
//  Created by Ronak Harkhani on 20/03/21.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    
    // StateObject means the view owns the source of truth for the object
    // The objects lifecycle is tied to the view's lifecycle
    @StateObject var scrumTimer = ScrumTimer()
    
    private let speechRecognizer = SpeechRecognizer()
    @State private var isRecording = false
    @State private var transcript = ""
    
    
    
    var player: AVPlayer {
        return AVPlayer.sharedDingPlayer
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.color)
            
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                  secondsRemaining: scrumTimer.secondsRemaining,
                                  scrumColor: scrum.color)
                
                MeetingTimerView(speakers: scrumTimer.speakers, isRecording: isRecording, scrumColor: scrum.color)
                
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.color.accessibleFontColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
            speechRecognizer.record(to: $transcript)
            isRecording = true
            
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
            speechRecognizer.stopRecording()
            isRecording = false
            
            let newHistory = History(attendees: scrum.attendees,
                                     lengthInMinutes: scrumTimer.secondsElapsed / 60,
                                     transcript: transcript)
            scrum.history.insert(newHistory, at: 0)
        }
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.previewData[0]))
    }
}
