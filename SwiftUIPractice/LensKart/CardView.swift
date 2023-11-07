//
//  CardView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 07/11/23.
//

import Foundation
import SwiftUI

struct CardView: View{
    
    var item: Item
    var animation: Namespace.ID
    
    var body: some View{
        VStack{
            HStack{
                  Spacer(minLength: 0)
                Text(item.price)
                    .fontWeight(.heavy)
                    .padding(.vertical,5)
                    .padding(.horizontal,10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
            }
            Image(item.image)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .padding()
            
            Text(item.title)
            .font(.body)
            .foregroundColor(.black)
            
            Text(item.subtitle)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack{
                Button(action: {}) {
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
                Text(item.rating)
                    .fontWeight(.heavy)
            }
            .padding(5)
        }
        .padding(5)
        .background(Color(item.image))
        .cornerRadius(15)
    }
}
