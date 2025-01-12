//
//  HomeViewModel.swift
//  DeltaHacks
//
//  Created by Kabir Kumar on 2025-01-11.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var mockActivities = [
        Waste(id: 0, title: "Recycling", subtitle: "Goal 50", image: "arrow.3.trianglepath", tintColor: .blue, amount: "30"),
        Waste(id: 1, title: "Garbage", subtitle: "Goal 50", image: "trash", tintColor: .gray, amount: "40"),
        Waste(id: 2, title: "Organics", subtitle: "Goal 40", image: "carrot", tintColor: .green, amount: "10"),
        Waste(id: 3, title: "Glass", subtitle: "Goal 30", image: "wineglass", tintColor: .orange, amount: "10")
    ]
    
    @Published var recyclable: Int = 30
    @Published var garbage: Int = 40
    @Published var glass: Int = 10
    @Published var organics: Int = 10
}
