//
//  RunneteraPlayer.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 3/28/20.
//  Copyright © 2020 Antoine Clop. All rights reserved.
//

import Foundation

public class RunneteraPlayer: Decodable {
    
    public var name: String
    public var rank: Int
    public var lp: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case rank = "rank"
        case lp = "lp"
    }
    
    public init(name: String, rank: Int, lp: Int) {
        self.name = name
        self.rank = rank
        self.lp = lp
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.rank = try container.decode(Int.self, forKey: .rank)
        self.lp = try container.decode(Int.self, forKey: .lp)
    }
}
