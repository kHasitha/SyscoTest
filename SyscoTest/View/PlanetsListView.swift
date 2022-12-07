//
//  PlanetsListView.swift
//  SyscoTest
//
//  Created by Kasun Ranasinghe on 2022-12-02.
//

import SwiftUI

struct PlanetsListView: View {
    
    @StateObject var planetListVM = PlanetListViewModel()
    
    var body: some View {
        NavigationView{
          ScrollView{
            LazyVStack{
                ForEach(planetListVM.planets,id: \.self){ planet in
                NavigationLink(destination: PlanetDetailView(_planet: planet), label: {
                    VStack ()
                    {
                        PlanetListItemView(_planet:  planet)
                    }
                })
              }
                if planetListVM.loadMore{
                    ProgressView().onAppear {planetListVM.getplanets()}
                }
                
            }
          }.navigationTitle(Text("Planets"))
        }
    }
}

struct PlanetsListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsListView()
    }
}
