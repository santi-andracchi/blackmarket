import UIKit

class SignInViewController: UIViewController, ActivityIndicatorPresenter {
  
  // MARK: - Outlets
  
  private lazy var titleLabel = UILabel.titleLabel(text: "signin_title".localized)
  private lazy var logInButton = UIButton.primaryButton(
    color: .disableButton,
    title: "signin_button_title".localized,
    titleColor: .textDisableButton,
    target: self,
    action: #selector(tapOnSignInButton)
  )
  private lazy var signinCardView = UIView()
  private lazy var signupCardView = UIView()
  private lazy var cardImageView = UIImageView()
  private lazy var emailTitleLabel = UILabel.titleLabel(
    text: "signin_email_title".localized,
    textColor: .labelTitle)
  private lazy var passwordTitleLabel = UILabel.titleLabel(
    text: "signin_password_title".localized,
    textColor: .labelTitle)
  private lazy var emailField = BaseTextField(
    target: self,
    selector: #selector(credentialsChanged),
    placeholder: "signin_email_placeholder".localized
  )
  private lazy var passwordField = PassTextField(
    target: self,
    selector: #selector(credentialsChanged),
    placeholder: "signin_password_placeholder".localized,
    isPassword: true
  )
  private lazy var forgetPasswordLabel = UILabel.titleLabel(
    text: "forgot_password_title".localized,
    textColor: .textLink
  )
  private lazy var signupTitleLabel = UILabel.titleLabel(
    text: "signup_title".localized,
    textColor: .labelTitle
  )
  private lazy var signupButton = UIButton.secondaryButton(
    color: .enableButton,
    title: "signup_button_title".localized,
    titleColor: .textEnableButton,
    target: self,
    action: #selector(tapOnSignInButton)
  )

  let activityIndicator = UIActivityIndicatorView()
  
  private let viewModel: SignInViewModelWithCredentials
  
  init(viewModel: SignInViewModelWithCredentials) {
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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }

  // MARK: - Actions
    
  @objc func credentialsChanged(_ sender: UITextField) {
    let newValue = sender.text ?? ""
    switch sender {
      case emailField:
        viewModel.email = newValue
      case passwordField:
        viewModel.password = newValue
      default: break
    }
  }

  @objc func tapOnSignInButton(_ sender: Any) {
    viewModel.login()
  }
  
  func setLoginButton(enabled: Bool) {
    logInButton.alpha = enabled ? 1 : 0.5
    logInButton.isEnabled = enabled
  }
}

private extension SignInViewController {
  
  func configureViews() {
    applyDefaultUIConfigs()
    setLoginButton(enabled: false)
    setupSiginCardView()
    setupSigupCardView()
    activateConstrains()
  }
  
  func activateConstrains() {
    signinCardView.translatesAutoresizingMaskIntoConstraints = false
    signupCardView.translatesAutoresizingMaskIntoConstraints = false
    emailField.translatesAutoresizingMaskIntoConstraints = false
    passwordField.translatesAutoresizingMaskIntoConstraints = false
    emailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    passwordTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    logInButton.translatesAutoresizingMaskIntoConstraints = false
    forgetPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
    cardImageView.translatesAutoresizingMaskIntoConstraints = false
    signupTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    signupButton.translatesAutoresizingMaskIntoConstraints = false
    
    let topMargin: CGFloat = 38.0
    let horizontalMargin: CGFloat = 28.0
    let labelSpacing: CGFloat = 8.0
    
    NSLayoutConstraint.activate([
        signinCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topMargin),
        signinCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
        signinCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalMargin),

        cardImageView.centerXAnchor.constraint(equalTo: signinCardView.centerXAnchor),
        cardImageView.topAnchor.constraint(equalTo: signinCardView.topAnchor, constant: 40),

        emailTitleLabel.leadingAnchor.constraint(equalTo: signinCardView.leadingAnchor, constant: horizontalMargin),
        emailTitleLabel.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 36),

        emailField.leadingAnchor.constraint(equalTo: signinCardView.leadingAnchor, constant: horizontalMargin),
        emailField.trailingAnchor.constraint(equalTo: signinCardView.trailingAnchor, constant: -horizontalMargin),
        emailField.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor, constant: labelSpacing),
        
        passwordTitleLabel.leadingAnchor.constraint(equalTo: signinCardView.leadingAnchor, constant: horizontalMargin),
        passwordTitleLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: labelSpacing),
        
        passwordField.leadingAnchor.constraint(equalTo: signinCardView.leadingAnchor, constant: horizontalMargin),
        passwordField.trailingAnchor.constraint(equalTo: signinCardView.trailingAnchor, constant: -horizontalMargin),
        passwordField.topAnchor.constraint(equalTo: passwordTitleLabel.bottomAnchor, constant: labelSpacing),

        logInButton.leadingAnchor.constraint(equalTo: signinCardView.leadingAnchor, constant: horizontalMargin),
        logInButton.trailingAnchor.constraint(equalTo: signinCardView.trailingAnchor, constant: -horizontalMargin),
        logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),

        forgetPasswordLabel.centerXAnchor.constraint(equalTo: signinCardView.centerXAnchor),
        forgetPasswordLabel.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 16),
        forgetPasswordLabel.bottomAnchor.constraint(equalTo: signinCardView.bottomAnchor, constant: -21),

        signupCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
        signupCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalMargin),
        signupCardView.topAnchor.constraint(equalTo: signinCardView.bottomAnchor, constant: 16),
        
        signupTitleLabel.centerXAnchor.constraint(equalTo: signupCardView.centerXAnchor),
        signupTitleLabel.topAnchor.constraint(equalTo: signupCardView.topAnchor, constant: 20),
        
        signupButton.leadingAnchor.constraint(equalTo: signupCardView.leadingAnchor, constant: horizontalMargin),
        signupButton.trailingAnchor.constraint(equalTo: signupCardView.trailingAnchor, constant: -horizontalMargin),
        signupButton.topAnchor.constraint(equalTo: signupTitleLabel.bottomAnchor, constant: 16),
        signupButton.bottomAnchor.constraint(equalTo: signupCardView.bottomAnchor, constant: -16),
        
    ])
  }

  private func setupCardImageView() {
    // Configure the card image view
    cardImageView.image = UIImage(named: "blackmarket_onboarding")
    signinCardView.addSubview(cardImageView)
  }

  private func setupSiginCardView() {
    signinCardView.backgroundColor = .white
    signinCardView.layer.cornerRadius = 8.0
    signinCardView.addSubview(emailTitleLabel)
    signinCardView.addSubview(passwordTitleLabel)
    passwordField.enablePasswordToggle()
    signinCardView.addSubview(passwordField)
    signinCardView.addSubview(emailField)
    signinCardView.addSubview(logInButton)
    signinCardView.addSubview(forgetPasswordLabel)
    setupCardImageView()
    view.addSubview(signinCardView)
  }

  private func setupSigupCardView() {
    signupCardView.backgroundColor = .white
    signupCardView.layer.cornerRadius = 8.0
    signupCardView.addSubview(signupTitleLabel)
    signupCardView.addSubview(signupButton)
    view.addSubview(signupCardView)
  }
}

extension SignInViewController: SignInViewModelDelegate {
  func didUpdateCredentials() {
    setLoginButton(enabled: viewModel.hasValidCredentials)
  }
}
