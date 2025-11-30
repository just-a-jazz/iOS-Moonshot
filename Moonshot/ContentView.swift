//
//  ContentView.swift
//  Moonshot
//
//  Created by Jazz Siddiqui on 2025-11-26.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let layout = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionDetailView(mission: mission, astronauts: astronauts)
                        } label: {
                            MissionView(mission: mission)
                        }
                    }
                }
                .padding([.vertical, .horizontal])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

struct MissionView: View {
    let mission: Mission
    
    var body: some View {
        VStack {
            Image(mission.imageURL)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text(mission.displayName)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 1)
                Text(mission.formattedLaunchDate)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(.lightBackground)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
        }
        .padding(3)
    }
}

#Preview {
    ContentView()
}
