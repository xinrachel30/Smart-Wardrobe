//
//  Networking.swift
//  DressingWithWeather
//
//  Created by Aiden Montesinos on 12/1/23.
//

import Alamofire

class NetworkManager {
    
    /// Shared singleton instance
    static let shared = NetworkManager()
    
    private init() { }
    
    
    
/// Endpoint for dev server
private let devEndpoint: String = "https://chatdev-wuzwgwv35a-ue.a.run.app"


    
    
    func fetchPosts(completion: @escaping ([PostRepresentation]) -> Void) {
        // 2. Specify the endpoint
        let endpoint = "\(devEndpoint)/api/posts/"
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601 // Only if needed
        // decoder.keyDecodingStrategy = .convertFromSnakeCase // Only if needed
        
        // 4. Create the request
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [PostRepresentation].self, decoder: decoder) { response in
            // 5. Handle the response
                switch response.result {
                case .success(let members):
                    print("Successfully fetched \(members.count) members")
                    completion(members)
                case .failure(let error):
                    print("Error in NetworkManager.fetchRoster: \(error.localizedDescription)")
                }
            }
    }
    
    func postPost(message: String, completion: @escaping (PostRepresentation) -> Void) {
        // 2. Specify the endpoint
        let endpoint = "\(devEndpoint)/api/posts/create/"
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601 // Only if needed
        // decoder.keyDecodingStrategy = .convertFromSnakeCase // Only if needed
        
        // 4. Create the request
        
        let params: Parameters = [
            "message": message
        ]
        
    
        AF.request(endpoint, method: .post, parameters: params)
            .validate()
            .responseDecodable(of: PostRepresentation.self, decoder: decoder) { response in
            // 5. Handle the response
                switch response.result {
                case .success(let members):
                    print(message)
                    completion(members)
                case .failure(let error):
                    print("Error in NetworkManager.fetchRoster: \(error.localizedDescription)")
                }
            }
    }
    
    func likePost(postID: String, user: String, completion: @escaping (Bool) -> Void) {
        // 2. Specify the endpoint
        let endpoint = "\(devEndpoint)/api/posts/like/"
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601 // Only if needed
        // decoder.keyDecodingStrategy = .convertFromSnakeCase // Only if needed
        
        // 4. Create the request
        
        let params: Parameters = [
            "post_id":postID,
            "net_id": user
        ]
        
    
        AF.request(endpoint, method: .post, parameters: params)
            .validate()
            .responseDecodable(of: PostRepresentation.self, decoder: decoder) { response in
            // 5. Handle the response
                switch response.result {
                case .success(_):
                    print("\(postID)")
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.fetchRoster: \(error.localizedDescription)")
                    completion(false)
                }
            }
    }

    
    // MARK: - Requests
    
}
