
import SwiftUI



struct RequestList: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    
                    
                }
                
                
                
                .background(Color("myColor").opacity(0.88))
                .foregroundColor(.white)
                .bold()
                .navigationBarTitle("Kan Talepleri")
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

struct RequestList_Previews: PreviewProvider {
    static var previews: some View {
        RequestList()
    }
}






