//
//  ContentView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 19/10/23.
//

import SwiftUI

enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

struct ContentView: View {
    
    
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination:
                            FormView()
                            .navigationBarTitle(Text("FormView"))
                        ) {
                        Text("Go To Form").foregroundColor(.black)
                        }.navigationBarTitle(Text("All Components"))
                
                NavigationLink(destination:
                        TextView()
                        .navigationBarTitle(Text("TextView"))
                    ) {
                    Text("Go To TextView").foregroundColor(.black)
                    }
                
                NavigationLink(destination:
                        OverlayView()
                        .navigationBarTitle(Text("Overlay View"))
                    ) {
                    Text("Go To Overlay View").foregroundColor(.black)
                    }
                NavigationLink(destination:
                        CardDemoView()
                        .navigationBarTitle(Text("Card View"))
                    ) {
                    Text("Go To Card View").foregroundColor(.black)
                    }
                NavigationLink(destination:
                        OtherViews()
                        .navigationBarTitle(Text("Other Views"))
                    ) {
                    Text("Go To OtherViews").foregroundColor(.black)
                    }
                NavigationLink(destination:
                        OtherViews()
                        .navigationBarTitle(Text("Animation"))
                    ) {
                    Text("Go To Animation").foregroundColor(.black)
                    }
               
            }
        }.ignoresSafeArea()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

