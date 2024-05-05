import SwiftUI
import Firebase

struct CreateRequest: View {
    
    @State private var isDataSent = false
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    Group {
                        Grids()
                        Divider()
                        Grids1()
                        Divider()
                        Grids2()
                        Divider()
                        Group {
                            Grids3()
                            Divider()
                            Grids4()
                            Divider()
                            Grids5()
                            Divider()
                            Grids6()
                            btnGrid()
                        }
                    }
                    
                }
                .navigationBarTitle("Talep Oluştur")
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
    
    struct CreateRequest_Previews: PreviewProvider {
        static var previews: some View {
            CreateRequest()
        }
    }
    
    struct Grids: View {
        @State private var selectedCountryIndex = 0
        let cities = [
            "İl","Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir",
            "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli",
            "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane",
            "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli",
            "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş",
            "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat",
            "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman",
            "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye",
            "Düzce"
        ]

        var body: some View {
            VStack(alignment: .leading) {
                        Section{
                            Picker("Countries", selection: $selectedCountryIndex) {
                                ForEach(0..<cities.count) { index in
                                    Text(cities[index]).tag(index)

                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            
                        } header: {
                            Text("İhtiyaç Lokasyonu")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity,alignment: .leading)
        }
    }
    
    struct Grids1: View {
        @State private var name = ""
        @State private var number = ""
        
        var body: some View {
            LazyVGrid(columns: [GridItem(.flexible())],alignment: .leading) {
                Section{
                    ForEach(1..<2, id: \.self) { item in
                        TextField("Ad Soyad", text: $name)
                            .overlay(VStack{Divider().background(.red).offset(x: 0, y: 15)})
                            .padding(.bottom)
                        
                        
                        TextField("Telefon Numarası", text: $number)
                            .overlay(VStack{Divider().background(.red).offset(x: 0, y: 15)})
                            .padding(.bottom)
                    }
                } header: {
                    Text("İletişim Bilgileri")
                        .padding(.bottom)
                    
                }
                
            }.padding()
            
        }
    }
    
    struct Grids2: View {
        let bloodGroups = ["A+","A-","B+","B-","AB+","AB-","O+","O-"]
        
        
        var body: some View {
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())],alignment: .leading, spacing: 6) {
                Section{
                    ForEach(bloodGroups, id: \.self) { item in
                        Button(action: {
                            
                            
                            
                            
                            
                        }) {
                            Text(item)
                        }
                        .frame(width:90,height: 40)
                        .foregroundColor(Color("myColor"))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("myColor"),lineWidth:2))
                        
                        
                    }
                } header: {
                    Text("Kan Grubu")
                        .padding(.bottom)
                    
                }
                
            }
            .padding()
        }
    }
    
    struct Grids3: View {
        @State private var count = 0
        
        var body: some View {
            
            VStack(alignment:.leading){
                
                Text("İhtiyaç Miktarı")
                HStack {
                    Button(action: {
                        
                        self.count -= 1
                    }) {
                        Image(systemName: "minus")
                            .padding()
                            .frame(width: 70,height: 50)
                            .foregroundColor(.white)
                            .background(Color("myColor"))
                    }
                    
                    
                    
                    
                    Text("\(count) Ünite")
                        .frame(maxWidth: .infinity,maxHeight:.infinity)
                        .foregroundColor(Color("myColor"))
                        .overlay(RoundedRectangle(cornerSize: .zero).stroke(Color("myColor"),lineWidth:2))
                    
                    
                    
                    Button(action: {
                        self.count += 1
                    }) {
                        Image(systemName: "plus")
                            .padding()
                            .frame(width: 70,height: 50)
                            .foregroundColor(.white)
                            .background(Color("myColor"))
                    }
                }
                .padding()
            }
            .padding()
        }
    }
    
    
    struct Grids4: View {
        let bloodTypes = ["Tam Kan","Taze Kan","Kan Plazması TDP","Trombosit"]
        
        
        var body: some View {
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],alignment: .leading, spacing: 5) {
                Section{
                    ForEach(bloodTypes, id: \.self) { item in
                        Button(action: {
                            
                        }) {
                            Text(item)
                        }
                        .frame(width:180,height: 45)
                        .foregroundColor(Color("myColor"))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("myColor"),lineWidth:2))
                        
                    }
                } header: {
                    Text("Kan Türü")
                        .padding(.bottom)
                    
                }
                
            }.padding()
            
        }
    }
    
    struct Grids5: View {
        let genders = ["Farketmez","Erkek","Kadın"]
        
        
        var body: some View {
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())],alignment: .leading, spacing: 5) {
                Section{
                    ForEach(genders, id: \.self) { item in
                        Button(action: {
                            
                        }) {
                            Text(item)
                        }
                        .frame(width:120,height: 45)
                        .foregroundColor(Color("myColor"))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("myColor"),lineWidth:2))
                        
                    }
                } header: {
                    Text("Cinsiyet")
                        .padding(.bottom)
                    
                    
                }
                
            }.padding()
            
        }
    }
    
    struct Grids6: View {
        let emergencyStatus = ["Acil","İleri Tarihli"]
        
        
        var body: some View {
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],alignment: .leading, spacing: 5) {
                Section{
                    ForEach(emergencyStatus, id: \.self) { item in
                        Button(action: {
                            
                        }) {
                            Text(item)
                        }
                        .frame(width:180,height: 45)
                        .foregroundColor(Color("myColor"))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("myColor"),lineWidth:2))
                        .padding(.bottom)
                        
                        
                        
                    }
                } header: {
                    Text("Aciliyet Durumu")
                        .padding(.bottom)
                    
                    
                }
            }.padding()
            
        }
    }
    
    struct btnGrid: View {
        
        var body: some View {
            Button(action: {
                sendDataToFirestore()
            }) {
                Text("Talep Oluştur")
            }
            .frame(width:400,height: 50)
            .background(Color("myColor"))
            .foregroundColor(.white)
            .cornerRadius(5)
            
        }
        
    }
}

func sendDataToFirestore() {
    let db = Firestore.firestore()
    
    let docData : [String:Any] = ["button1Data": "emre"]
        
    db.collection("buttonContents").document("singleDocument").setData(docData) { error in
            if let error = error {
                print("Error saving data: \(error.localizedDescription)")
            } else {
                print("Data saved successfully")
                
            }
        }
    }













