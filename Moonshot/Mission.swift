//
//  Mission.swift
//  Moonshot
//
//  Created by Jazz Siddiqui on 2025-11-29.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct Crew: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [Crew]
    let description: String
    
    var displayName: String { "Apollo \(id)" }
    var imageURL: String { "apollo\(id)" }
    var formattedLaunchDate: String { launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A" }
}


