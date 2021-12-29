//
//  gameView.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 27/10/2021.
//

import SwiftUI

struct gameView: View {
    @StateObject  var game : GameViewModel
  
    @State var counter = 0
    @State private var guess : String = ""
    var ShowGame : Double = 1
    var ShowScore : Double = 0
    
   
  
    func StartGame(){
        game.StartGame()
    }
    
     func nextChamp(){
        
        counter = counter + 1
        
    }
   

    
    var body: some View {
        if !game.model.hasEnded{
            GuessView
            
        }else{
            ScoreView(score: game.model.score)
        }
        
        
    }
    
    var GuessView : some View{
        VStack{
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: "https://ddragon.leagueoflegends.com/cdn/img/champion/splash/\(game.model.AllChamps[counter].name)_0.jpg"),scale: 2){ image in // deels info gehaald van https://blckbirds.com/post/how-to-use-asyncimage-in-swiftui/
                    
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    ProgressView()
                                  .progressViewStyle(.circular)
                }.frame( height:300 )
                    
            } else {
                // Fallback on earlier versions
                
            }
            if #available(iOS 15.0, *) {
                
               
                
                TextField("guess the champion name",text: $guess)
                    .padding()
                    .frame(width: 300, height: 50)
                    .border(.black)
                
                .onSubmit {
                    print(guess)
                    game.Guess(guessedName: guess, index: counter)
                    print(game.model.score)
                    nextChamp()
                    guess = ""
                }
            } else {
                // Fallback on earlier versions
            }
            
            
        }
    }
    
    
    
    
}

struct ScoreView : View{
    private(set) var score : Int
    
    var body: some View {
        ZStack{
            SetBackGroundColor()
            Text("your score is \(score)/5").font(.title)
            
        }.ignoresSafeArea()
       
        
    }
    
    func SetBackGroundColor()-> Color{
        if score > 3 {
            return Color.green
        }else{
            return Color.red
        }
    }
}







