//
//  CommunityUseCase.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/07/28.
//

import Foundation

protocol CommunityUseCase {
    func postDailyPost(query: DailyPostQuery) async throws -> DailyPost
    
    func postUpdateDailyPost(query: UpdateDailyPostQuery) async throws -> UpdateDailyPost
    
    func getDailyPost() async throws -> [ThumbnailDailyPost?]
    
    func getDetailDailyPost(query: DetailDailyPostQuery) async throws -> DetailDailyPost
    
    func deleteDailyPost(query: DeleteDailyPostQuery) async throws -> DeleteDailyPost
    
    func postComment(query: CommentPostQuery) async throws -> Comment
    
    func putComment(query: CommentPutQuery) async throws -> Comment
    
    func getComment(query: CommentGetQuery) async throws -> [Comment?]
    
    func deleteComment(query: CommentDeleteQuery) async throws -> CommentDelete}

enum CommunityUseCaseError: String, Error {
    case excute
}

final class CommunityUseCaseImpl: CommunityUseCase {
    
    private let communityRepository: CommunityRepository
    
    init(communityRepository: CommunityRepository) {
        self.communityRepository = communityRepository
    }
    
    func postDailyPost(query: DailyPostQuery) async throws -> DailyPost {
        do {
            return try await communityRepository.postDailyPost(query: query)
        } catch {
            throw CommunityUseCaseError.excute
        }
    }
    
    func postUpdateDailyPost(query: UpdateDailyPostQuery) async throws -> UpdateDailyPost {
        do {
            return try await communityRepository.postUpdateDailyPost(query: query)
        } catch {
            throw CommunityUseCaseError.excute
        }
    }
    
    func getDailyPost() async throws -> [ThumbnailDailyPost?] {
        do {
            return try await communityRepository.getDailyPost()
        } catch {
            throw CommunityUseCaseError.excute
        }
    }
    
    func getDetailDailyPost(query: DetailDailyPostQuery) async throws -> DetailDailyPost {
        do {
            return try await communityRepository.getDetailDailyPost(query: query)
        } catch {
            throw CommunityUseCaseError.excute
        }
    }
    
    func deleteDailyPost(query: DeleteDailyPostQuery) async throws -> DeleteDailyPost {
        do {
            return try await communityRepository.deleteDailyPost(query: query)
        } catch {
            throw CommunityUseCaseError.excute
        }
    }
    
    func postComment(query: CommentPostQuery) async throws -> Comment {
        do {
            return try await communityRepository.postComment(query: query)
        } catch {
            throw CommunityUseCaseError.excute
        }
    }
    
    func putComment(query: CommentPutQuery) async throws -> Comment {
        do {
            return try await communityRepository.putComment(query: query)
        } catch {
            throw CommunityUseCaseError.excute
        }
    }
    
    func getComment(query: CommentGetQuery) async throws -> [Comment?] {
        do {
            return try await communityRepository.getComment(query: query)
        } catch {
            throw CommunityUseCaseError.excute
        }
    }
    
    func deleteComment(query: CommentDeleteQuery) async throws -> CommentDelete {
        do {
            return try await communityRepository.deleteComment(query: query)
        } catch {
            throw CommunityUseCaseError.excute
        }
    }
}
