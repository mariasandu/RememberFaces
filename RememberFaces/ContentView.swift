//
//  ContentView.swift
//  RememberFaces
//
//  Created by Maria Sandu on 03.10.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var isPresented: Bool = false
    @Query var persons: [Person]
    
    var body: some View {
        NavigationStack {
            VStack {
                PersonListView(persons: persons)
                    .navigationTitle("Remember Faces App")
            }
            .sheet(isPresented: $isPresented, content: {
                AddNewPersonView()
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
