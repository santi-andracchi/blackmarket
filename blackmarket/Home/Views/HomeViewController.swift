import UIKit

class HomeViewController: UIViewController, ActivityIndicatorPresenter {
  
  // MARK: - Outlets
  
  private lazy var welcomeLabel = UILabel.titleLabel(
    text: "homescreen_title".localized
  )
  
  private lazy var getProfileButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("homescreen_get_profile_button_title".localized, for: .normal)
    button.setTitleColor(.blue, for: .normal)
    button.addTarget(
      self,
      action: #selector(tapOnGetMyProfile),
      for: .touchUpInside
    )
    
    return button
  }()
  
  let activityIndicator = UIActivityIndicatorView()
  
  private var viewModel: HomeViewModel
  
  init(viewModel: HomeViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle Events
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.delegate = self
    configureViews()
  }
  
  // MARK: - Actions
  
  @objc
  func tapOnGetMyProfile(_ sender: Any) async {
    await viewModel.loadUserProfile()
  }
}

private extension HomeViewController {
  
  private func configureViews() {
    applyDefaultUIConfigs()
    view.addSubviews(
      subviews: [welcomeLabel, getProfileButton]
    )
    activateConstraints()
  }
  
  private func activateConstraints() {
    welcomeLabel.centerHorizontally(with: view)
    getProfileButton.center(view)
    
    NSLayoutConstraint.activate([
      welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: UI.ViewController.topMargin)
    ])
  }
  
}

extension HomeViewController: HomeViewModelDelegate {
  func didUpdateState(to state: HomeViewModelState) {
    switch state {
    case .network(let networkStatus):
      networkStatusChanged(to: networkStatus)
    case .loadedProfile:
      showActivityIndicator(false)
      showMessage(title: "My Profile", message: "email: \(viewModel.userEmail ?? "")")
    case .loggedOut:
      showActivityIndicator(false)
      AppNavigator.shared.navigate(
        to: OnboardingRoutes.firstScreen,
        with: .changeRoot
      )
    }
  }
}
