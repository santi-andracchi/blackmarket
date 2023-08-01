import Foundation

enum ViewModelState: Equatable {
  case loading
  case error(String)
  case idle
}
