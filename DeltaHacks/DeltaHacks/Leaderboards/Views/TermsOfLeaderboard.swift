//
//  TermsOfLeaderboard.swift
//  DeltaHacks
//
//  Created by Kabir Kumar on 2025-01-11.
//

import SwiftUI

struct TermsOfLeaderboard: View {
    var body: some View {
        @State var name = ""
        
        VStack {
            Text("Leaderboard")
                .font(.largeTitle)
                .bold()
        
            TextField("Username", text: $name)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                )
                .padding(.horizontal)
        }
    }
}

#Preview {
    TermsOfLeaderboard()
}
