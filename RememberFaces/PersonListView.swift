//
//  PersonListView.swift
//  RememberFaces
//
//  Created by Maria Sandu on 03.10.2023.
//

import SwiftUI

struct PersonListView: View {
    let persons: [Person]
       @Environment(\.modelContext) private var context
    
       private func deletePerson(indexSet: IndexSet) {
           indexSet.forEach { index in
               let person = persons[index]
               context.delete(person)
               do {
                   try context.save()
               } catch {
                   print(error.localizedDescription)
               }
           }
       }
       var body: some View {
           List {
               ForEach(persons, id: \.id) { person in
                   NavigationLink(value: person) {
                       VStack(alignment: .leading) {
                           Text(person.name)
                               .font(.title3)
                           Text(person.personDescription)
                               .font(.caption)
                       }
                   }
               }.onDelete(perform: deletePerson)
           }.navigationDestination(for: Person.self) { person in
               PersonDetailView(person: person)
           }
       }
}

#Preview {
    PersonListView(persons: [Person.mockPerson])
}
