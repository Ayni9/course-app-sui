import SwiftUI

struct MenuView: View {
    let gradientColor = Color(#colorLiteral(red: 0.9139190912, green: 0.9139190912, blue: 0.9139190912, alpha: 1))
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                Text("Keet - обучение завершено на 23 %")
                    .font(.caption)
                
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(.black.opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(.black.opacity(0.1))
                    .cornerRadius(12)
                
                
                MenuRow(title: "Личный кабинет", icon: "gear")
                MenuRow(title: "Счёт", icon: "creditcard")
                MenuRow(title: "Выход", icon: "person.crop.circle")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [gradientColor, .white]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
            .overlay {
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .offset(y: -150)
            }
        }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .light, design: .default))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(.gray)
            
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .frame(width: 120, alignment: .leading)
        }
    }
}
