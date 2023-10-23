//
//  SwiftUIView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 23/10/23.
//

import SwiftUI

struct CardDemoView: View {

        var body: some View {
            VStack{
            HStack {
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.red)
                    .scaledToFit()
                    .padding()
                    .clipShape(Circle())
                    .frame(width: 100)
                    .overlay(Circle()
                        .stroke(Color.white, lineWidth: 3))

                    .padding()
                
                VStack() {
                    Text("Round Heart")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("Gol Dil ")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    HStack{
                        Image(systemName: "star.fill").foregroundColor(.white)
                        Text("Sitara")
                            .font(.subheadline)
                            .foregroundColor(Color.white)
                            .bold()
                            .italic()                    }
                }.padding()
                
            }.frame(width: 380, height: 200)
                .background(
                LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
                .cornerRadius(8)
                
            
            Spacer()
                .frame(height: 50)

        }
        
            
        }

    }

struct CardDemoView_Previews: PreviewProvider {
    static var previews: some View {
        CardDemoView()
    }
}
