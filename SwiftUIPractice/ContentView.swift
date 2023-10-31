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
    
    var views: [(AnyView, String)] = [
        (AnyView(TextView()), "TextView"),
        (AnyView(OverlayView()), "OverlayView"),
        (AnyView(CardDemoView()), "CardDemoView"),
        (AnyView(OtherViews()), "OtherViews"),
        (AnyView(Animations()), "Animations"),
        (AnyView(BarChartView()), "BarChartView"),
        (AnyView(PieChartView()), "PieChartView"),
        (AnyView(UIKitInSwiftUI()), "UIKitInSwiftUI"),
        (AnyView(StateView(text: "")), "State Binding"),
        (AnyView(PublishedView()), "Published ObservedObject"),
        (AnyView(GesturesView()), "Gestures View")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(views, id: \.1) { viewData in
                    CellView(navView: viewData.0, navText: viewData.1)
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


struct CellView: View {
    var navView: AnyView
    var navText: String
    var body: some View {
        NavigationLink(destination:
                        navView
            .navigationBarTitle(Text(navText))
        ) {
            Text("Go To \(navText)").foregroundColor(.black)
        }.navigationTitle("Demo Components")
    }
}
