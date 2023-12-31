import UIKit

class FirstViewController: UIViewController,
                           AuthViewModelStateDelegate,
                           ActivityIndicatorPresenter {
  
  // MARK: - Views
  
  private lazy var titleLabel = UILabel.titleLabel(
    text: "firstscreen_title".localized
  )
  
  private lazy var signInButton = UIButton.primaryButton(
    title: "firstscreen_login_button_title".localized,
    target: self,
    action: #selector(signInTapped)
  )
  
  private lazy var signUpButton = UIButton.primaryButton(
    color: .clear,
    title: "firstscreen_registre_button_title".localized,
    titleColor: .gray,
    target: self,
    action: #selector(signUpTapped)
  )
  
  let activityIndicator = UIActivityIndicatorView()
  
  private let viewModel: FirstViewModel
  
  init(viewModel: FirstViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor(patternImage: UIImage(named: "blackmarket_background_2.png")!)
    viewModel.delegate = self
    configureViews()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  // MARK: View Configuration
  
  private func configureViews() {
    applyDefaultUIConfigs()
    view.addSubviews(
      subviews: [titleLabel, signInButton, signUpButton]
    )
    activateConstraints()
    setupAccessibility()
  }
  
  private func setupAccessibility() {
    signUpButton.accessibilityIdentifier = "GoToSignUpButton"
    signInButton.accessibilityIdentifier = "GoToSignInButton"
  }
  
  private func activateConstraints() {
    signInButton.centerHorizontally(with: view)
    titleLabel.attachHorizontally(to: view)
    signUpButton.attachHorizontally(to: view)
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(
        equalTo: view.topAnchor,
        constant: UI.ViewController.topMargin
      ),
      signInButton.widthAnchor.constraint(greaterThanOrEqualToConstant: UI.Button.width),
      signUpButton.bottomAnchor.constraint(
        equalTo: view.bottomAnchor,
        constant: -UI.Defaults.margin
      ),
      signInButton.bottomAnchor.constraint(
        equalTo: signUpButton.topAnchor,
        constant: -UI.Button.spacing
      )
    ])
    
  }
  
  // MARK: - Actions
  
  @objc
  func signInTapped() {
    AppNavigator.shared.navigate(to: OnboardingRoutes.signIn, with: .push)
  }
  
  @objc
  func signUpTapped() {
    AppNavigator.shared.navigate(to: OnboardingRoutes.signUp, with: .push)
  }
}
