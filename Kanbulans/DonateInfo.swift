import SwiftUI

struct DonateInfo: View {
    let item: Item
    
    @State private var descriptionVisible = false
    
    var body: some View {
        VStack {
            HStack {
                Text(item.title)
                    .bold()
                    .foregroundStyle(.black)
                Spacer()
                
                Button {
                    withAnimation {
                        descriptionVisible.toggle()
                    }
                } label: {
                    if descriptionVisible {
                        Image(systemName: "chevron.up")
                            .foregroundColor(.black)
                    } else {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                    }
                }
            }

            if descriptionVisible {
                Text(item.description)
                    .padding([.top,.bottom])
                
            }
        }
        .padding([.trailing,.leading],20)
        .padding([.top,.bottom,],10)
        
        
        
    }
}

struct DonateInfo_Previews: PreviewProvider {
    static var previews: some View {
        let items = [
            Item(title: "Kimler Kan Bağışlayabilir?", description: "18-65 yaş aralığında 50 kilogramın üzerindeki her sağlıklı birey kan bağışçısı adayı olabilir. (19 yaşından gün almak, 65'ini doldurmamak gerekir.) İlk kez kan bağışında bulunacaklar için üst yaş sınırı: 61 yaşından gün almamış olmalı."),
            
            Item(title: "Ne Kadar Sıklıkta Kan Bağışlayabilirim?", description: "Tam kan bağışında; Erkekler 90 günde bir, Kadınlar 120 gün de bir kan bağışında bulunabilirler."),
            
            Item(title: "İlaç Kullananlar Kan Bağışı Yapabilir mi?", description: "Farklı şartlar altında bu sorunun cevabı değişir. Kan bağışı süreci Sağlık Bakanlığı tarafından yayınlanan rehber doğrultusunda gerçekleşmektedir. Her ilacın kullanım nedeni ve şekli için farklı karar verilir."),
            
            Item(title: "Kan Vermenin Sağlığa Yararı Var mıdır?", description: "Kan bağışının insan sağlığına tıbbi olarak kanıtlanmış yararı ya da zararı bulunmamaktadır. Bağışlanan 1 ünite kan bağışı ile 3 farklı ihtiyaç sahibinin tedavisine katkıda bulunur."),
            
            Item(title: "Kan Bağışı Ne Kadar Sürer?", description: "Yaklaşık 30-35 dakika. Süre boyunca zamanımızın çoğunu kayıt işlemleri, doktor muayenesi, kan bağışı ve ikram işlemleri almaktadır."),
            
            Item(title: "Kan Vermenin Yan Etkisi Var mı?", description: "Kan bağışı basit bir işlemdir. Sıvı kaybına bağlı hafif veya geçici süreli etki yaşanabilir."),
        ]
        
        return NavigationStack {
            ScrollView{
                VStack{
                    Image("bloodtransfer")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120,height: 120)
                        .padding([.top,.bottom],80)
                    ForEach(items) { item in
                        DonateInfo(item: item)
                    }
                }
                .navigationBarTitle("Sıkça Sorulan Sorular")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination:HomeScreen()) {
                                                Image(systemName: "chevron.left")
                                    }
                    }
            }
                                    
                .toolbarBackground(Color("myColor"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
            }
            }
    }
}

