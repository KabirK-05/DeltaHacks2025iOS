//
//  ChatBotView.swift
//  DeltaHacks
//
//  Created by Karl-Alexandre Michaud on 2025-01-11.
//

import SwiftUI


struct ChatBotView: View {
    @ObservedObject var viewModel = ViewModel()
    
    // Prompt variable
    @State private var messageText = ""
    
    // Max prompt length
    @State private var characterLimit = 175
    
    // Keep track of previous messages in the conversation

    @State var messages: [Message] = []
    
    var body: some View {
        VStack {
            ChatBotIntro()
            
            ScrollView {
                HStack {
                    Text("Hello!")
                        .padding()
                        .foregroundColor(.white)
                        .background(.green.opacity(0.8))
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 10)
                    Spacer()
                }
                ForEach(viewModel.messages.filter({$0.role != .system}),
                        id: \.id) { message in
                    messageView(message: message)
                    
                }
                
                
            }.onAppear {
                viewModel.intializeAIService()
            }
            
            HStack {
                TextField("Enter Questions!", text: $viewModel.currentInput, axis: .vertical)
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
                        viewModel.sendMessage()
                    }
                
                // Send button
                Button {
                    //                sendMessage(message: messageText)
                    viewModel.sendMessage()
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size: 25))
                .padding(.horizontal, 10)
                
            }
            .padding()
            
        }
        
            
        }
        
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user {
                Spacer()
                Text(message.content)
                    .padding()
                    .background(.gray.opacity(0.15))
                    .cornerRadius(10)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 10)
            }
            else {
                Text(message.content)
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


#Preview {
    ChatBotView()
}
