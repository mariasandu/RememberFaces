//
//  PersonDetailView.swift
//  RememberFaces
//
//  Created by Maria Sandu on 03.10.2023.
//

import SwiftUI
import SwiftData

struct PersonDetailView: View {
    @State private var name: String = ""
    @State private var personDescription: String = ""
    @State private var imageData: Data? = nil
    @State private var myImage: UIImage? = nil
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    let person: Person
    
    var body: some View {
        Form {
            HStack {
                if let image = myImage {
                    Image(uiImage: image)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing)
                        .clipShape(Circle())
                        .frame(width: 70, height: 70)
                } else {
                    Image(systemName: "person.and.background.dotted")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.trailing)
                        .frame(width: 70, height: 70)
                        .foregroundColor(.mint)
                }
                
                TextField("Name", text: $name)
            }
            TextField("Person description", text: $personDescription)
            Button("Update") {
                person.name = name
                person.personDescription = personDescription
                do {
                    try context.save()
                } catch {
                    print(error.localizedDescription)
                }
                dismiss()
            }
        }.onAppear {
            name = person.name
            personDescription = person.personDescription

            if let imageData = person.imageData {
                myImage = UIImage(data: imageData)
            }
        }
    }
}

#Preview {
    PersonDetailView(person: Person.mockPerson)
}
