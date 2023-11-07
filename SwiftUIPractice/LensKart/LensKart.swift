//
//  LensKart.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 06/11/23.
//

import SwiftUI

struct LensKart: View {
    
    @State var selected = tabs[0]
    @Namespace var animation
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {}) {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.system(size: 25,weight: .heavy))
                        .foregroundColor(.black)
                }
                Spacer(minLength: 0)
                Button(action: {}) {
                    Image("chintan")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45,height: 45)
                        .cornerRadius(20)
                }
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack{
                    HStack{
                        VStack(alignment: .leading,spacing: 5){
                            Text("Lets")
                                .font(.title)
                            
                            Text("Get Started")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                        .padding()
                        Spacer()
                    }
                    
                    HStack(spacing:0){
                        ForEach(tabs,id:\.self){
                            tab in
                            TabButton(title: tab , selected: $selected, animation: animation)
                            if tabs.last != tab{Spacer(minLength: 0)
                            }
                        }
                    }
                    .padding()
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 20), count: 2),spacing: 15) {
                        ForEach(items) { item in
                            CardView(item: item, animation: animation)
                        }
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
}


struct LensKart_Previews: PreviewProvider {
    static var previews: some View {
        LensKart()
    }
}
