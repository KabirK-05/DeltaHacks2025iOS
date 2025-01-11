//
//  LeaderboardView.swift
//  DeltaHacks
//
//  Created by Kabir Kumar on 2025-01-11.
//

import SwiftUI

struct LeaderboardUser: Codable, Identifiable {
    let id: Int
    let createdAt: String
    let username: String
    let count: Int
}

class LeaderboardViewModel: ObservableObject {
    var mockData = [
        LeaderboardUser(id: 0, createdAt: "", username: "Tory", count: 100),
        LeaderboardUser(id: 1, createdAt: "", username: "Drake", count: 90),
        LeaderboardUser(id: 2, createdAt: "", username: "Nicki", count: 80),
        LeaderboardUser(id: 3, createdAt: "", username: "Travis", count: 70),
        LeaderboardUser(id: 4, createdAt: "", username: "Carti", count: 70)
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
    }
        
}

#Preview {
    LeaderboardView()
}
