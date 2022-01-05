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
    
    init() {
        //AllChamps = try! await Api().GetChamps()
        
         AllChamps = [Champion]()
        /*AllChamps.append(Champion(id: 0, name: "Azir" )
        AllChamps.append(Champion(id: 1, name: "Lulu"))
       AllChamps.append(Champion(id: 2, name: "Ahri"))
        AllChamps.append(Champion(id: 2, name: "Tristana"))
        AllChamps.append(Champion(id: 2, name: "Alistar"))
        AllChamps.append(Champion(id: 2, name: "Zed"))
        AllChamps.append(Champion(id: 2, name: "Viktor"))
        AllChamps.append(Champion(id: 2, name: "Jinx"))*/
        AllChamps = Api().GetAllChamps()
        
        
        
        
        score = 0
            
        }
    
    mutating func  StartGame() -> Void{
            score = 0
          AllChamps.shuffle()
        TimesGuessed = 0
            GameHasStarted = true
            hasEnded = false

    }
    
    
    
    
    mutating func guess(name : String ,  index: Int){
        print(AllChamps[index].name)
        
        if AllChamps[index].name == name{
            score = score + 1
        }
        TimesGuessed += 1
        if( TimesGuessed == 5){
            hasEnded = true
            GameHasStarted = false
        }
        
        
    }
    }





