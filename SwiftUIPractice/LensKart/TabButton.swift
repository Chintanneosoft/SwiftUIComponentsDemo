//
//  File.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 07/11/23.
//

import Foundation
import SwiftUI

struct TabButton: View{
    var title: String
    @Binding var selected: String
    var animation: Namespace.ID
    var body: some View{
        
        Button(action:{
            withAnimation(.spring()){
                selected = title
            }
        }) {
            Text(title)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(selected == title ? .white : .black)
                .padding(.vertical,10)
                .padding(.horizontal,selected == title ? 10 : 10 )
                .background(
                    ZStack{
                        if selected == title{
                            Color.black
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
        }
    }
    
}
