//
//  NameFormView.swift
//  SwiftUIExample
//
//  Created by Eli Sokeland on 10/14/22.
//

import SwiftUI


// SwiftUI doesn't discriminate between screens/components.
struct LoremIpsumView: View {
    var body: some View {
        // Call to String extension function
        Text(String().generateLoremIpsum())
    }
}

struct LoremIpsumView_Previews: PreviewProvider {
    static var previews: some View {
        LoremIpsumView()
    }
}
