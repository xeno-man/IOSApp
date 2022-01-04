//
//  TFTMatchMethod.swift
//  LeagueAPI
//
//  Created by Antoine Clop on 11/6/19.
//  Copyright © 2019 Antoine Clop. All rights reserved.
//

import Foundation

internal class TFTMatchMethod: LeagueMethod {
    
    public enum TFTMatchMethods: CustomStringConvertible {
        case byPuuid(puuid: SummonerPuuid, count: Int?)
        case ById(id: TFTGameId)
        
        public var description: String {
            var methodDescription: String {
                switch self {
                case .byPuuid:
                    return "byPuuid"
                case .ById:
                    return "ById"
                }
            }
            return "\(String(describing: TFTMatchMethods.self))-\(methodDescription)"
        }
    }
    
    private var service: ServiceProxy
    private var method: TFTMatchMethods
    
    public init(method: TFTMatchMethods, region: Region) {
        self.method = method
        self.service = ServiceProxy(for: region)
    }
    
    public func getAccessMethod() -> RESTRequester.AccessMethod {
        return .GET
    }
    
    public func getMethodSignature() -> String {
        return self.method.description
    }
    
    public func getMethodUrl() -> String {
        let entrypoint: String = self.service.worldRegionHostUrl
        let commonPath: String = "https://\(entrypoint)\(MethodPaths.TFTMatch.rawValue)/\(Version.TFT_API)/matches"
        switch self.method {
        case .byPuuid(let puuid, let count):
            return "\(commonPath)/by-puuid/\(puuid)/ids?count=\(count ?? 20)"
        case .ById(let id):
            return "\(commonPath)/\(id)"
        }
    }
    
    func getMethodBody() -> Data? {
        return nil
    }
    
    func getCustomHeaders() -> [String: String] {
        return [:]
    }
    
    func getWarningMessage() -> String? {
        return nil
    }
}
