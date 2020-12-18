//
//  zaraHomepuffersService.swift
//  ZARA
//
//  Created by 송황호 on 2020/12/19.
//

import Foundation
import Alamofire

struct zaraHomepuffersService {
    static let share = zaraHomepuffersService()
    
    func zaraHomePuffersget(completion : @escaping (NetworkResult<Any>) -> ()) {
        
        let url = APIConstants.puffersURL
        let header : HTTPHeaders = [ "Content-Type" : "application/json"]
        
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData{ (response) in
            switch response.result{
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                completion(homePuffersgetData(status: statusCode, data: data))
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
    private func homePuffersgetData(status: Int, data : Data) -> NetworkResult<Any>{
        let decoder  = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<[ZaraInformation]>.self, from: data) else {
            return .pathErr
        }
        print("성공?")
        switch status {
        case 200:
            print("너는 뭐야아아아 \(decodedData)")
            return .success(decodedData)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
