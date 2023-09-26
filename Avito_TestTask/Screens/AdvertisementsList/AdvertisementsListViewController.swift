import UIKit
import ProgressHUD

final class AdvertisementsListViewController: UIViewController {
    private let viewModel: AdvertisementsListViewModelProtocol
    
    private lazy var alertService: AlertServiceProtocol = {
        return AlertService(viewController: self)
    }()
    
    private lazy var advertisementsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.unWhite
        collectionView.register(AdvertisementCell.self, forCellWithReuseIdentifier: AdvertisementCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    init(viewModel: AdvertisementsListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
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
            self.viewModel.viewDidLoad()
        }
        let alert = UIAlertController(title: "Не удалось загрузить данные", message: errorMessage, preferredStyle: .alert)
        alert.addAction(reloadAction)
        present(alert, animated: true)
    }
    
    private func showContent() {
        self.hideLoading()
        self.advertisementsCollectionView.reloadData()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor.unWhite
        
        view.addViewWithNoTAMIC(advertisementsCollectionView)
        
        NSLayoutConstraint.activate([
            advertisementsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            advertisementsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            advertisementsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            advertisementsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension AdvertisementsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.advertisements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdvertisementCell.reuseIdentifier, for: indexPath) as? AdvertisementCell else { return UICollectionViewCell() }
        let model = viewModel.cellModels[indexPath.row]
        cell.configure(model)
        return cell
    }
}

// MARK: - UICollectionViewFlowLayout

extension AdvertisementsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let configuration = CollectionViewConfiguration.defaultConfiguration
        let width = (collectionView.bounds.width - CGFloat(configuration.totalSpacing)) / CGFloat(configuration.numberOfItemsPerRow)
        return CGSize(width: width, height: width * 1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        CollectionViewConfiguration.defaultConfiguration.sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewConfiguration.defaultConfiguration.itemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CollectionViewConfiguration.defaultConfiguration.lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationVC = AdvertisementDetailsViewController()
        navigationController?.pushViewController(destinationVC, animated: true)
        // Сделать роутер
    }
}
