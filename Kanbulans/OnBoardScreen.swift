import SwiftUI

struct IntroScreen: View {
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .frame(width: 160,height: 150)
                .aspectRatio(contentMode: .fit)
                .padding()
            
            Text(title)
                .font(.title)
                .bold()
                .padding()
            
            Text(description)
                .font(.body)
                .foregroundColor(Color(uiColor: .darkGray))
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct OnBoardScreen: View {
    
    let introScreens = [
        IntroScreen(image: "onboard", title: "Kan Talebi Oluştur", description: "Kan talebi oluşturarak kan ihtiyacınıza hızlı bir şekilde ulaşabilirsiniz."),
        IntroScreen(image: "medical-center", title: "Kan Merkezleri", description: "Harita üzerinden konumunuza yakın kan merkezlerini bulabilirsiniz."),
        IntroScreen(image: "onboard", title: "Giriş Yap", description: "Butona tıklayıp uygulamaya giriş yapabilirsiniz.")
    ]
    
    @State private var currentPage = 0
    
    var body: some View {
        NavigationStack {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<3) { index in
                    introScreens[index]
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
            NavigationLink(destination: HomeScreen()) {
            Button(action: {
                withAnimation {
                    if currentPage < introScreens.count - 1 {
                        currentPage += 1
                    }
                }
            }) {
                Text(currentPage == introScreens.count - 1 ? "Giriş Yap" : "İleri")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color("myColor"))
                    .cornerRadius(8)
                    .padding()
            }
            .disabled(currentPage == introScreens.count - 1)
                }
            }
        }
    }
}

struct OnBoardScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardScreen()
    }
}

