//
//  LeaderboardView.swift
//  DeltaHacks
//
//  Created by Kabir Kumar on 2025-01-11.
//

import SwiftUI

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
                ForEach(viewModel.leaders) { person in
                    HStack {
                        Text("1. ")
                        
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
