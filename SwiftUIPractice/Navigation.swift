//
//  Navigation.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 02/11/23.
//

import SwiftUI

struct Navigation: View {
    
    @State var score = 0
    @State var selection: String? = nil
    @State var isPresented = false
    @State private var fullScreen = true
    
    var body: some View {
        NavigationView{
            VStack{
               Text("Score: \(score)")
                    .navigationBarItems(
                        leading:
                            Button("-", action: {
                                score -= 1
                            }).padding(),
                        trailing:
                            Button("+", action: {
                                score += 1
                            }).padding()
                    ).padding()
                HStack{
                    NavigationLink {
                        VStack{
                            Text("Reset")
                                .padding()
                                .onTapGesture {
                                    score = 0
                                    isPresented.toggle()
                                }
                                .sheet(isPresented: $isPresented) {
                                    Text("Score Updated")
                                }
                        }
                    } label: {
                        Text("Reset Page")
                            .padding()
                    }
                    
                    NavigationLink {
                        VStack{
                            Text("Set 1000000000")
                                .padding()
                                .onTapGesture {
                                    score += 1000000000
                                    isPresented.toggle()
                                }
                                .sheet(isPresented: $isPresented) {
                                    Text("Score Updated")
                                }
                        }
                    } label: {
                        Text("Set Page")
                            .padding()
                    }.navigationBarHidden(false)
                    
                }
                .statusBar(hidden: true)
            }
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
