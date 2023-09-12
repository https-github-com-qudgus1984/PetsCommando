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
    case deleteDailyPost(parameters: DeleteDailyPostQuery)
    case postComment(parameters: CommentPostQuery)
    case getComment(parameters: CommentGetQuery)
    case putComment(parameters: CommentPutQuery)
    case deleteComment(parameters: CommentDeleteQuery)
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
            return "/api/dailyPost/"
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
        case .deleteDailyPost(let parameters):
            return "/api/dailyPost/\(parameters.dailyPostId)"
        case .deleteComment(let parameters):
            return "/api/comment/\(parameters.commentId)"
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
            
        case .postEditDailyPost, .postComment, .putComment, .deleteComment, .deleteDailyPost:
            guard let token = UserDefaults.standard.string(forKey: UserDefaultKeyCase.accessToken) else { return ["accept" : "application/json" , "Content-Type": "application/json"] }
            print(token, "token값")
            return ["accept" : "application/json" , "Content-Type": "application/json", "Authorization": "Bearer \(token)"]
        case .postDailyPost:
            guard let token = UserDefaults.standard.string(forKey: UserDefaultKeyCase.accessToken) else { return ["accept" : "application/json" , "Content-Type": "application/json"] }
            print(token, "token값")
            return ["Content-Type": "multipart/form-data", "Authorization": "Bearer \(token)"]
        default: return ["accept" : "application/json" , "Content-Type": "application/json"]
        }
    }
    
    var body: Data? {
        switch self {
        case .postDailyPost(let parameters):

            return nil
        case .postEditDailyPost(let parameters):
            let requestDTO = RequestDailyPostDTO(title: parameters.title, content: parameters.content, photo: "asdf")
            let encoder = JSONEncoder()
            return try? encoder.encode(requestDTO)

        case .getThumnailDailyPost:
            return nil

        case .getDetailDailyPost:
            return nil

        case .postComment(let parameters):
            let requestDTO = RequestCommentPostDTO(dailyPostId: parameters.dailyPostId, content: parameters.content)
            let encoder = JSONEncoder()
            return try? encoder.encode(requestDTO)
            
        case .getComment:
            return nil

        case .putComment(let parameters):
            let requestDTO = RequestCommentPutContentDTO(content: parameters.content)
            let encoder = JSONEncoder()
            return try? encoder.encode(requestDTO)
        case .deleteDailyPost:
            return nil
        case .deleteComment:
            return nil
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
        case .deleteDailyPost, .deleteComment:
            return .delete
        }
    }
}
