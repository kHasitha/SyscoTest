//
//  PlanetDetailView.swift
//  SyscoTest
//
//  Created by Kasun Ranasinghe on 2022-12-02.
//

import SwiftUI

struct PlanetDetailView: View {
    @ObservedObject var PlanetDetailVM : PlanetDetailViewModel
    
    init(_planet:Planet){
        self.PlanetDetailVM = PlanetDetailViewModel(planet: _planet)
    }
    
    var body: some View {
        
        VStack (alignment: .center){
            HStack(alignment: .center) {
                VStack(alignment: .center) {
                    Text(PlanetDetailVM.planet.name)
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding(.top, 15)
                    HStack(alignment: .center) {
                        AsyncImage(url: URL(string: ImageUrl), content: { image in
                            image.resizable()
                        }, placeholder: {
                            ProgressView()
                        }).padding(20)
                        
                    }
                    Text("Orbital Period -" + PlanetDetailVM.planet.orbitalPeriod)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.gray)
                        .padding(.all,3)
                    Text("Gravity -" + PlanetDetailVM.planet.gravity)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.gray)
                        .padding(.all,3)
                    Spacer()
                }.padding(.all, 10)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color(red: 32/255, green: 36/255, blue: 38/255))
            .modifier(CardModifier())
            .padding(.all, 5)
        }
    }
}

//struct PlanetDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlanetDetailView()
//    }
//}
