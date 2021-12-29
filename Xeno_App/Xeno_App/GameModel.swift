//
//  GameModel.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 07/11/2021.
//

import Foundation

struct GameModel{
    var AllChamps : [Champion]
    //var GameChamps : ArraySlice<Champion>.SubSequence
    var hasEnded : Bool = false
    
    var TimesGuessed : Int = 0
    
    
    var score :Int = 0
    var GameHasStarted = false
    
    init(){
       AllChamps = [Champion]()
        AllChamps.append(Champion(id: 0, name: "Azir", price: 2))
        AllChamps.append(Champion(id: 1, name: "Lulu", price: 2))
       AllChamps.append(Champion(id: 2, name: "Ahri", price: 2))
        StartGame()
        
        score = 0
            
        }
    
    mutating func  StartGame()-> Void{
      
       
            score = 0
            AllChamps.shuffle()
            GameHasStarted = true
            hasEnded = false
        
        
        

    }
    
    
    mutating func guess(name : String ,  index: Int){
        print(AllChamps[index].name)
        
        if AllChamps[index].name == name{
            score = score + 1
        }
        TimesGuessed += 1
        if( TimesGuessed == AllChamps.count){
            hasEnded = true
            GameHasStarted = false
        }
        
        
    }
    }




struct Champion : Decodable , Identifiable{
    let Id = UUID()
    var id : Int
    var name : String
    var price : Int
    
    
    
    
}
