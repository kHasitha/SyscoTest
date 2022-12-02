//
//  PlanetListItemView.swift
//  SyscoTest
//
//  Created by Kasun Ranasinghe on 2022-12-02.
//

import SwiftUI

struct PlanetListItemView: View {
    @ObservedObject var planetListItemVM : PlanetListItemViewModel
    
    init(_planet:Planet){
        self.planetListItemVM = PlanetListItemViewModel(planet: _planet)
    }
    
    var body: some View {
            HStack(alignment: .center) {
            AsyncImage(url: URL(string: ImageUrl), content: { image in
                        image.resizable()
                    }, placeholder: {
                        ProgressView()
                    }).frame(width: 100,height: 100)
                        .padding(.all, 20)
                    
                    VStack(alignment: .leading) {
                        Text(planetListItemVM.planet.name)
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text(planetListItemVM.planet.climate)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .foregroundColor(.gray)
                    }.padding(.trailing, 20)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color(red: 32/255, green: 36/255, blue: 38/255))
                .modifier(CardModifier())
                .padding(.all, 5)
        
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}

//struct PlanetListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//       /// PlanetListItemView(_planet: Planet(from: <#Decoder#>))
//    }
//}
