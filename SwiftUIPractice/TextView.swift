//
//  TextView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 20/10/23.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        Text("Hello, World!, Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!")
//            .font(.title)
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

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
