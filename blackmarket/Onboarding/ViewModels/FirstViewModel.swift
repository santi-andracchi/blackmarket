import Foundation

class FirstViewModel {
  
  var state: AuthViewModelState = .network(state: .idle) {
    didSet {
      delegate?.didUpdateState(to: state)
    }
  }

  weak var delegate: AuthViewModelStateDelegate?
  
}
