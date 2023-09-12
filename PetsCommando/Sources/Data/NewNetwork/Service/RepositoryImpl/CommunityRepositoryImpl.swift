//
//  CommunityRepositoryImpl.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import Foundation

enum CommunitylRepositoryError: Error {
    case request
}

final class CommunityRepositoryImpl: CommunityRepository {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
    func postDailyPost(query: DailyPostQuery) async throws -> DailyPost {
        let requestDTO = RequestDailyPostDTO(title: query.title, content: query.content, photo: query.photo)
        let target = CommunityAPIEndpoints.postDailyPost(with: requestDTO)
        do {
            let data = try await dataTransferService.request(with: target)
            return data.toDomain
        } catch {
            throw CommunitylRepositoryError.request
        }
    }
    
    func postUpdateDailyPost(query: UpdateDailyPostQuery) async throws -> UpdateDailyPost {
        let requestDTO = RequestUpdateDailyPostDTO(title: query.title, content: query.content, dailyPostId: query.dailyPostId)
        let target = CommunityAPIEndpoints.postEditDailyPost(with: requestDTO)
        do {
            let data = try await dataTransferService.request(with: target)
            return data.toDomain
        } catch {
            throw CommunitylRepositoryError.request
        }
    }
    
    func getDailyPost() async throws -> [ThumbnailDailyPost?] {
        let target = CommunityAPIEndpoints.getDailyPost()
        do {
            let data = try await dataTransferService.request(with: target)
            return data.map { $0.toDomain }
        } catch {
            throw CommunitylRepositoryError.request
        }
    }
    
    func getDetailDailyPost(query: DetailDailyPostQuery) async throws -> DetailDailyPost {
        let requestDTO = RequestDetailDailyPostDTO(dailyPostId: query.dailyPostId)
        let target = CommunityAPIEndpoints.getDetailDailyPost(with: requestDTO)
        do {
            let data = try await dataTransferService.request(with: target)
            return data.toDomain
        } catch {
            throw CommunitylRepositoryError.request
        }
    }
    
    func deleteDailyPost(query: DeleteDailyPostQuery) async throws -> DeleteDailyPost {
        let requestDTO = RequestDetailDailyPostDTO(dailyPostId: query.dailyPostId)
        let target = CommunityAPIEndpoints.deleteDailyPost(with: requestDTO)
        do {
            let data = try await dataTransferService.request(with: target)
            return data.toDomain
        } catch {
            throw CommunitylRepositoryError.request
        }
    }
    
    func postComment(query: CommentPostQuery) async throws -> Comment {
        let requestDTO = RequestCommentPostDTO(dailyPostId: query.dailyPostId, content: query.content)
        let target = CommunityAPIEndpoints.postComment(with: requestDTO)
        do {
            let data = try await dataTransferService.request(with: target)
            return data.toDomain
        } catch {
            throw CommunitylRepositoryError.request
        }
    }
    
    func putComment(query: CommentPutQuery) async throws -> Comment {
        let requestDTO = RequestCommentPutDTO(dailyPostId: query.dailyPostId, content: query.content, commentId: query.commentId)
        let target = CommunityAPIEndpoints.putComment(with: requestDTO)
        do {
            let data = try await dataTransferService.request(with: target)
            return data.toDomain
        } catch {
            throw CommunitylRepositoryError.request
        }
    }
    
    func getComment(query: CommentGetQuery) async throws -> [Comment?] {
        let requestDTO = RequestCommentGetDTO(dailyPostId: query.dailyPostId)
        let target = CommunityAPIEndpoints.getComment(with: requestDTO)
        do {
            let data = try await dataTransferService.request(with: target)
            return data.map { $0.toDomain }
        } catch {
            throw CommunitylRepositoryError.request
        }
    }
    
    func deleteComment(query: CommentDeleteQuery) async throws -> CommentDelete {
        let requestDTO = RequestCommentDeleteDTO(commentId: query.commentId)
        let target = CommunityAPIEndpoints.deleteComment(with: requestDTO)
        do {
            let data = try await dataTransferService.request(with: target)
            return data.toDomain
        } catch {
            throw CommunitylRepositoryError.request
        }
    }
}
