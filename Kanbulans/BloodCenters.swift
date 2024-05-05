import SwiftUI

struct BloodCenters: View {
    var body: some View {
        NavigationStack{
            VStack{
                
                Text("Kan Merkezleri")
                
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

struct BloodCenters_Previews: PreviewProvider {
    static var previews: some View {
        BloodCenters()
    }
}
