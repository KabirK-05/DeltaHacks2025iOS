//
//  DatabaseManager.swift
//  DeltaHacks
//
//  Created by Kabir Kumar on 2025-01-11.
//

import Foundation
import FirebaseFirestore

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private init() { }
    let database = Firestore.firestore()
    
    // Fetch Leaderboards
    func fetchLeaderboards() async throws {
        let snapshot = try await database.collection("users").getDocuments()
        
        print(snapshot.documents)
        print(snapshot.documents.first)
    }
    
    
    // Post (Update) Leaderboards for current user
}
