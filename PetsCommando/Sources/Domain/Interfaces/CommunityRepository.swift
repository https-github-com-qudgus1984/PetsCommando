//
//  CommunityRepository.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/27.
//

import Foundation

protocol CommunityRepository: AnyObject {
    
    func postDailyPost(query: DailyPostQuery) async throws -> DailyPost
    
    func postUpdateDailyPost(query: UpdateDailyPostQuery) async throws -> UpdateDailyPost
    
    func getDailyPost() async throws -> [ThumbnailDailyPost?]
    
    func getDetailDailyPost(query: DetailDailyPostQuery) async throws -> DetailDailyPost
    
    func deleteDailyPost(query: DeleteDailyPostQuery) async throws -> DeleteDailyPost
    
    func postComment(query: CommentPostQuery) async throws -> Comment
    
    func putComment(query: CommentPutQuery) async throws -> Comment
    
    func getComment(query: CommentGetQuery) async throws -> [Comment?]
    
    func deleteComment(query: CommentDeleteQuery) async throws -> CommentDelete
}
