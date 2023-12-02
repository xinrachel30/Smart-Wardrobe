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
private let devEndpoint: String = "http://35.194.86.154/recommendation/50/"




    func fetchPosts(completion: @escaping ([weatherResponse]) -> Void) {
        // 2. Specify the endpoint
        let endpoint = "\(devEndpoint)"

        // 3. Create a decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601 // Only if needed
        // decoder.keyDecodingStrategy = .convertFromSnakeCase // Only if needed

        // 4. Create the request
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [weatherResponse].self, decoder: decoder) { response in
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


    // MARK: - Requests

}
