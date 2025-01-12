//
//  HomeView.swift
//  DeltaHacks
//
//  Created by Kabir Kumar on 2025-01-11.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()
                
                HStack {
                    
                    Spacer()
                    
                    VStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Recycling")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.blue)
                            
                            Text("70%")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Garbage")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.gray)
                            
                            Text("50%")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Organics")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.green)
                                
                            
                            Text("30%")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Glass")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.orange)
                            
                            
                            Text("20%")
                                .bold()
                        }
                        .padding(.init(top: 0, leading: 0, bottom: 8, trailing: 27))
                        
                        
                    }
                    
                    Spacer()
                    
                    ZStack {
                        // MARK: the rings for progress
                        
                        // recycling
                        ProgressCircleView(progress: $viewModel.recyclable, goal: 50, color: .blue)
                        
                        // garbage
                        ProgressCircleView(progress: $viewModel.garbage, goal: 50, color: .gray)
                            .padding(.all, 20)
                        
                        // organics
                        ProgressCircleView(progress: $viewModel.organics, goal: 40, color: .green)
                            .padding(.all, 40)
                        
                        // glass
                        ProgressCircleView(progress: $viewModel.glass, goal: 30, color: .orange)
                            .padding(.all, 60)
                        
                        
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("Waste Overview")
                    
                    Spacer()
                    
                    Button {
                        print("show more")
                    } label: {
                        Text("Show more")
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(15)
                    }
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                    ForEach(viewModel.mockActivities, id: \.id) { wasteData in
                        WasteCardView(waste: wasteData)
                    }
                }
                .padding(.horizontal)
                
            }
        }
    }
}

#Preview {
    HomeView()
}
