import Foundation


struct Response: Codable {
    var code: Int?
    var data: Token?
}

struct Token: Codable {
    var id: String?
    var authToken: String?
    var expiresIn: Int?
}

/*struct User: Codable {
    var email: String?
    var code: Int?
}*/

extension Token {
    func toJSON() -> Data {
        return try! JSONEncoder().encode(self)
    }
    
    func fromJSON(json: Data) -> Token {
        return try! JSONDecoder().decode(Token.self, from: json)
    }
}
