import UIKit
import ProgressHUD

final class AdvertisementDetailsViewController: UIViewController {
    private let viewModel: AdvertisementDetailsViewModel
    
    private lazy var detailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DetailsImageCell.self)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
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
                break
            case .error(let errorMessage):
                self.showError(errorMessage)
            case .content:
                self.showContent()
            }
        }
    }

    private func showError(_ errorMessage: String) {
        let reloadAction = UIAlertAction(title: "Перезагрузить", style: .default) { _ in
            self.viewModel.loadData()
        }
        let alert = UIAlertController(title: "Не удалось загрузить данные", message: errorMessage, preferredStyle: .alert)
        alert.addAction(reloadAction)
        present(alert, animated: true)
    }
    
    private func showContent() {
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
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DetailsImageCell = tableView.dequeueReusableCell()
        guard let advertisement = viewModel.advertisement else { return UITableViewCell() }
        cell.configure(advertisement)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.bounds.width
    }
}

// MARK: - UITableViewDataSource

extension AdvertisementDetailsViewController: UITableViewDelegate {
    
}
