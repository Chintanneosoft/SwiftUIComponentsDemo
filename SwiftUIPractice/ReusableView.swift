//
//  ReusableView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 01/11/23.
//

import SwiftUI

struct ReusableView: View {
    var body: some View {
        VStack{
            Triangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
            Emoji()
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct Emoji: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.yellow)
                .frame(width: 100, height: 100)
                .offset(CGSize(width: 0, height: -20))
            Circle()
                .fill(Color.black)
                .frame(width: 10, height: 10)
                .offset(CGSize(width: -20, height: -30))
            Circle()
                .fill(Color.black)
                .frame(width: 10, height: 10)
                .offset(CGSize(width: 20, height: -30))
            Circle()
                .fill(Color.red)
                .frame(width: 20, height: 20)
                .offset(CGSize(width: 0, height: 0))
        }
    }
}


struct ReusableView_Previews: PreviewProvider {
    static var previews: some View {
        ReusableView()
    }
}


