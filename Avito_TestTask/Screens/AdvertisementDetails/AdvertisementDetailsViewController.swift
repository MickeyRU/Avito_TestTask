import UIKit
import ProgressHUD

final class AdvertisementDetailsViewController: UIViewController {
    private let viewModel: AdvertisementDetailsViewModel
    
    private lazy var detailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailsImageCell.self)
        tableView.register(DetailsDescriptionCell.self)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        return tableView
    }()
    
    init(viewModel: AdvertisementDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupViews()
    }
    
    private func bind() {
        viewModel.observeScreenState { [weak self] screenState in
            guard let self = self else { return }
            
            switch screenState {
            case .loading:
                self.showLoading()
            case .error(let errorMessage):
                self.showError(errorMessage)
            case .content:
                self.showContent()
            }
        }
    }
    
    private func showLoading() {
        ProgressHUD.show()
    }
    
    private func hideLoading() {
        ProgressHUD.dismiss()
    }
    
    private func showError(_ errorMessage: String) {
        self.hideLoading()
        let reloadAction = UIAlertAction(title: "Перезагрузить", style: .default) { _ in
            self.viewModel.loadData()
        }
        let alert = UIAlertController(title: "Не удалось загрузить данные", message: errorMessage, preferredStyle: .alert)
        alert.addAction(reloadAction)
        present(alert, animated: true)
    }
    
    private func showContent() {
        self.hideLoading()
        self.detailsTableView.reloadData()
    }
    
    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        setupCustomBackButton()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.unWhite
        
        view.addViewWithNoTAMIC(detailsTableView)
        
        NSLayoutConstraint.activate([
            detailsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension AdvertisementDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let advertisement = viewModel.cellModel else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            let cell: DetailsImageCell = tableView.dequeueReusableCell()
            cell.configure(advertisement)
            return cell
        case 1:
            let cell: DetailsDescriptionCell = tableView.dequeueReusableCell()
            cell.configure(advertisement)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return tableView.bounds.width
        default:
            return UITableView.automaticDimension
        }
    }
}

// MARK: - UITableViewDelegate

extension AdvertisementDetailsViewController: UITableViewDelegate {
    
}
