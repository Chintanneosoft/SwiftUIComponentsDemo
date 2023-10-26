//
//  TextView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 20/10/23.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        VStack{
            Text("Hello, World!")
                .font(.title)
            Text("Mai bola Hello Duniya Valo Kaise ho Duniya valo!")
                .fontWeight(.bold)
                .underline()
                .italic()
            //            .strikethrough()
                .font(.system(size: 24,design: .serif))
                .baselineOffset(-20)
                .multilineTextAlignment(.leading)
                .foregroundColor(.blue)
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
