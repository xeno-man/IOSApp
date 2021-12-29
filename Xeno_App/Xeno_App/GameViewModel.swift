//
//  GameViewModel.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 07/11/2021.
//

import Foundation

class GameViewModel : ObservableObject{
    @Published var model : GameModel
   
    
    init(){
        model = GameModel()
       
    }
    public  func StartGame(){
        model.StartGame()
    }
    
    public func Guess(guessedName : String, index : Int){
        model.guess(name: guessedName, index: index )
        
    }
    
   
    
}
