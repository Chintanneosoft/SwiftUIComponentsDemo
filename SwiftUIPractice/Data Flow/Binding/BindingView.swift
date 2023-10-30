//
//  BindingView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 30/10/23.
//

import SwiftUI

struct BindingView: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
                    Text("Display")
                    Text("\(text)")
                        .padding([.leading, .trailing], 20)
                        .frame(height: 35)
                        .background(.cyan)
                        .padding([.leading, .trailing], 20)
                    
                    Spacer()
                        .frame(height: 100)
                    
                    Button("Change text") {
                        text = "Navigate back"
                    }
                    .padding([.leading, .trailing], 20)
                    .frame(height: 35)
                    .background(.gray)
                    .foregroundColor(.white)
                }
    }
}

//struct BindingView_Previews: PreviewProvider {
//    static var previews: some View {
//        BindingView(text: )
//    }
//}
