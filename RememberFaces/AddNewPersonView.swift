//
//  AddNewPersonView.swift
//  RememberFaces
//
//  Created by Maria Sandu on 03.10.2023.
//

import SwiftUI
import SwiftData

struct AddNewPersonView: View {
    @State private var name = ""
    @State private var personDescription = ""
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State private var imageData: Data?

//    @State var selectedPhotoData: Data?
    
    private var isFormValid: Bool {
        !name.isEmptyOrWithWhiteSpace && !personDescription.isEmptyOrWithWhiteSpace
    }
    
    var body: some View {
        NavigationView {
            VStack{
                Form {
                    TextField("Enter your name", text: $name)
                    TextField("Say something about you", text: $personDescription)
                    Button("Add a picture", action: showImagePicker)
                    Button("Save") {
                        savePerson()
                    }.disabled(!isFormValid)
                }
                .onChange(of: inputImage) { loadImage() }

                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: $inputImage)
                }
                .navigationTitle("Add New Person")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Close") {
                            dismiss()
                        }
                    }
                }
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                    image?
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func showImagePicker() {
        showingImagePicker = true
        print("this is it")
    }
    
    func savePerson() {
        if let uiImage = inputImage {
            imageData = uiImage.pngData()
        }
        let person = Person(imageData: imageData, name: name, personDescription: personDescription)
        context.insert(person)
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        dismiss()
    }
}

#Preview {
    AddNewPersonView()
}
