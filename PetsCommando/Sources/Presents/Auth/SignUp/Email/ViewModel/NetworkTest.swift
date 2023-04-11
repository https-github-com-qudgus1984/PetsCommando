//
//  NetworkTest.swift
//  PetsCommando
//
//  Created by 이병현 on 2023/04/11.
//

import Moya
import Foundation

final class testAPI {
    
    // 싱글톤 패턴
    static let shared: testAPI = testAPI()
    
    // MoyaProvider라는 BaseProvider로 Provider를 구현하되, 조건(Target == API)에 따라 다양한 Provider를 생성해 구분된 네트워크 작업을 구현
    private let provider = MoyaProvider<PetsCommandoTarget>()
    
    private init() { }
    // 서버 연결 후 전달 받을 response
    
    func postTest(email: String, completionHandler: @escaping (DuplicationEmailResponseDTO?, Int?, NetworkError?)->Void) {
        
        provider.request(.duplicationEmail(parameters: DuplicationEmailQuery(email: email))) { result  in
            switch result {
            case .success(let response):
                guard let statusCode = response.response?.statusCode else { return }
                print("POST 성공", statusCode)
                print(result)
                let data = try? JSONDecoder().decode(DuplicationEmailResponseDTO.self, from: response.data)
                completionHandler(data, statusCode, nil)
            case .failure(let error):
                guard let statusCode = error.response?.statusCode else { return }
                
                print("POST 실패", error.response?.statusCode)
            }
        }
    }
}
