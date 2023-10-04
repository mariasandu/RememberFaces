//
//  Person.swift
//  RememberFaces
//
//  Created by Maria Sandu on 03.10.2023.
//

import Foundation
import SwiftData
import SwiftUI


@Model
final class Person: Identifiable {
    @Attribute(.unique) var id: String = UUID().uuidString
    @Attribute(.externalStorage) var imageData: Data?
    var name: String
    var personDescription: String
    
    init(id: String = UUID().uuidString, imageData: Data?, name: String, personDescription: String) {
        self.id = id
        self.imageData = imageData
        self.name = name
        self.personDescription = personDescription
    }
    
    static var mockPerson: Person {
        .init(id: UUID().uuidString, imageData: nil, name: "Maria", personDescription: "Emids")
    
    }

}
