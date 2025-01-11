//
//  LeaderboardView.swift
//  DeltaHacks
//
//  Created by Kabir Kumar on 2025-01-11.
//

import SwiftUI

struct LeaderboardUser: Codable, Identifiable {
    let id = UUID()
    let username: String
    let count: Int
}

class LeaderboardViewModel: ObservableObject {
    var mockData = [
        LeaderboardUser(username: "Tory", count: 100),
        LeaderboardUser(username: "Drake", count: 90),
        LeaderboardUser(username: "Nicki", count: 80),
        LeaderboardUser(username: "Travis", count: 70),
        LeaderboardUser(username: "Carti", count: 70)
    ]
}

struct LeaderboardView: View {
    @StateObject var viewModel = LeaderboardViewModel()
    @AppStorage("username") var username: String?
    
    @State var showTerms = true
    
    var body: some View {
        VStack {
            Text("Leaderboard")
                .font(.largeTitle)
                .bold()
            HStack {
                Text("Name")
                    .bold()
                
                Spacer()
                
                Text("Score")
                    .bold()
            }
            .padding()
            
            
            LazyVStack(spacing: 16) {
                ForEach(viewModel.mockData) { person in
                    HStack {
                        Text("\(person.id).")
                        
                        Text(person.username)
                        
                        Spacer()
                        
                        Text("\(person.count)")
                    }
                    .padding(.horizontal)
                    
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .fullScreenCover(isPresented: $showTerms) {
            TermsOfLeaderboard()
        }
        .task {
            do {
                try await DatabaseManager.shared.postScoreUpdateFor(username: "Bob", count: 10)
            } catch {
                print(error.localizedDescription)
            }
    
        }
    }
        
}

#Preview {
    LeaderboardView()
}
