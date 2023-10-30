//
//  StateView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 30/10/23.
//

import SwiftUI

struct StateView: View {
    @State var text: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Write")
            TextField("Display something", text: $text)
                .padding([.leading, .trailing], 20)
                .frame(height: 35)
                .background(.yellow)
                .padding([.leading, .trailing], 20)
            
            Spacer()
                .frame(height: 20)
            
            Text("Display")
            Text("\(text)")
                .padding([.leading, .trailing], 20)
                .frame(height: 35)
                .background(.cyan)
                .padding([.leading, .trailing], 20)
            
            Spacer()
                .frame(height: 100)
            
            NavigationLink("Binding", destination: BindingView(text: $text))
                            .padding([.leading, .trailing], 20)
                            .frame(height: 35)
                            .background(.gray)
                            .foregroundColor(.white)
                            .navigationTitle("Binding")
            
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView(text: "")
    }
}
