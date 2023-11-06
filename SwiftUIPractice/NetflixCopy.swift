//
//  NetflixCopy.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 03/11/23.
//

import SwiftUI

struct NetflixCopy: View {
    
    var portraitImgs = ["gotp","breakingbadp","wednesdayp","prisonbreakp"]
    var landscapeImgs = ["gotl","breakingbadl","wednesdayl","prisonbreakl"]
    var landscapeNames = ["gotl":"Game of Thrones","breakingbadl":"Breaking Bad","wednesdayl":"Wednesday","prisonbreakl":"Prison Break"]
    var portraitNames = ["gotp":"Game of Thrones","breakingbadp":"Breaking Bad","wednesdayp":"Wednesday","prisonbreakp":"Prison Break"]
    
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
