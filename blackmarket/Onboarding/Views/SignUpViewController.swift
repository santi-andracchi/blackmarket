import UIKit

class SignUpViewController: UIViewController, ActivityIndicatorPresenter {
  
  // MARK: - Outlets
  
  private lazy var signUpButton = UIButton.primaryButton(
    color: .disableButton,
    title: "signup_button_title".localized,
    titleColor: .textDisableButton,
    target: self,
    action: #selector(signUpTapped)
  )
  private lazy var cardView = UIView()
  private lazy var cardImageView = UIImageView()
  private lazy var emailTitleLabel = UILabel.titleLabel(
    text: "signup_email_title".localized,
    textColor: .labelTitle)
  private lazy var passwordTitleLabel = UILabel.titleLabel(
    text: "signup_password_title".localized,
    textColor: .labelTitle)
  private lazy var fullNameTitleLabel = UILabel.titleLabel(
    text: "signup_full_name_title".localized,
    textColor: .labelTitle)
  private lazy var signupPolicyLabel = UILabel.titleLabel(
    text: "signup_policy_label".localized,
    textColor: .labelTitle,
    textAlignment: .center
  )
  private lazy var signuploginLabel = UILabel.titleLabel(
    text: "signup_login_label".localized,
    textColor: .labelTitle,
    textAlignment: .center
  )
  
  private lazy var emailField = BaseTextField(
    target: self,
    selector: #selector(credentialsChanged),
    placeholder: "signup_email_placeholder".localized
  )
  private lazy var passwordField = PassTextField(
    target: self,
    selector: #selector(credentialsChanged),
    placeholder: "signup_password_placeholder".localized,
    isPassword: true
  )
  private lazy var fullNameField = BaseTextField(
    target: self,
    selector: #selector(credentialsChanged),
    placeholder: "signup_full_name_placeholder".localized
  )
  
  let activityIndicator = UIActivityIndicatorView()
  
  private let viewModel: SignUpViewModelWithEmail
  
  init(viewModel: SignUpViewModelWithEmail) {
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
      viewModel.passwordConfirmation = newValue
    default: break
    }
  }
  
  @objc func tapOnSignInButton(_ sender: Any) {
    // viewModel.signup()
  }
  
  func setSignUpButton(enabled: Bool) {
    signUpButton.alpha = enabled ? 1 : 0.5
    signUpButton.isEnabled = enabled
  }
}

private extension SignUpViewController {
  
  func configureViews() {
    applyDefaultUIConfigs()
    setSignUpButton(enabled: true)
    setupCardView()
    activateConstrains()
  }
  
  func activateConstrains() {
    cardView.translatesAutoresizingMaskIntoConstraints = false
    cardImageView.translatesAutoresizingMaskIntoConstraints = false
    emailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    emailField.translatesAutoresizingMaskIntoConstraints = false
    fullNameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    fullNameField.translatesAutoresizingMaskIntoConstraints = false
    passwordTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    passwordField.translatesAutoresizingMaskIntoConstraints = false
    signUpButton.translatesAutoresizingMaskIntoConstraints = false
    signupPolicyLabel.translatesAutoresizingMaskIntoConstraints = false
    signuploginLabel.translatesAutoresizingMaskIntoConstraints = false
    
    let topMargin: CGFloat = 38.0
    let horizontalMargin: CGFloat = 28.0
    let labelSpacing: CGFloat = 8.0
    
    NSLayoutConstraint.activate([
      cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topMargin),
      cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: horizontalMargin),
      cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -horizontalMargin),
      
      cardImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
      cardImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 40),
      
      emailTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: horizontalMargin),
      emailTitleLabel.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 36),
      
      emailField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: horizontalMargin),
      emailField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -horizontalMargin),
      emailField.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor, constant: labelSpacing),
      
      fullNameTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: horizontalMargin),
      fullNameTitleLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: labelSpacing),
      
      fullNameField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: horizontalMargin),
      fullNameField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -horizontalMargin),
      fullNameField.topAnchor.constraint(equalTo: fullNameTitleLabel.bottomAnchor, constant: labelSpacing),
      
      passwordTitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: horizontalMargin),
      passwordTitleLabel.topAnchor.constraint(equalTo: fullNameField.bottomAnchor, constant: labelSpacing),
      
      passwordField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: horizontalMargin),
      passwordField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -horizontalMargin),
      passwordField.topAnchor.constraint(equalTo: passwordTitleLabel.bottomAnchor, constant: labelSpacing),
      
      signUpButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: horizontalMargin),
      signUpButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -horizontalMargin),
      signUpButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
      
      signupPolicyLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
      signupPolicyLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: horizontalMargin),
      signupPolicyLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -horizontalMargin),
      signupPolicyLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 16),
      
      signuploginLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: horizontalMargin),
      signuploginLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -horizontalMargin),
      signuploginLabel.topAnchor.constraint(equalTo: signupPolicyLabel.bottomAnchor, constant: 16),
      signuploginLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16)
    ])
  }
  
  private func setupCardImageView() {
    // Configure the card image view
    cardImageView.image = UIImage(named: "blackmarket_onboarding")
    cardView.addSubview(cardImageView)
  }
  
  private func setupCardView() {
    cardView.backgroundColor = .white
    cardView.layer.cornerRadius = 8.0
    setupCardImageView()
    cardView.addSubview(emailTitleLabel)
    cardView.addSubview(emailField)
    cardView.addSubview(passwordTitleLabel)
    passwordField.enablePasswordToggle()
    cardView.addSubview(passwordField)
    cardView.addSubview(fullNameTitleLabel)
    cardView.addSubview(fullNameField)
    cardView.addSubview(signUpButton)
    cardView.addSubview(signupPolicyLabel)
    cardView.addSubview(signuploginLabel)
    view.addSubview(cardView)
  }
  
  @objc
  func signUpTapped() async {
    await viewModel.signup()
  }
}

extension SignUpViewController: SignUpViewModelDelegate {
  
  func formDidChange() {
    setSignUpButton(enabled: viewModel.hasValidData)
  }
  
}
