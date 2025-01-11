//
//  ChatBotIntro.swift
//  DeltaHacks
//
//  Created by Karl-Alexandre Michaud on 2025-01-11.
//

import SwiftUI

struct ChatBotIntro: View {
    @State var promptSent = false // Track if the prompt has been sent
        
    var body: some View {
        if !promptSent {
            HStack {
                Image("AppLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75) // Adjust size as needed
                Text("Hello, I am Recyclomatic. Ask me anything related to waste!")

            }.padding(.trailing)
        }
        
    }
}

#Preview {
    ChatBotIntro()
}
