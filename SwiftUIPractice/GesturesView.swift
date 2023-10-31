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
            
            Circle()
                .fill(.blue)
                .frame(width: 100,height: 100)
                .scaleEffect(isDragging ? 1.5 : 1)
                .offset(offset)
                .gesture(combined)
        }
    }
}

struct GesturesView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesView()
    }
}
