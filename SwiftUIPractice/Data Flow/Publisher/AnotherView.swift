//
//  AnotherView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 30/10/23.
//

import SwiftUI

struct AnotherView: View {
    
    @ObservedObject var obj: Model
    
    var body: some View {
        VStack {
            Text("\(obj.text)")
                .padding([.leading, .trailing], 20)
                .frame(height: 35)
                .background(.cyan)
                .padding([.leading, .trailing], 20)
            
            Spacer()
                .frame(height: 20)
            
            Button("Change text") {
                obj.text = "Navigate back"
            }
            .padding([.leading, .trailing], 20)
            .frame(height: 35)
            .background(.gray)
            .foregroundColor(.white)
        }
    }
}
