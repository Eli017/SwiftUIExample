//
//  FormExample.swift
//  SwiftUIExample
//
//  Created by Eli Sokeland on 10/13/22.
//

import SwiftUI

struct FormExample: View {
    
    // Declared state start at the top
    // @State is a source of truth
    // @Binding is a connection to a @State property from another view.
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var isFormValid: Bool = false
    var fullName: Binding<String?> = .constant("")
    
    // The function used to verify that first name is not empty.
    func validateFirstNameField(text: String) {
        isFormValid = !text.isEmpty && !lastName.isEmpty
    }
    
    // Functions in onChange don't need to have variables passed.
    // Here is a way to check the last name field during the onChange call.
    func validateLastNameField() {
        isFormValid = !lastName.isEmpty && !firstName.isEmpty
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    TextField("First Name", text: $firstName)
                        .padding(6.0)
                        .background(Color.white)
                        .cornerRadius(14.0)
                        .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                        .onChange(of: firstName) { newTextValue in
                            validateFirstNameField(text: newTextValue)
                        }
                    TextField("Last Name", text: $lastName)
                        .padding(6.0)
                        .background(Color.white)
                        .cornerRadius(14.0)
                        .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    // Use _ when the variable is unused
                        .onChange(of: lastName) { _ in
                            validateLastNameField()
                        }
                    Button("Submit", action: {
                        print("Submitted!")
                    })
                    // Here is where the value is read.
                    .disabled(isFormValid)
                    .foregroundColor(isFormValid ? Color.blue : Color.gray)
                }
                .padding(.horizontal, 36.0)
                .padding(.vertical, 48.0)
                .frame(width: 250.0)
                .background(Color(hue: 1.0, saturation: 0.061, brightness: 0.834, opacity: 0.2))
                .cornerRadius(6.0)
                .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color(hue: 0.628, saturation: 0.309, brightness: 0.922), lineWidth: 1)
                    )
                Spacer()
            }
            Spacer()
        }
    }
}

// This struct allows for XCode to live preview the view.
struct FormExample_Previews: PreviewProvider {
    static var previews: some View {
        FormExample()
    }
}
