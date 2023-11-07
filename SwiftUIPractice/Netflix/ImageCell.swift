//
//  ImageCell.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 07/11/23.
//

import Foundation
import SwiftUI

struct ImageCell: View {
    
    var imgs:[String]
    var names:[String:String]
    var sectionName: String
    
    var body: some View {
        Section(header:
                    Text(sectionName)
            .foregroundColor(.white)
            .font(.title3)
            .fontWeight(.bold)) {
                ScrollView(.horizontal) {
                    LazyHStack{
                        ForEach(imgs, id: \.self) { imageName in
                            ZStack(alignment: .bottom, content: {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .background(.white.opacity(0.3))
                                Text(names[imageName] ?? "")
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .frame(maxWidth: .infinity)
                                    .background(.black.opacity(0.5))
                            })
                        }
                        .cornerRadius(5)
                        .padding(3)
                    }
                }.listRowBackground(Color.black)
            }
    }
}
