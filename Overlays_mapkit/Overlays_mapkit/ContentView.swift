//
//  ContentView.swift
//  Overlays_mapkit
//
//  Created by kalaivani on 28/12/2024.
//

import SwiftUI
import MapKit


extension CLLocationCoordinate2D {
    static let  newYork: Self = .init(latitude: 40.730610, longitude: -73.935242)
    static let seattle: Self = .init(latitude: 47.606209, longitude: -122.332069)
    static let chicago: Self = .init(latitude: 41.883229, longitude: -87.632398)
}

struct ContentView: View {
    @State private var route: MKRoute?

    let location1 = CLLocationCoordinate2D(latitude: 40.413652, longitude: -3.681793)
    let location2 = CLLocationCoordinate2D(latitude: 40.414951, longitude: -3.681856)
    let location3 = CLLocationCoordinate2D(latitude: 40.416257, longitude: -3.680661)

    let location4 = [
      CLLocationCoordinate2D(latitude: 40.418197, longitude: -3.685186),
      CLLocationCoordinate2D(latitude: 40.418528, longitude: -3.683695),
      CLLocationCoordinate2D(latitude: 40.416122, longitude: -3.682697),
      CLLocationCoordinate2D(latitude: 40.415787, longitude: -3.684226),
    ]
    
    var body: some View {
        
        Map {
            MapCircle(center: location1, radius: CLLocationDistance(30))
                .foregroundStyle(.red.opacity(0.6))
                .stroke(Color.red, lineWidth: 1)
                .mapOverlayLevel(level: .aboveRoads)
            
            MapCircle(center: location2, radius: CLLocationDistance(30))
                .foregroundStyle(.green.opacity(0.6))
                .stroke(Color.green, lineWidth: 1)
                .mapOverlayLevel(level: .aboveLabels)
           
            //Polygon
            
            MapPolygon(coordinates: location4)
                .foregroundStyle(.purple.opacity(0.6))
                .stroke(Color.purple, lineWidth: 1)
                .mapOverlayLevel(level: .aboveRoads)
            
            //Polyline
            
            MapPolyline(coordinates: [location1, location3])
                .stroke(Color.blue, lineWidth: 2)
             
                
        }
    }
    
    func calculateDirections() async {
        
    }
}

#Preview {
    ContentView()
}
