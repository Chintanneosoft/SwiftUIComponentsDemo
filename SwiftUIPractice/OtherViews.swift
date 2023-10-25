//
//  OtherViews.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 25/10/23.
//

import SwiftUI

struct OtherViews: View {
    
    @State private var selectedFlavor: Flavor = .chocolate
    @State var selectedDate = Date()
    @State var quantity: Int = 0
    @State var isError: Bool = false
    @State var isSheet: Bool = false
    
    var rows: [GridItem] =
            Array(repeating: .init(.fixed(20)), count: 2)
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        return min...max
    }
    
    var modal: some View {
        Text("Modal")
    }
    
    var actionSheet: ActionSheet {
        ActionSheet(title: Text("Action"),
                    message: Text("Description"),
                    buttons: [
                        .default(Text("OK"), action: {
                            
                        }),
                        .destructive(Text("Delete"), action: {
                            
                        })
                    ]
        )
    }
    var body: some View {
        List {
            Picker("Flavor", selection: $selectedFlavor) {
                Text("Chocolate").tag(Flavor.chocolate)
                Text("Vanilla").tag(Flavor.vanilla)
                Text("Strawberry").tag(Flavor.strawberry)
            }
            
            DatePicker(
                selection: $selectedDate,
                in: dateClosedRange,
                displayedComponents: [.hourAndMinute, .date],
                label: { Text("Due Date") }
            )
            
            Stepper(value: $quantity, in: 0...10, label: { Text("Quantity \(quantity)")})
            
            HStack (alignment: .center, spacing: 20){
                Text("Hello")
                Divider()
                Text("World")
            }.frame(maxWidth:.infinity)
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center, spacing: 20) {
                    ForEach(1...20, id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            
            ZStack {
                Text("World")
                    .padding(20)
                    .background(Color.red)
                    .offset(x: 0, y: 30)
                Text("Hello")
                    .padding(10)
                    .background(Color.blue)
                    .opacity(0.8)
                
            }.frame(maxWidth:.infinity)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, alignment: .top) {
                    ForEach((0...100), id: \.self) {
                        Text("\($0)")
                    }
                }
            }
            
            TabView {
                Text("First View")
                    .font(.title)
                    .tabItem({ Text("First") })
                    .tag(0)
                Text("Second View")
                    .font(.title)
                    .tabItem({ Text("Second") })
                    .tag(1)
            }
            
            TabView {
                Text("1")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.pink)
                Text("2")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red)
                Text("3")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green)
                Text("4")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
            }.tabViewStyle(PageTabViewStyle())
            
            Button("Alert") {
                self.isError = true
            }.alert(isPresented: $isError, content: {
                Alert(title: Text("Alert"), message: Text("Alert Message"), dismissButton: .default(Text("OK")))
            }).frame(maxWidth: .infinity)
            
            
        }
    }
}

struct OtherViews_Previews: PreviewProvider {
    static var previews: some View {
        OtherViews()
    }
}
