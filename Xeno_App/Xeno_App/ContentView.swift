//
//  ContentView.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 28/09/2021.
//

import SwiftUI

struct ContentView: View {
    var champ : Champion
    var body: some View {
        var shape = RoundedRectangle(cornerRadius: 20).fill().foregroundColor(.white)
       
            
            NavigationView{
               // NavigationLink(destination: ChampionDetail(champ: champ)){ Text("test")
                ZStack{
                    if #available(iOS 15.0, *) {
                        LinearGradient(gradient: Gradient(colors: [.pink,.yellow,.brown]), startPoint: .top, endPoint:.bottom).ignoresSafeArea()
                    } else {
                        LinearGradient(gradient: Gradient(colors: [.pink,.yellow]), startPoint: .top, endPoint:.bottom).ignoresSafeArea()
                    }
                VStack{
                    Text("Welcome to my game").font(.title)
                NavigationLink(destination: ChampionNavView(champs: champ) ){
                    Text("Check out all the Champions")
                        .padding()
                        .foregroundColor(.black)
                        .font(.title)
                        .background(Color.red)
                        .cornerRadius(50)
                }.padding()
                
                NavigationLink(destination: {} ){
                    Button(action:{}){
                        ZStack{
                           
                            
                            Text("Play the game")
                                .padding()
                                .foregroundColor(.black)
                                .font(.title)
                                .background(Color.red)
                                .cornerRadius(50)
                            
                            
                        }
                      
                        
                    }
                }.padding()
                }
                }
            }
        
        }
        
        
            
    }


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        
        return ContentView(
            champ: Champion(id: 1, name: "Aatrox", price: 6300))
        
    }
}


