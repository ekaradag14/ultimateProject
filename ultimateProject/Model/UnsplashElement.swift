// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let unsplash = try? newJSONDecoder().decode(Unsplash.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseUnsplashElement { response in
//     if let unsplashElement = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - UnsplashElement
struct UnsplashElement: Decodable {
    let urls: Urls
//    let user: User
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseUrls { response in
//     if let urls = response.result.value {
//       ...
//     }
//   }

// MARK: - Urls
struct Urls: Decodable {
    let raw, full, regular, small: String
    let thumb: String
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseUser { response in
//     if let user = response.result.value {
//       ...
//     }
//   }

// MARK: - User
//struct User: Decodable {
////    let profileImage: ProfileImage
//    let instagramUsername: String
//
//    enum CodingKeys: String, CodingKey {
////        case profileImage
//        case instagramUsername
//    }
//}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseProfileImage { response in
//     if let profileImage = response.result.value {
//       ...
//     }
//   }

// MARK: - ProfileImage
struct ProfileImage: Decodable {
    let small, medium, large: String
}

typealias Unsplash = [UnsplashElement]

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - Alamofire response handlers


