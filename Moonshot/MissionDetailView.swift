//
//  MissionDetailView.swift
//  Moonshot
//
//  Created by Jazz Siddiqui on 2025-11-29.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionDetailView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.imageURL)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.5)
                        .padding([.top, .bottom])
                    
                    VStack(alignment: .leading) {
                        CustomDivider()
                        MissionHighlightsView(mission: mission)
                        CustomDivider()
                        
                        Text("Crew")
                            .font(.title.bold())
                    }
                    .padding(.horizontal)
                    
                    CrewMembersView(crewMembers: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { crewMember in
            if let member = astronauts[crewMember.name] {
                return CrewMember(role: crewMember.role, astronaut: member)
            } else {
                fatalError("Unable to find astronaut for \(crewMember.name)")
            }
        }
    }
}

struct MissionHighlightsView: View {
    let mission: Mission
    
    var body: some View {
        Text("Mission Highlights")
            .font(.title.bold())
            .padding(.bottom, 5)
        
        Text(mission.description)
    }
}

struct CrewMembersView: View {
    let crewMembers: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crewMembers, id: \.role) { crewMember in
                    NavigationLink {
                        Text("Astronaut Detail View")
                    } label: {
                        VStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 156, height: 108)
                                .clipShape(Circle())
                            
                            Text(crewMember.astronaut.name)
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                
                            Text(crewMember.role)
                                .foregroundStyle(.gray)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    MissionDetailView(mission: missions.first!, astronauts: astronauts)
        .preferredColorScheme(.dark)
}
