//
//  CommunityRouter.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

enum CommunityRouter<R> {
    case postDailyPost(parameters: DailyPostQuery)
    case postEditDailyPost(parameters: UpdateDailyPostQuery)
    case getThumnailDailyPost
    case getDetailDailyPost(parameters: DetailDailyPostQuery)
    case postComment(parameters: CommentPostQuery)
    case getComment(parameters: CommentGetQuery)
    case putComment(parameters: CommentPutQuery)
}

extension CommunityRouter: NewTargetType {
    
    typealias Response = R
    
    var port: Int {
        return 9090
    }
    
    var scheme: String {
        return "http"
    }
    
    var host: String {
        return APIKey.newURL
    }
    
    var path: String {
        switch self {
            
        case .postDailyPost:
            return "/api/dailyPost"
        case .postEditDailyPost(let parameters):
            return "/api/dailyPost/\(parameters.dailyPostId)/edit"
        case .getThumnailDailyPost:
            return "/noauth/dailyPost"
        case .getDetailDailyPost(let parameters):
            return "/noauth/dailyPost/\(parameters.dailyPostId)"
        case .postComment:
            return "/api/comment"
        case .getComment(let parameters):
            return "/noauth/comment/\(parameters.dailyPostId)"
        case .putComment(let parameters):
            return "/api/comment/\(parameters.dailyPostId)/edit/\(parameters.commentId)"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var parameters: String? {
        return nil
    }
    
    var header: [String : String] {
        switch self {
            
        case .postDailyPost, .postEditDailyPost, .postComment, .putComment:
            guard let token = UserDefaults.standard.string(forKey: UserDefaultKeyCase.accessToken) else { return ["accept" : "application/json" , "Content-Type": "application/json"] }
            return ["accept" : "application/json" , "Content-Type": "application/json", "Authorization": "Bearer \(token)"]
            
        default: return ["accept" : "application/json" , "Content-Type": "application/json"]
        }
    }
    
    var body: Data? {
        switch self {
        case .postDailyPost(let parameters):
            <#code#>
        case .postEditDailyPost(let parameters):
            <#code#>
        case .getThumnailDailyPost:
            <#code#>
        case .getDetailDailyPost(let parameters):
            <#code#>
        case .postComment(let parameters):
            <#code#>
        case .getComment(let parameters):
            <#code#>
        case .putComment(let parameters):
            <#code#>
        }
    }
    
    var httpMethod: NewHTTPMethod {
        switch self {
        case .postDailyPost, .postEditDailyPost, .postComment:
            return .post
        case .getThumnailDailyPost, .getComment, .getDetailDailyPost:
            return .get
        case .putComment:
            return .put
        }
    }
}
