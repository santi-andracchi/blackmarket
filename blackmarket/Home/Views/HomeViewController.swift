import UIKit

class HomeViewController: UIViewController, ActivityIndicatorPresenter, UITableViewDataSource {
  
  // MARK: - Outlets
  
  private lazy var mainTableView = UITableView()
  
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
    configHomeTableView()
    activateConstraints()
  }
  
  private func configHomeTableView() {
    mainTableView.register(HeaderViewCell.self, forCellReuseIdentifier: "HeaderViewCell")
    mainTableView.register(SearchProductViewCell.self, forCellReuseIdentifier: "SearchProductViewCell")
    mainTableView.register(ProductListCell.self, forCellReuseIdentifier: "ProductListCell")
    mainTableView.register(LinkTitleViewCell.self, forCellReuseIdentifier: "LinkTitleViewCell")
    mainTableView.register(DiscountAdViewCell.self, forCellReuseIdentifier: "DiscountAdViewCell")
    mainTableView.register(PaymentMethodsViewCell.self, forCellReuseIdentifier: "PaymentMethodsViewCell")
    mainTableView.backgroundColor = UIColor(red: 0.957, green: 0.969, blue: 0.98, alpha: 1)
    mainTableView.dataSource = self
    view.addSubview(mainTableView)
  }
  
  private func activateConstraints() {
    mainTableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
      mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell =  tableView.dequeueReusableCell(withIdentifier: "HeaderViewCell", for: indexPath) as! HeaderViewCell
      cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
      return cell
    } else if indexPath.row == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SearchProductViewCell", for: indexPath) as! SearchProductViewCell
      cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
      return cell
    } else if indexPath.row == 2 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell", for: indexPath) as! ProductListCell
      cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
      return cell
    } else if indexPath.row == 3 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "LinkTitleViewCell", for: indexPath) as! LinkTitleViewCell
      cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
      return cell
    } else if indexPath.row == 4 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "DiscountAdViewCell", for: indexPath) as! DiscountAdViewCell
      cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentMethodsViewCell", for: indexPath) as! PaymentMethodsViewCell
      cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
      return cell
    }
  }
}
