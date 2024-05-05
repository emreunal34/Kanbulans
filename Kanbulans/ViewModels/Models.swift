import Foundation

struct OnBoardingItem : Identifiable {
    var id = UUID()
    var title:String
    var headline:String
    var image:String
}

struct MenuItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let btnTitle:String
    let destination:Destination
}

struct Item: Identifiable {
    var id: String { title }
    let title: String
    let description: String
}



