//
//  GesturesView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 31/10/23.
//

import SwiftUI

struct GesturesView: View {
    
    @State private var scaleCurrentAmount = 0.0
    @State private var scaleFinaleAmount = 1.0
    
    @State private var rotateCurrentAmount = Angle.zero
    @State private var rotateFinaleAmount = Angle.zero
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    @State private var location: CGPoint = .zero
    
    @State private var circleColor: Color = .cyan
    
    var body: some View {
        
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        VStack{
            Text("On Tap Gesture")
                .padding()
                .onTapGesture {
                    print("On Tap Gesture Tapped")
                }
            
            Text("On Tap Gesture with Count")
                .padding()
                .onTapGesture(count: 2) {
                    print("On Tap Gesture with count Tapped")
                }
            
            Text("On LongPress Gesture with MinimumDuration")
                .padding()
                .onLongPressGesture(minimumDuration: 2) {
                    print("On LongPress Gesture with MinimumDuration Tapped")
                }
            
            Text("On LongPress Gesture with Condition")
                .padding()
                .onLongPressGesture {
                    print("On LongPress Gesture with condition Tapped")
                } onPressingChanged: { inProgress in
                    print("Is in Progress \(inProgress)")
                }
            
            Text("Magnification Gesture")
                .padding()
                .scaleEffect(scaleFinaleAmount + scaleCurrentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged({ amount in
                            scaleCurrentAmount = amount - 1 
                        })
                        .onEnded({ amount in
                            scaleFinaleAmount += scaleCurrentAmount
                            scaleCurrentAmount = 0
                        })
                )
            
            Text("Rotation Gesture")
                .padding()
                .rotationEffect(rotateFinaleAmount + rotateCurrentAmount)
                .gesture(
                    RotationGesture()
                        .onChanged({ angle in
                            rotateCurrentAmount = angle
                        })
                        .onEnded({ angle in
                            rotateFinaleAmount += rotateCurrentAmount
                            rotateCurrentAmount = .zero
                        })
                )
            
            VStack{
                Text("Priority Gesture")
                    .padding()
                    .onTapGesture {
                        print("Text Tapped")
                    }
            }.highPriorityGesture(
                TapGesture()
                    .onEnded{
                        print("Vstack Tapped")
                    }
            )
            
            VStack{
                Text("Simultanous Gesture")
                    .padding()
                    .onTapGesture {
                        print("Text Tapped")
                    }
            }.simultaneousGesture(
                TapGesture()
                    .onEnded{
                        print("Vstack Tapped")
                    }
            )
            
            HStack{
                Circle()
                    .fill(.red)
                //                .frame(width: 100,height: 100)
                    .scaleEffect(isDragging ? 1.5 : 1)
                    .offset(offset)
                    .gesture(combined)
                
                Circle()
                    .fill(self.location.y > 50 ? Color.yellow : Color.green)
                //                .frame(width: 100, height: 100, alignment: .center)
                    .gesture(
                        SpatialTapGesture()
                            .onEnded { event in
                                self.location = event.location
                            })
                
                Circle()
                    .fill(circleColor)
                    .gesture(
                        DragGesture(minimumDistance: 5, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.width < 0 {
                                    // left
                                    circleColor = .blue
                                }
                                
                                if value.translation.width > 0 {
                                    // right
                                    circleColor = .mint
                                }
                                if value.translation.height < 0 {
                                    // up
                                    circleColor = .yellow
                                }
                                
                                if value.translation.height > 0 {
                                    // down
                                    circleColor = .pink
                                }
                            }))
            }
        }
    }
}

struct GesturesView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesView()
    }
}
