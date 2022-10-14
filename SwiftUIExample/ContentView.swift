//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Eli Sokeland on 10/13/22.
//

import SwiftUI

// The basic view that gets created in a SwiftUI project
// with navigation added to the form screen.

struct ContentView: View {
    
    @State var fullName: String?
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                // Swift allows unwrapping of optional variables with if let statements.
                // This allows us to write the full variable name without worrying about nill.
                // If there was no if let, we would need to writ `fullName?` or do a ternary.
                if let fullName {
                    Spacer()
                        .frame(height: 20)
                    Text("Welcome: " + fullName)
                }
                Spacer()
                    .frame(height: 20)
                NavigationLink("Enter name please") {
                    FormExample(fullName: $fullName)
                }
            }
            .padding()
        }
    }
}

// This struct allows for XCode to live preview the view.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
