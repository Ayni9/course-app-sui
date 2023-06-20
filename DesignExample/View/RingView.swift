import SwiftUI

struct RingView: View {
    var color1 = Color(.red)
    var color2 = Color(.purple)
    var width: CGFloat = 78
    var height: CGFloat = 78
    var percent: CGFloat = 78
    
    @Binding var show: Bool
    
    var body: some View {
        let multiplier = width / 44
        let progress = 1 - (percent / 100)
        ZStack {
            Circle()
                .stroke(.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topTrailing, endPoint: .bottomLeading), style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round , lineJoin: .round))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: .purple.opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true)) 
    }
}
