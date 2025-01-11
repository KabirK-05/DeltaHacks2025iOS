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
    func fetchLeaderboards() async throws -> [LeaderboardUser] {
        let snapshot = try await database.collection(leaderboard).getDocuments()
        print(snapshot.documents)
        print(snapshot.documents.first?.data())
        
        // getting the leaders from the database
        return try snapshot.documents.compactMap( { try $0.data(as: LeaderboardUser.self)})
    }
    
    
    // Post (Update) Leaderboards for current user
    func postScoreUpdateFor(username: String, count: Int) async
    throws {
        let leader = LeaderboardUser(username: username, count: count)
        let data = try Firestore.Encoder().encode(leader)
        try await database.collection(leaderboard).document(username).setData(data, merge: false)
    }
}
