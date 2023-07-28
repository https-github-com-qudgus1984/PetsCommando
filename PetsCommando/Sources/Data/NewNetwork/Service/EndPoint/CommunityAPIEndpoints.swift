//
//  CommunityAPIEndpoints.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import Foundation

struct CommunityAPIEndpoints {
    
    static func postDailyPost(with requestDTO: RequestDailyPostDTO) -> CommunityRouter<ResponseDailyPostDTO> {
        return CommunityRouter<ResponseDailyPostDTO>.postDailyPost(parameters: DailyPostQuery(title: requestDTO.content, content: requestDTO.content))
    }
    
    static func postEditDailyPost(with requestDTO: RequestUpdateDailyPostDTO) -> CommunityRouter<ResponseUpdateDailyPostDTO> {
        return CommunityRouter<ResponseUpdateDailyPostDTO>.postEditDailyPost(parameters: UpdateDailyPostQuery(title: requestDTO.title, content: requestDTO.content, dailyPostId: requestDTO.dailyPostId))
    }
    
    static func getDailyPost() -> CommunityRouter<[ResponseThumbnailDailyPostDTO]> {
        return CommunityRouter.getThumnailDailyPost
    }
    
    static func getDetailDailyPost(with requestDTO: RequestDetailDailyPostDTO) -> CommunityRouter<ResponseDetailDailyPostDTO> {
        return CommunityRouter<ResponseDetailDailyPostDTO>.getDetailDailyPost(parameters: DetailDailyPostQuery(dailyPostId: requestDTO.dailyPostId))
    }
    
    static func deleteDailyPost(with requestDTO: RequestDetailDailyPostDTO) -> CommunityRouter<ResponseDeletePostDTO> {
        return CommunityRouter<ResponseDeletePostDTO>.deleteDailyPost(parameters: DeleteDailyPostQuery(dailyPostId: requestDTO.dailyPostId))
    }
    
    static func postComment(with requestDTO: RequestCommentPostDTO) -> CommunityRouter<ResponseCommentDTO> {
        return CommunityRouter<ResponseCommentDTO>.postComment(parameters: CommentPostQuery(dailyPostId: requestDTO.dailyPostId, content: requestDTO.content))
    }
    
    static func putComment(with requestDTO: RequestCommentPutDTO) -> CommunityRouter<ResponseCommentDTO> {
        return CommunityRouter<ResponseCommentDTO>.putComment(parameters: CommentPutQuery(dailyPostId: requestDTO.dailyPostId, content: requestDTO.content, commentId: requestDTO.commentId))
    }
    
    static func getComment(with requestDTO: RequestCommentGetDTO) -> CommunityRouter<[ResponseCommentDTO]> {
        return CommunityRouter<[ResponseCommentDTO]>.getComment(parameters: CommentGetQuery(dailyPostId: requestDTO.dailyPostId))
    }
    
    static func deleteComment(with requestDTO: RequestCommentDeleteDTO) -> CommunityRouter<ResponseDeleteCommentDTO> {
        return CommunityRouter<ResponseDeleteCommentDTO>.deleteComment(parameters: CommentDeleteQuery(commentId: requestDTO.commentId))
    }
}
