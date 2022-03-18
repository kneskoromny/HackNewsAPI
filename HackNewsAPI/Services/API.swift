//
//  API.swift
//  HackNewsAPI
//
//  Created by Кирилл Нескоромный on 18.03.2022.
//

import Foundation
import Moya

enum API {
    case frontPage
    case search(query: String)
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: K.API.base) else { fatalError() }
        return url
    }
    
    var path: String {
        return K.API.path
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .frontPage:
            return .requestParameters(parameters: [
                "tags": K.API.QueryValue.frontPage
            ], encoding: URLEncoding.queryString)
        case .search(let query):
            return .requestParameters(parameters: [
                "query": query, "tags": K.API.QueryValue.story
            ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
