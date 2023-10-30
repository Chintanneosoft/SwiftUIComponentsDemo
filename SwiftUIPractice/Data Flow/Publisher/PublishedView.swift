//
//  PublishedView.swift
//  06_SwiftUI_DataFlow
//
//  Created by webwerks  on 27/10/23.
//

import SwiftUI

// Published
// - used for creating a centralized data model (typically a class) that can notify views of changes
// - it's suitable when you need to manage and propagate complex data models

// State vs Published
// - State
//   - suitable for simple, view-specific state and straightforward data types
// - Published
//   - used for more complex data models and managing view hierarchy-specific state

class Model: ObservableObject {
    @Published var text = "Chintan"
}

struct PublishedView: View {
    
    @ObservedObject var obj = Model()
    
    var body: some View {
        VStack {
            Text("\(obj.text)")
                .padding([.leading, .trailing], 20)
                .frame(height: 35)
                .background(.cyan)
                .padding([.leading, .trailing], 20)
            Spacer()
                .frame(height: 20)
            
            NavigationLink("Next", destination: AnotherView(obj: obj))
                .padding([.leading, .trailing], 20)
                .frame(height: 35)
                .background(.gray)
                .foregroundColor(.white)
                .navigationTitle("Next")
        }
    }
}

struct PublishedView_Previews: PreviewProvider {
    static var previews: some View {
        PublishedView()
    }
}
