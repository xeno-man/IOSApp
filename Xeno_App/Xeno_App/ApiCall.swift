//
//  ApiCall.swift
//  Xeno_App
//
//  Created by Xeno Mannens on 18/10/2021.
//

import Foundation
import UIKit

struct Champion : Decodable{
    let id = UUID()
    var name : String
    var price : Int
    
    
    
}



class Api : ObservableObject{
    @Published var champs = [Champion]()
    
    func LoadData(completion :@escaping ([Champion]) ->()){
        
        guard let url = URL(string: "https://localhost:5001/api/Champ")
        else{
            print("wrong url")
            
            return
        }
        URLSession.shared.dataTask(with: url){ data,response, error in
            let champions = try! JSONDecoder().decode([Champion].self, from: data!)
            print(champions)
            DispatchQueue.main.async {
                completion(self.champs)
            }
            
        }.resume()
    
    }
}

