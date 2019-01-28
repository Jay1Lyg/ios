//
//  NetworkTarget.swift
//  qiaojie
//
//  Created by will-design-1 on 2019/1/15.
//  Copyright © 2019年 will-design-1. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON
enum NetworkTarget {
    case shareCouse
    case playlist(code:String) //获取歌曲
    
}
extension NetworkTarget: TargetType {
    var baseURL: URL {
        return URL(string: "http://main.wewillpro.cn")!
    }
    
    var path: String {
        switch self {
        case .playlist:
            return "/share/course"
        case .shareCouse:
            return "/movie/movies.today?key=bf1ab109ce9a9c7442dd1286ba0405ba&cityid=3"
        default:
             return "/share/course"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    //请求任务
    var task: Task {
       
        switch self {
        case .playlist(let code):
//            var params: [String: Any] = [:]
//            params["code"] = code
            
           print(parameters)
            return .requestParameters(parameters: parameters!,encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
//      return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var parameters:[String:Any]? {
        switch self {
        case .playlist(let code):
            return (["code": code])
        default:
            return (["code": ""])
        }
    }
    
    
}


