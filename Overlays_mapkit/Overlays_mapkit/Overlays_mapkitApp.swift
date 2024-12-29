//
//  Overlays_mapkitApp.swift
//  Overlays_mapkit
//
//  Created by kalaivani on 28/12/2024.
//

import SwiftUI
import Foundation

@main
struct Overlays_mapkitApp {
    static func main() async {
        let destinations = ["Downtown", "Uptown", "Midtown", "Suburb", "Airport"]
        await processSegmentsConcurrently(destinations: destinations)
        
    }
}


    // Simulate a network task with a delay
func fetchSegment(for destination: String) async -> String {
        let delay = UInt64.random(in: 1_000_000_000...3_000_000_000) // 1 to 3 seconds
        print("[Start] Fetching segment for \(destination) at \(Date())")
        try? await Task.sleep(nanoseconds: delay) // Simulated network delay
        print("[Finish] Segment for \(destination) fetched at \(Date())")
        return "Segment for \(destination)"
}

    // Main function to demonstrate TaskGroup

    func processSegmentsConcurrently(destinations: [String]) async {
        print("Processing started at \(Date())\n")
        
        await withTaskGroup(of: String.self) { group in
            // Add a task for each destination
            for destination in destinations {
                group.addTask {
                    await fetchSegment(for: destination)
                }
            }
            
            // Collect and print results as tasks complete
            for await result in group {
                print("Result received: \(result) at \(Date())")
            }
        }
        
        print("\nProcessing completed at \(Date())")
    }

// : App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
