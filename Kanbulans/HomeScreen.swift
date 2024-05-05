import SwiftUI

struct HomeScreen: View {
    
    let items = [
        MenuItem(imageName: "blood-type",title: "Kan Bağışı", btnTitle:"Bilgi Al",destination:.bloodDemand),
        MenuItem(imageName: "blood-cells", title: "Talep Oluştur",btnTitle:"İstek Oluştur",destination: .donation),
        MenuItem(imageName: "health-report", title: "Kan Talepleri",btnTitle:"Listele",destination: .bloodList),
        MenuItem(imageName: "blood-bank", title: "Kan Merkezleri",btnTitle:"Listele",destination: .bloodCenters)
    ]
    
    
    let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 2)
    
    var body: some View {
        ZStack{
//            Color("myColor").opacity(0.25)
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: columns,spacing: 10) {
                        ForEach(items) { item in
                            VStack(spacing: 20) {
                                Image(item.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80,height: 60)
                                Text(item.title)
                                
                                NavigationLink(destination: destinationView(for: item.destination)) {
                                    
                                label: do {
                                    Text(item.btnTitle)
                                        .frame(width: 105,height: 40)
                                        .padding([.leading,.trailing],10)
                                    
                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white,lineWidth:1.3))
                                        .foregroundColor(.white)
                                        .bold()
                                }
                                }
                                
                            }
                            .padding(.vertical,25)
                            .frame(maxWidth:.infinity)
                            .background(Color("myColor").opacity(0.88))
                            .foregroundColor(.white)
                            .bold()
                        }
                        
                    }
                    .padding()
                }
                
                .navigationBarTitle("Anasayfa").foregroundColor(.white)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbarBackground(Color("myColor"), for: .navigationBar).opacity(0.85)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
            }
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

enum Destination {
    case donation
    case bloodDemand
    case bloodList
    case bloodCenters
}

func destinationView(for destination: Destination) -> some View {
    
        switch destination {
        case .bloodDemand:
            return AnyView(DonateInfo(item: Item(title: "", description: "")))
        case .donation:
           return AnyView(CreateRequest())
        case .bloodList:
            return AnyView(RequestList())
        case .bloodCenters:
            return AnyView(BloodCenters())
        }
    }


