//
//  Animations.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 25/10/23.
//

import SwiftUI

struct Animations: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: isAnimating ? 25 : 5)
                .frame(width: 100, height: 100)
                .foregroundColor(Color.pink)
                .animation(.easeInOut(duration: 1.0))
                .onTapGesture {
                    withAnimation {
                        self.isAnimating.toggle()
                    }
                }
            
            Path { path in
                path.move(to: CGPoint(x: 20, y: 20))
                path.addLine(to: CGPoint(x: 100, y: 20))
                path.addLine(to: CGPoint(x: 60, y: 100))
                path.addLine(to: CGPoint(x: 20, y: 20))
            }
            .stroke(Color.cyan, lineWidth: 3)
            .rotationEffect(Angle(degrees: isAnimating ? 180 : 0))
            .onTapGesture {
                withAnimation {
                    self.isAnimating.toggle()
                }
            }
            .animation(.easeInOut(duration: 1))
//            .animation(.easeIn(duration: 1.0),value: scaleEffect(2.0))
            
            if isAnimating{
                Circle()
                    .fill(.linearGradient(Gradient(colors: [.red, .green, .blue]), startPoint: UnitPoint(x: 0, y: 0.4), endPoint: UnitPoint(x: 1, y: 0.8)
                    ))
                    .frame(width: 100, height: 100)
                    .animation(.easeInOut(duration: 1))
                    .onTapGesture {
                        withAnimation {
                            self.isAnimating.toggle()
                        }
                    }.transition(.opacity)
            }
            
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .opacity(0.6)
                    .frame(width: 200, height: 200)
                    .rotation3DEffect(Angle(degrees: isAnimating ? 0 : 360), axis: (x:50,y:50,z:50))
                    .animation(.easeOut(duration: 1.0))
                
                Path { path in
                    path.move(to: CGPoint(x: 100, y: 0))
                    path.addQuadCurve(to: CGPoint(x: 0, y: 100), control: CGPoint(x: 0, y: 0))
                    path.addQuadCurve(to: CGPoint(x: 100, y: 200), control: CGPoint(x: 0, y: 200))
                    path.addQuadCurve(to: CGPoint(x: 200, y: 100), control: CGPoint(x: 200, y: 200))
                    path.addQuadCurve(to: CGPoint(x: 100, y: 0), control: CGPoint(x: 200, y: 0))
                }
                .fill(Color.red)
                .opacity(0.6)
                .rotationEffect(Angle(degrees: isAnimating ? 0 : 270))
                .onTapGesture {
                    withAnimation {
                        self.isAnimating.toggle()
                    }
                }
                .animation(.easeOut(duration: 1.0))
                
                Path { path in
                    path.move(to: CGPoint(x: 100, y: 0))
                    path.addQuadCurve(to: CGPoint(x: 0, y: 100), control: CGPoint(x: 0, y: 0))
                    path.addQuadCurve(to: CGPoint(x: 100, y: 200), control: CGPoint(x: 0, y: 200))
                    path.addQuadCurve(to: CGPoint(x: 200, y: 100), control: CGPoint(x: 200, y: 200))
                    path.addQuadCurve(to: CGPoint(x: 100, y: 0), control: CGPoint(x: 200, y: 0))
                }
                .fill(Color.green)
                .opacity(0.6)
                .rotationEffect(Angle(degrees: isAnimating ? 180 : 0))
                .onTapGesture {
                    withAnimation {
                        self.isAnimating.toggle()
                    }
                }
                .animation(.easeOut(duration: 1.0))
                
            }
            
            Circle()
                .stroke(Color.yellow, lineWidth: 5)
                .frame(width: 100, height: 100)
                .offset(CGSize(width: 0, height: isAnimating ? 0 : -400))
                .animation(.easeInOut(duration: 1))
                .onTapGesture {
                    withAnimation {
                        self.isAnimating.toggle()
                    }
                }
            
        }
    }
}

struct Animations_Previews: PreviewProvider {
    static var previews: some View {
        Animations()
    }
}
