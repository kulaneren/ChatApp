//
//  ChatAPI.swift
//  ChatAPI
//
//  Created by eren  on 18/11/2023.
//

import Foundation

public protocol ChatServiceProtocol {
    func getChats(completion: @escaping (Result<[Chat], Error>) -> Void)
}

public final class ChatService: ChatServiceProtocol {

    enum APIError: Error {
        case invalidData
        case noDataReturned
        case invalidUrl
    }

    private struct Constants {
        static let baseUrl = "https://file.notion.so/f/f/8db718dd-d6b5-4ce7-b057-c933de3a46a6/26c014cc-3f16-47dd-8438-921e5b1bd543/code_test_data.json"
        static let defaultUrlParams = "?id=8f8c58b4-02d6-4aa1-9480-870afc63a6ea&table=block&spaceId=8db718dd-d6b5-4ce7-b057-c933de3a46a6&expirationTimestamp=1700236800000&signature=scXiIbp9pt9dnq6S17PT3X4KOCmYELBrrqCVRhaD-u8"
    }

    private var urlSession: URLSession

    public init(withURLSession urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    private func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(APIError.invalidUrl))
            return
        }

        let task = urlSession.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(APIError.noDataReturned))
                }
                return
            }

            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

    public func getChats(completion: @escaping (Result<[Chat], Error>) -> Void) {
        let bundle = Bundle(for: ChatService.self)

        guard let url = bundle.url(forResource: "data", withExtension: "json") else {
            completion(.failure(APIError.noDataReturned))
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let chats = try JSONDecoder().decode([Chat].self, from: data)
            completion(.success(chats))
        } catch {
            completion(.failure(APIError.invalidData))
            return
        }

        // No execution because of offline working
//        request(url: url, expecting: [Chat].self, completion: completion)
    }
}
