//
//  LogInSuccess.swift
//  BlackMarket
//
//  Created by Santiago Andracchi on 11/08/2023.
//

import Foundation

struct LogInSuccess: Codable {
  var access_token: String
  var refresh_token: String
  var user: User
}
