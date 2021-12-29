//
//  ContentView.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 28/09/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var Game : GameViewModel
  
    
    
    
    init(model : GameViewModel) {
        self.Game = model
    }
    	
    var body: some View {
       
        
            
            NavigationView{
               
                ZStack{
                    if #available(iOS 15.0, *) {
                        LinearGradient(gradient: Gradient(colors: [.pink,.yellow,.brown]), startPoint: .top, endPoint:.bottom).ignoresSafeArea()
                    } else {
                        LinearGradient(gradient: Gradient(colors: [.pink,.yellow]), startPoint: .top, endPoint:.bottom).ignoresSafeArea()
                    }
                VStack{
                    Text("Welcome to my game").font(.title)
                    /*NavigationLink(destination: ChampionNavView(champs: Game.model.AllChamps) ){
                    Text("Check out all the Champions")
                        .padding()
                        .foregroundColor(.black)
                        .font(.title)
                        .background(Color.red)
                        .cornerRadius(50)
                }.padding()*/
                
                    NavigationLink(destination: {gameView(game: .init())} ){
                    Text("Play the game")
                                .padding()
                                .foregroundColor(.black)
                                .font(.title)
                                .background(Color.red)
                                .cornerRadius(50)
                            
                            
                        }
                      
                        
                    }.navigationTitle("League Guesser")
                        .navigationViewStyle(.automatic)
                                                                       
                }
                }
                }
            }
        
        
        
        
            
    


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        
        return ContentView(model: GameViewModel())
        
    }
}


