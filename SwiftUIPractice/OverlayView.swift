//
//  OverlayView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 23/10/23.
//

import SwiftUI

struct OverlayView: View {
    
    @State private var isLoading = true
    @State private var selectedImage: String?
    @Namespace private var hero
    
    let images: [String] = [
            "pencil",
            "trash",
            "lock.doc",
            "person",
            "figure.run"
        ]
    
    private var starOverlay: some View {
            Image(systemName: "star")
        .foregroundColor(.white)
        .padding([.top, .trailing], 5)
        }
    
    @ViewBuilder private var loadingOverlay: some View {
        ZStack {
           Color(white: 0, opacity: 0.75)
           ProgressView().tint(.white)
       }
        }
    
    var body: some View {
        VStack{
            ZStack {
                LinearGradient(
                    colors: [.orange, .red],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                Text("Zstack")
                    .foregroundColor(.white)
                    .font(.title)
            }.frame(width: 300,height: 200).cornerRadius(20)
            Text("Background")
                .foregroundColor(.white)
                .font(.title)
                .padding(35)
                .background(
                    LinearGradient(
                        colors: [.orange, .red],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                ).cornerRadius(20)
            
            Text("Overlay")
                .foregroundColor(.white)
                .font(.title)
                .padding(35)
                .background(
                    LinearGradient(
                        colors: [.orange, .red],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                ).overlay(starOverlay, alignment: .topTrailing)
                .overlay(loadingOverlay)
                .cornerRadius(20)
            NavigationStack {
                        LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 3)) {
                            ForEach(images, id: \.self) { image in
                                Image(systemName: selectedImage == image ? "" : image)
                                    .resizable()
                                    .scaledToFit()
                                    .background(Material.regular)
                                    .matchedGeometryEffect(id: image, in: hero)
                                    .onTapGesture {
                                        selectedImage = image
                                    }
                            }
                        }
                        .overlay {
                            if let image = selectedImage {
                                Image(systemName: image)
                                    .resizable()
                                    .scaledToFill()
                                    .background(Material.thin)
                                    .matchedGeometryEffect(id: image, in: hero)
                                    .animation(.easeInOut, value: selectedImage)
                                    .onTapGesture {
                                        selectedImage = nil
                                    }
                            }
                        }
                    }
                    .animation(.default, value: selectedImage)
        }
        
    }
    
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView()
    }
}
