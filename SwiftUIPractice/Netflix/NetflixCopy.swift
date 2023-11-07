//
//  NetflixCopy.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 03/11/23.
//

import SwiftUI

struct NetflixCopy: View {
    var body: some View {
        List{
            HStack(alignment: .center){
                Image("NetflixProfile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100,height: 100)
                    .cornerRadius(10)
            }
            .padding(.top)
            .frame(maxWidth: .infinity)
            .listRowBackground(Color.white.opacity(0))
            
            ImageCell(imgs: portraitImgs, names: portraitNames, sectionName: "TV Shows & Movies")
            
            ImageCell(imgs: landscapeImgs, names: landscapeNames, sectionName: "Trending Now")
            
            ImageCell(imgs: portraitImgs, names: portraitNames, sectionName: "My List")
            
            ImageCell(imgs: landscapeImgs, names: landscapeNames, sectionName: "Recommended for You")
        }
        .listStyle(PlainListStyle())
        .scrollContentBackground(.hidden)
        .background(.black)
        .navigationBarTitle("Netflix", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image("NetflixLogo")
            }
        }
        .toolbarBackground(.black, for: .navigationBar)
    }
}

struct NetflixCopy_Previews: PreviewProvider {
    static var previews: some View {
        NetflixCopy()
    }
}
