import SwiftUI
import Charts

struct PieChartView: View {

    @State private var data:[(Double, Color)] = [
        (2, .red),
        (3, .orange),
        (4, .yellow),
        (1, .green),
        (5, .blue),
        (4, .indigo),
        (2, .purple)
    ]

    @State private var selectedIndex: Int? = nil
    @State var rotation: Double = 0
        var body: some View {
            VStack{
                Canvas { context, size in
                    let total = data.reduce(0) { $0 + $1.0 }
                    context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
                    context.rotate(by: Angle(degrees: rotation))
                    var startAngle = Angle.zero
                    for (value, color) in data {
                        let angle = Angle(degrees: 360 * (value / total))
                        let endAngle = startAngle + angle
                        let path = Path { p in
                            p.move(to: .zero)
                            p.addArc(center: .zero, radius: min(size.width, size.height) * 0.48, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                            p.closeSubpath()
                        }
                        context.fill(path, with: .color(color))
                        startAngle = endAngle + Angle(degrees: 3)
                    }
                }
                .aspectRatio(1, contentMode: .fit)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 3)) {
                        rotation += 45
                    }
                }
            }
        }
    }


struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}

