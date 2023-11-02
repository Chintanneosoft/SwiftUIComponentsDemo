//
//  GridLayoutView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 02/11/23.
//

import SwiftUI

struct GridLayoutView: View {
    
    @State var gridData = (0...100).map { "\($0)" }
    
    let columns: [GridItem] = [
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    
    var colors:[Color] = [.red,.blue,.gray,.yellow,.green,.cyan,.mint,.pink,.brown,.indigo,.orange,.teal,.purple]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(gridData, id: \.self) { cell in
                    Text(cell)
                        .frame(width: 50,height: 50)
                        .padding()
                        .background(colors.randomElement())
                        .onTapGesture {
                            if let tappedIndex = gridData.firstIndex(of: "\(cell)") {
                                    gridData.remove(at: tappedIndex)
                            }
                        }
                }
            }.padding()
        }
    }
}

struct GridLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        GridLayoutView()
    }
}
