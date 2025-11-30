//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Jazz Siddiqui on 2025-11-29.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file))")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to read \(file))")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let decoded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode using \(file)")
        }
        
        return decoded
    }
}
