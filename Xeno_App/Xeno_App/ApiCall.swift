//
//  ApiCall.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 18/10/2021.
//

import LeagueAPI
import Foundation
import SwiftUI






class Api :  ObservableObject {
    
    
    
    
    
     var champs = [Champion]()
    
    let url = "https://localhost:5001/api/Champ"
    let cUrl = "https://ddragon.leagueoflegends.com/cdn/11.24.1/data/en_US/champion.json"
    
    public func GetApiKey()-> String{
        var keys: NSDictionary?
        var ApiKey  = ""
        
       
        // code gevonden op stackoverflow
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
                keys = NSDictionary(contentsOfFile: path)
        }
        if let dict = keys {
                let apikey = dict["ApiKey"] as? String
                if let key = apikey{
                    ApiKey = key
                }
            }
       return ApiKey
    }
    
    public func GetAllChamps() -> [Champion]{
        var champs = [Champion]()
        let lol = LeagueAPI(APIToken: GetApiKey())
        lol.lolAPI.getAllChampionNames(){ (championnames, error) in
            if let error = error{
                print("error with api token \(error)")
            }
            if let champions = championnames{
                var id : Int = 0
                champions.forEach{ champion in
                   
                    
                    champs.append(Champion(id: id, name: champion))
                    id += 1
                    
                }
            }
            
        }
        return champs
    }
    
    public func getChampionByName(name : String) -> ChampiondetailModel{
        let lol = LeagueAPI(APIToken: GetApiKey())
        var champ : ChampiondetailModel = ChampiondetailModel(id: 0, name: "", title: "", spells: [Spell](), image: "", nrOfSkins: 0)
        lol.lolAPI.getChampionDetails(byName: name){ (champion, errorMsg) in
            if let champion = champion {
                    print("Success!")
               
             
                var spells = [Spell]()
                var counter = 0
                champion.spells.forEach{ spell in
                    spells.append(Spell(id:counter,name: spell.name, image: spell.image.url, description: spell.description))
                    counter += 1
                }
                 counter = 0
                 champ = ChampiondetailModel(id: champion.championId.hashValue, name: champion.name, title: champion.title, spells: spells, image: champion.skins.first?.skinImages.square.url ?? "empty", nrOfSkins: champion.skins.count)
                print(champ)
                
                }
                else {
                    print("Request failed cause: \(errorMsg ?? "No error description")")
                }
        }
        return champ
    }
    
    
    
    public func GetChamps() async throws -> [Champion] {
        
        guard let Url = URL(string: url)
        else{
           
            
            fatalError("wrong url")
            
        }
        
       let request = URLRequest(url:Url)
        
        if #available(iOS 15.0, *) {
            //let session : URLSession(configuration:.default, delegate:APIURLSession)
            let (data, response) = try await URLSession.shared.data(for:request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else{
                fatalError("error in call")
                
            }
            
            let champions = try JSONDecoder().decode([Champion].self, from: data)
            return champions
            
        } else {
            // Fallback on earlier versions
           var AllChamps = [Champion]()
            AllChamps.append(try Champion(id: 0, name: "Azir"))
            AllChamps.append(try Champion(id: 1, name: "Lulu"))
            AllChamps.append(try Champion(id: 2, name: "Ahri"))
            return AllChamps
            
        }
        return self.champs
    }
         func loadData() -> [Champion] {
                 guard let url = URL(string: url) else {
                    fatalError("wrong url")
                 }
             
             
             URLSession.shared.dataTask(with: url) { data, response, error in
                     if let error = error {
                         fatalError("error in api call \(error)")
                     }
                     let champions = try! JSONDecoder().decode([Champion].self, from: data!)
                     print(champions)
                     self.champs = champions
                    
                 }.resume()
             
             return self.champs
    
           
        }
        
        
        
        
    
    


}




