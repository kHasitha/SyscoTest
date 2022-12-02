//
//  PlanetListViewModel.swift
//  SyscoTest
//
//  Created by Kasun Ranasinghe on 2022-12-02.
//

import Foundation
import Combine



class PlanetListViewModel: ObservableObject {
    
    @Published var planets : [Planet] = []
    @Published var loadMore = true
    var nextAvailableList = ""
    var cacellables = Set<AnyCancellable>()
    
    init() {
        getplanets()
    }
    
    // Loads the list of plannets
    func getplanets(){
        
        guard let url = URL(string: PlannetListUrl) else {return}
        
        // call the API to get the list of planets
        // Normaly I use library(like alamofire) in larger projects
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: PlanetList.self, decoder: JSONDecoder())
            .sink { completion in
            } receiveValue: {  planetsloaded in
                print(planetsloaded)
                self.planets = planetsloaded.results
                if  planetsloaded.next.count > 0 {
                    self.nextAvailableList = planetsloaded.next
                    self.loadMore = true
                }
               
            }.store(in: &cacellables)
        
    }
    
    func getnextPage(){
        guard let url = URL(string: nextAvailableList) else {return}
        // call the API to get the list of planets
        // Normaly I use library(like alamofire) in larger projects
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: PlanetList2.self, decoder: JSONDecoder())
            .sink { completion in
            } receiveValue: {  planetsloaded in
                print(planetsloaded)
                self.planets.append(contentsOf: planetsloaded.results)
                if  planetsloaded.next.count > 0 {
                    self.nextAvailableList = planetsloaded.next
                    self.loadMore = true
                }
            }.store(in: &cacellables)
        
    }
    
    
    
    // Hanndles the http erros and return a genaric error
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard
            let responce = output.response as? HTTPURLResponse,
            responce.statusCode >= 200 && responce.statusCode < 300 else{
            throw URLError(.badServerResponse)
            
            }
        self.loadMore = false
        return output.data
    }

}
