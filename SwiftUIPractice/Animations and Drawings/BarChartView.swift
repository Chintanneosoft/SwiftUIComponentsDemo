//
//  BarChartView.swift
//  SwiftUIPractice
//
//  Created by Neosoft on 25/10/23.
//

import SwiftUI

struct BarChartView: View {
    @State private var isAnimating = false
    @State private var dataPoints1: [Double] = [50, 80, 30, 60, 90]
    @State private var dataPoints2: [Double] = [80, 60, 70, 40, 100]
    var body: some View {
        VStack {
                    Text("Bar Chart")
                        .font(.title)
                        .onTapGesture {
                            withAnimation {
                                isAnimating.toggle()
                            }
                        }
                    HStack(spacing: 10) {
                        ForEach(0..<(isAnimating ?  dataPoints1.count: dataPoints2.count), id: \.self) { index in
                            BarView(value: (isAnimating ?  dataPoints1[index]: dataPoints2[index]),isAnimating: $isAnimating)
                                .animation(.easeInOut(duration: 3.0))
                        }
                    }
                }
    }
}

struct BarView: View {
    var value: Double
    var maxHeight: Double = 100
    @Binding var isAnimating: Bool
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: 30, height: CGFloat(value) / maxHeight * 200)
                    .foregroundColor(isAnimating ? Color.red : Color.blue)
                Text(String(format: "%.0f", value))
                    .foregroundColor(.white)
                    .padding(5)
                    .padding(.bottom, 5.0)
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
