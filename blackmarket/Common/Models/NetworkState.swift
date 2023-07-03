import Foundation

enum NetworkState: Equatable {
  case idle, loading, error(_ error: String)
}
