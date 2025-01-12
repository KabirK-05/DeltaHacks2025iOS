//
//  ChatBotViewModel.swift
//  DeltaHacks
//
//  Created by Karl-Alexandre Michaud on 2025-01-11.
//

import Foundation
import OpenAI

let key = "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"

let openAI = OpenAI(apiToken: key)

func getBotResponse(message: String) -> String {
    let userMessage = Message(content: message, isUser: true)
    let controller = ChatController()
    controller.messages.append(userMessage)
    controller.getBotReply()
    return controller.outputMessages?.content ?? "Failed"
}


struct Message: Identifiable {
    var id: UUID = .init()
    var content: String
    var isUser: Bool
}


class ChatController: ObservableObject {
    @Published var messages: [Message] = []
    @Published var outputMessages: Message? = nil
    @Published var streamedText = "Generated text"
    
    let openAI = OpenAI(apiToken: key)
    
    func getBotReply() {
        let query = ChatQuery(
            messages: self.messages.map({
                .init(role: .user, content: $0.content)!
            }),
            model: .gpt4_o
        )
        
//        openAI.chatsStream(query: query) { partialResult in
//            switch partialResult {
//            case .success(let result):
//                if let content = result.choices.first?.delta.content {
//                    DispatchQueue.main.async {
//                        self.streamedText += content
//                    }
//                }
//            case .failure(let error):
//                print("Streaming chunk error: \(error.localizedDescription)")
//            }
//        } completion: { error in
//            if let error = error {
//                print("Streaming completion error: \(error.localizedDescription)")
//            } else {
//                // When streaming completes, save the final message
//                DispatchQueue.main.async {
//                    //self.messages.append(Message(content: self.streamedText, isUser: false))
//                    self.outputMessages = Message(content: self.streamedText, isUser: false)
//                }
//            }
//        }
        
        openAI.chats(query: query) { result in
            switch result {
            case .success(let success):
                guard let choice = success.choices.first else {
                    return
                }
                guard let message = choice.message.content?.string else { return }
                DispatchQueue.main.async {
                    self.messages.append(Message(content: message, isUser: false))
                }
            case .failure(let failure):
                print(failure)
            }
        }
        
        
    }
}
