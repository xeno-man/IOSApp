//
//  ChampionViewModel.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 04/01/2022.
//

import Foundation
class ChampionViewModel : ObservableObject{
    var champs : [Champion]
    
    init(){
        champs = Api().GetAllChamps()
       champs =  champs.sorted(by: {$0.name < $1.name})
        
        
    }
    
    public func getChampionDetail(name : String) -> ChampiondetailModel{
        
        return Api().getChampionByName(name: name)
    }
    
}
