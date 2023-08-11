import Foundation
import RSSwiftNetworking
import RSSwiftNetworkingAlamofire

class Session: Codable {
  var uid: String?
  var client: String?
  var accessToken: String?
  var refreshToken: String?
  var expiry: Date?
  
  private enum CodingKeys: String, CodingKey {
    case uid
    case client
    case accessToken = "access-token"
    case refreshToken
    case expiry
  }
  
  var isValid: Bool {
    guard
      let uid = uid,
      let token = accessToken,
      let refreshToken = refreshToken
    else {
      return false
    }
    
    return !uid.isEmpty && !token.isEmpty && !refreshToken.isEmpty
  }
  
  init(
    uid: String? = nil, client: String? = nil,
    token: String? = nil, expires: Date? = nil,
    refreshToken: String? = nil
  ) {
    self.uid = uid
    self.client = client
    self.accessToken = token
    self.refreshToken = refreshToken
    self.expiry = expires
  }
  
  init?(headers: [AnyHashable: Any]) {
    guard var stringHeaders = headers as? [String: String] else {
      return nil
    }
    
    stringHeaders.lowercaseKeys()
    
    if let expiryString = stringHeaders[HTTPHeader.expiry.rawValue],
       let expiryNumber = Double(expiryString) {
      expiry = Date(timeIntervalSince1970: expiryNumber)
    }
    uid = stringHeaders[HTTPHeader.uid.rawValue]
    client = stringHeaders[HTTPHeader.client.rawValue]
    accessToken = stringHeaders[HTTPHeader.token.rawValue]
  }
  
  init?(user: User?, accessToken: String, refreshToken: String) {
    if let userSession = user {
      self.uid = String(userSession.id)
    }
    self.accessToken = accessToken
    self.refreshToken = refreshToken
  }
}
