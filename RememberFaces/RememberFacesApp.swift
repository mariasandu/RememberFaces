//
//  RememberFacesApp.swift
//  RememberFaces
//
//  Created by Maria Sandu on 03.10.2023.
//

import SwiftUI
import SwiftData

@main
struct RememberFacesApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Person.self])
    }
}
