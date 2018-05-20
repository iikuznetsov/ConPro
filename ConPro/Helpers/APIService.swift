import Moya
import Foundation
import Alamofire
var provider: MoyaProvider<APIService>!

enum APIService {
    case register(email: String, password: String)
    case login(email: String, password: String)
    case getUser
}

extension APIService: TargetType, AccessTokenAuthorizable {
    
    var baseURL: URL { return URL(string: "http://api.beheltcarrot.ru")! }
    var path: String {
        switch self {
        case .register(email: _, password: _):
            return "/account/Register"
        case .login(email: _, password: _):
            return "/account/GetToken"
        case .getUser:
            return "/account/GetCurrentUser"
        }
    }
    var method: Moya.Method {
        switch self {
        case .login, .register:
            return .post
        case .getUser:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .login(let email, let password), .register(let email, let password):
             return .requestCompositeParameters(bodyParameters: ["email": email, "password": password], bodyEncoding: JSONEncoding.default, urlParameters: [:])
        case .getUser:
            return .requestPlain
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .getUser:
            return .bearer
        case .register(email: _, password: _),.login(email: _, password: _):
            return .none
        }
    }
    var sampleData: Data {
        return Data()
    }

    var headers: [String: String]? {
        switch self {
        default:
            return ["Content-type": "application/json"]
        }
    }
}


