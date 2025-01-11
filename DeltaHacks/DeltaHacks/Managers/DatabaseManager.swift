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
    let leaderboard = "leaderboard"
    
    // Fetch Leaderboards
    func fetchLeaderboards() async throws {
        let snapshot = try await database.collection("users").getDocuments()
        
        print(snapshot.documents)
        print(snapshot.documents.first?.data())
    }
    
    
    // Post (Update) Leaderboards for current user
    func postScoreUpdateFor(username: String, count: Int) async
    throws {
        let leader = LeaderboardUser(username: username, count: count)
        let data = try Firestore.Encoder().encode(leader)
        try await database.collection(leaderboard).document(username).setData(data, merge: false)
    }
}
