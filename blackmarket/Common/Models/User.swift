import Foundation

struct User: Codable {
  var id: Int
  var name: String?
  var nickname: String?
  var birth_date: String?
  var email: String?
  var profile_picture: String?
  
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case nickname
    case email
    case profile_picture
  }
}

struct UserData: Codable {
  var data: User
  
  private enum CodingKeys: String, CodingKey {
    case data
  }
}
