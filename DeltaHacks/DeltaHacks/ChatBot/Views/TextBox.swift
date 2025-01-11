//
//  TextBox.swift
//  DeltaHacks
//
//  Created by Karl-Alexandre Michaud on 2025-01-11.
//

import SwiftUI

struct TextBox: View {
    // Variables
    @State var prompt = ""
    let characterLimit = 175
    
    var body: some View {
        // Text field creation
        TextField("Enter Waste Questions!", text: $prompt, axis: .vertical)
            .padding()
//            .frame(height: 175) // Adjust height for 4 lines
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke()
            )
            .padding(.horizontal)
            .onChange(of: prompt) { newValue in
                // Ensure the character limit is respected
                if newValue.count > characterLimit {
                    prompt = String(newValue.prefix(characterLimit))
                }
        }
        
    }
}
    
#Preview {
    TextBox()
}
