//
//  ChatBotView.swift
//  DeltaHacks
//
//  Created by Karl-Alexandre Michaud on 2025-01-11.
//

import SwiftUI


struct ChatBotView: View {
    
    // Prompt variable
    @State private var messageText = ""
    
    // Max prompt length
    @State private var characterLimit = 175
    
    // Keep track of previous messages in the conversation
    @State var messages: [String] = ["Hello, I am Recyclomatic. Ask me anything related to waste!"]
    
    var body: some View {
        ChatBotIntro()
        
        ScrollView {
            ForEach(messages, id: \.self) { message in

                if message.contains("[USER]") {
                    let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                    
                    HStack {
                        Spacer()
                        Text(newMessage)
                            .padding()
                            .background(.gray.opacity(0.15))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                    }
                    
                } else {
                    HStack {
                        Text(message)
                            .padding()
                            .foregroundColor(.white)
                            .background(.green.opacity(0.8))
                            .cornerRadius(10)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 10)
                        Spacer()
                    }

                }
            }
        }
        
        HStack {
            TextField("Enter Waste Questions!", text: $messageText, axis: .vertical)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                        .stroke()
                ).onChange(of: messageText) { newValue in
                    // Ensure the character limit is respected
                    if newValue.count > characterLimit {
                        messageText = String(newValue.prefix(characterLimit))
                    }
                }
                .onSubmit {
                sendMessageToBot(message: messageText)
            }
            
            // Send button
            Button {
                sendMessageToBot(message: messageText)
            } label: {
                Image(systemName: "paperplane.fill")
            }
            .font(.system(size: 25))
            .padding(.horizontal, 10)
            
        }
        .padding()
        
    }
    
    func sendMessageToBot(message: String) {
        withAnimation {
            messages.append("[USER]" + message)
            self.messageText = ""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                let answer = getBotResponse(message: message)
                messages.append(answer)
            }
        }
    }
}

#Preview {
    ChatBotView()
}
