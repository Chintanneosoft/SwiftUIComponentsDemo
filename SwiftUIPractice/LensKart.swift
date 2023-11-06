//
//  LensKart.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 06/11/23.
//

import SwiftUI
var tabs = ["Glasses","Watched","Shoes","Perfume"]

struct Item: Identifiable{
    var id = UUID().uuidString
    var title: String
    var subtitle: String
    var price: String
    var rating: String
    var image: String
}

var items = [
    Item(title:"Vincent Chase", subtitle: "Black Full Rim", price: "$36", rating: "3.6", image: "Spec1"),
    Item(title:"John Jacobs", subtitle: "Brown Tortoise", price: "$45", rating: "4.9", image: "Spec2"),
    Item(title:"Wood Black", subtitle: "Office Glass", price: "$32", rating: "3.8", image: "Spec3"),
    Item(title:"Vu Abstack", subtitle: "Fashion U", price: "$40", rating: "4.3", image: "Spec4")
]
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
            .padding(.vertical,10)
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
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 20), count: 2),spacing: 25) {
                        ForEach(items) { item in
                            CardView(item: item, animation: animation)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct TabButton: View{
    var title: String
    @Binding var selected: String
    var animation: Namespace.ID
    var body: some View{
        
        Button(action:{
            withAnimation(.spring()){
                selected = title
            }
        }) {
            Text(title)
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(selected == title ? .white : .black)
                .padding(.vertical,10)
                .padding(.horizontal,selected == title ? 10 : 10 )
                .background(
                    ZStack{
                        if selected == title{
                            Color.black
                                .clipShape(Capsule())
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                )
        }
    }
    
}

struct CardView: View{
    
    var item: Item
    var animation: Namespace.ID
    
    var body: some View{
        VStack{
            HStack{
                  Spacer(minLength: 0)
                Text(item.price)
                    .fontWeight(.heavy)
                    .padding(.vertical,5)
                    .padding(.horizontal,10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
            }
            Image(item.image)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .padding()
            Text(item.subtitle)
                .font(.caption)
                .foregroundColor(.gray)
            HStack{
                Button(action: {}) {
                    Image(systemName: "suit.heart")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
                Text(item.rating)
                    .fontWeight(.heavy)

            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
    }
}
struct LensKart_Previews: PreviewProvider {
    static var previews: some View {
        LensKart()
    }
}
