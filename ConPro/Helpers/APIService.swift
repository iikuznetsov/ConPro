import Moya
import Foundation
import Alamofire
var provider: MoyaProvider<APIService>!

enum APIService {
    case register(email: String, password: String)
    case login(email: String, password: String)
}

extension APIService: TargetType {
    
    var baseURL: URL { return URL(string: "http://api.beheltcarrot.ru")! }
    var path: String {
        switch self {
        case .register(email: _, password: _):
            return "/account/Register"
        case .login(email: _, password: _):
            return "/account/GetToken"
        }
    }
    var method: Moya.Method {
        switch self {
        case .login, .register:
            return .post
        }
    }
    var task: Task {
        switch self {
        case .login(let email, let password), .register(let email, let password):
            return .requestCompositeParameters(bodyParameters:  ["email": email, "password": password], bodyEncoding: JSONEncoding.default, urlParameters: [:])
        }
    }
    
    var sampleData: Data {
        switch self {
        case .login(let email, let password), .register(let email, let password):
            return "{\"email\": \(email), \"password\": \(password)}".utf8Encoded
        }
    }

    var headers: [String: String]? {
        switch self {
        default:
            return ["Content-type": "application/json"]
        }
    }
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

