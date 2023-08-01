import Foundation

struct App {
  static let domain = Bundle.main.bundleIdentifier ?? ""
  
  static func error(
    domain: ErrorDomain = .generic, code: Int? = nil,
    localizedDescription: String = ""
  ) -> NSError {
    NSError(
      domain: App.domain + "." + domain.rawValue,
      code: code ?? 0,
      userInfo: [NSLocalizedDescriptionKey: localizedDescription]
    )
  }
}

enum ErrorDomain: String {
  case generic = "GenericError"
  case parsing = "ParsingError"
  case network = "NetworkError"
}
